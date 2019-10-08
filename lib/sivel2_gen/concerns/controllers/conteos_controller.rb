# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Controllers
      module ConteosController
        extend ActiveSupport::Concern

        included do

          include Sip::FormatoFechaHelper

          ##
          # Agrega una nueva tabla al listado $t
          #
          # @param string &$t Listado de tablas separadas por ,
          # @param string $nt Nueva tabla por agregar si falta
          #
          # @return string cadena t completada para asegurar tabla
          #/
          def agrega_tabla(t, nt)
            at = t.split(',')
            if (!at.include? nt)
              at << nt
            end
            t = at.join(",")
          end

          ##
          # Agrega condición a WHERE en un SELECT de SQL
          #
          # @param unknown &$db   Conexión a base de datos
          # @param string  &$w    cadena con WHERE que se completa
          # @param string  $n     nombre de campo
          # @param string  $v     valor esperado
          # @param string  $opcmp operador de comparación por usar.
          # @param string  $con   con
          #
          # @return string cadena w completada con nueva condición
          def consulta_and(w, n, v, opcmp = '=', con='AND')
            if (!v || v === '' || $v === ' ') 
              return
            end
            if (w != "") 
              w += " #{con}"
            end
            w += " " + n + opcmp + Sivel2Gen::Caso.connection.quote(v)
          end


          ##
          # Como la función anterior sólo que el valor no lo pone entre 
          # apostrofes y supone que ya viene escapado el valor $v
          #
          # @param string &$w    cadena con WHERE que se completa
          # @param string $n     nombre de campo
          # @param string $v     valor esperado
          # @param string $opcmp operador de comparación por usar.
          # @param string $con   con
          #
          # @return string cadena w completada con nueva condición
          #/
          def consulta_and_sinap(w, n, v, opcmp = '=', con = "AND")
            if (w != "") 
              w += " " + con
            end
            w += " " + n + opcmp + v
          end

          def cadena_escapa(c)
            Sivel2Gen::Caso.connection.quote_string(c)
          end

          def param_escapa(p)
            if (p.is_a? String) || (p.is_a? Symbol) then
              params[p] ? cadena_escapa(params[p]) : ''
            elsif (p.is_a? Array) && p.length == 1 then
              params[p[0]] ? cadena_escapa(params[p[0]]) : ''
            elsif (p.is_a? Array) && p.length > 1 && params[p[0]] then
              n = params[p[0]]
              i = 1
              while i < (p.length - 2) do
                if n[p[i]] then
                  n = n[p[i]]
                else
                  return ''
                end
                i += 1
              end
              if n[p[i]] then
                return cadena_escapa(n[p[i]])
              else
                return ''
              end
            else
              return ''
            end
          end

          @pDepartamento = ''
          @pMunicipio = ''
          @pSegun = ''

          def personas_cons1 
            'public.cben1'
          end

          def personas_cons2
            'public.cben2';
          end

          # Llena variables de clase: @opsegun, @titulo_personas,
          # @titulo_personas_fecha y otras nuevas relacionads con filtros
          # (prefijo p)
          def personas_filtros_especializados
            @opsegun =  ["", "AÑO DE NACIMIENTO", "ETNIA", "FILIACIÓN", 
                         "MES CASO", "ORGANIZACIÓN", "PROFESIÓN", 
                         "RANGO DE EDAD", "SECTOR SOCIAL", "SEXO", 
                         Sivel2Gen::Victima.human_attribute_name(:vinculoestado).upcase
#                         "VÍNCULO CON EL ESTADO" 
            ]
            @titulo_personas = 'Demografía de Víctimas'
            @titulo_personas_fecha = 'Fecha del Caso'
          end

          # Restringe con base en @fechaini
          def personas_fecha_inicial(where1)
            return consulta_and(
              where1, "caso.fecha", @fechaini, ">="
            )
          end

          # Restringe con base en @fechafin
          def personas_fecha_final(where1)
            return consulta_and(
                where1, "caso.fecha", @fechafin, "<="
              )
          end



          #  Retorns consultas y llena variables de clase usadas
          # en formulario como @fechaini, @fechafin
          # No procesa pSegun
          def personas_procesa_filtros(que1, tablas1, where1, que3, tablas3, where3)
           #byebug
            return [que1, tablas1, where1, que3, tablas3, where3]
          end

          def personas_segun_tipico(tabla, nomtabla, que1, que3, tablas3, where3)
            que1 = agrega_tabla(
              que1, "victima.id_#{tabla} AS id_#{tabla}")
            tablas3 = agrega_tabla(
              tablas3, "public.sivel2_gen_#{tabla} AS #{tabla}")
            where3 = consulta_and_sinap(
              where3, "id_#{tabla}", "#{tabla}.id")
            que3 << ["#{tabla}.nombre", nomtabla]
            return [que1, que3, tablas3, where3]
          end


          def personas_procesa_segun_om(que1, tablas1, where1, que3, tablas3, where3)
            case @pSegun
            when ''
              que1 = agrega_tabla(que1, 'cast(\'total\' as text) as total')
              que3 << ["", ""]

            when 'AÑO DE NACIMIENTO'
              que1 = agrega_tabla(que1, 'persona.anionac AS anionac')
              tablas1 = agrega_tabla(tablas1, 'public.sip_persona AS persona')
              where1 = consulta_and_sinap(
                where1, "persona.id", "victima.id_persona")
              que3 << ["anionac", "Año de Nacimiento"]

            when 'ETNIA'
              que1, que3, tablas3, where3 = personas_segun_tipico(
                'etnia', 'Etnia', que1, que3, tablas3, where3
              )

            when 'FILIACIÓN'
              que1, que3, tablas3, where3 = personas_segun_tipico(
                'filiacion', 'Filiacion', que1, que3, tablas3, where3
              )

            when 'MES CASO'
              que1 = agrega_tabla(
                que1, "extract(year from fecha) || '-' " +
                "|| lpad(cast(extract(month from fecha) as text), 2, " +
                "cast('0' as text)) as mes")
              que3 << ["mes", "Mes"]

            when 'ORGANIZACIÓN'
              que1, que3, tablas3, where3 = personas_segun_tipico(
                'organizacion', 'Organización', 
                que1, que3, tablas3, where3
              )

            when 'PROFESIÓN'
              que1, que3, tablas3, where3 = personas_segun_tipico(
                'profesion', 'Profesion', 
                que1, que3, tablas3, where3
              )

            when 'RANGO DE EDAD'
              que1, que3, tablas3, where3 = personas_segun_tipico(
                'rangoedad', 'Rango de Edad', 
                que1, que3, tablas3, where3
              )

            when 'SECTOR SOCIAL'
              que1, que3, tablas3, where3 = personas_segun_tipico(
                'sectorsocial', 'Sector Social', 
                que1, que3, tablas3, where3
              )

            when Sivel2Gen::Victima.human_attribute_name(:vinculoestado).upcase
              que1, que3, tablas3, where3 = personas_segun_tipico(
                'vinculoestado', Sivel2Gen::Victima.human_attribute_name(:vinculoestado),
                que1, que3, tablas3, where3
              )

            when 'SEXO'
              que1 = agrega_tabla(que1, 'persona.sexo AS sexo')
              tablas1 = agrega_tabla(tablas1, 'public.sip_persona AS persona')
              where1 = consulta_and_sinap(
                where1, "persona.id", "victima.id_persona")
              que3 << ["sexo", "Sexo"]


            else
              puts "opción desconocida pSegun=#{@pSegun}"
            end

            return que1, tablas1, where1, que3, tablas3, where3
          end


          def personas_procesa_segun(que1, tablas1, where1, que3, tablas3, where3)
            return personas_procesa_segun_om(
              que1, tablas1, where1, que3, tablas3, where3
            )
          end


          # A partir de vista personas_cons1, crea vista personas_cons2 que añade
          # información geografica
          def personas_vista_geo(que3, tablas3, where3)
            if (@pDepartamento == "1") 
              que3 << ["departamento_nombre", "Departamento"]
            end
            if (@pMunicipio== "1") 
              que3 << ["municipio_nombre", "Municipio"]
            end

            return ["CREATE VIEW #{personas_cons2} AS SELECT #{personas_cons1}.*,
            ubicacion.id_departamento, 
            departamento.nombre AS departamento_nombre, 
            ubicacion.id_municipio, municipio.nombre AS municipio_nombre, 
            ubicacion.id_clase, clase.nombre AS clase_nombre
            FROM
            #{personas_cons1} LEFT JOIN sip_ubicacion AS ubicacion ON
              (#{personas_cons1}.id_caso = ubicacion.id_caso) 
            LEFT JOIN sip_departamento AS departamento ON 
              (ubicacion.id_departamento=departamento.id) 
            LEFT JOIN sip_municipio AS municipio ON 
              (ubicacion.id_municipio=municipio.id)
            LEFT JOIN sip_clase AS clase ON 
              (ubicacion.id_clase=clase.id)
            GROUP BY 1,2,3,4,5,6,7,8,9,10", que3, tablas3, where3]
          end

          # Genera q3 y llena @coltotales
          def personas_consulta_final(i, que3, tablas3, where3, qc, gb)
            @coltotales = [i-1]
            que3 << ["", "Víctimas"]
            twhere3 = where3 == "" ? "" : "WHERE " + where3
            q3="SELECT #{qc}
            SUM(#{personas_cons2}.npersona) AS npersona
            FROM #{tablas3}
            #{twhere3}
            #{gb}"
            #puts "OJO q3 es #{q3}"
            return q3
          end

          def personas
            authorize! :contar, Sivel2Gen::Caso

            @pSegun = param_escapa([:filtro, 'segun'])
            @pMunicipio = param_escapa([:filtro, 'municipio'])
            @pDepartamento = param_escapa([:filtro, 'departamento'])
            personas_filtros_especializados()

            # La estrategia es 
            # 1. Agrupar en la vista personas_cons1 personas con lo que se contará 
            #    restringiendo por filtros con códigos sin desp. ni info geog.
            # 2. En vista personas_cons2 dejar lo mismo que en personas_cons1, pero añadiendo
            #    info geografica.
            # 3. Contar victima sobre personas_cons2, cambiar códigos
            #    por información por desplegar

            # Validaciones todo caso tiene victima
            # Validaciones todo caso tiene ubicacion
            where1 = '';
            @fechaini = '';
            @fechafin = '';
            if (params[:filtro] && params[:filtro]['fechaini'] && 
                params[:filtro]['fechaini'] != "") 
              @fechaini = fecha_local_estandar(params[:filtro]['fechaini'])
              where1 = personas_fecha_inicial(where1)
            end
            if (params[:filtro] && params[:filtro]['fechafin'] && 
                params[:filtro]['fechafin'] != "") 
              @fechafin = fecha_local_estandar(params[:filtro]['fechafin'])
              where1 = personas_fecha_final(where1)
            end
            que1 = 'caso.id AS id_caso, victima.id_persona AS id_persona,
            1 AS npersona'
            tablas1 = 'public.sivel2_gen_caso AS caso, public.sivel2_gen_victima AS victima'
            where1 = consulta_and_sinap(where1, "caso.id", "victima.id_caso")

            # Para la consulta final emplear arreglo que3, que tendrá parejas
            # (campo, titulo por presentar en tabla)
            que3 = []
            tablas3 = "#{personas_cons2}"
            where3 = ''
            que1, tablas1, where1, que3, tablas3, where3 = 
              personas_procesa_filtros(
                que1, tablas1, where1, que3, tablas3, where3
            )

            que1, tablas1, where1, que3, tablas3, where3 = 
              personas_procesa_segun(que1, tablas1, where1, que3, tablas3, where3)
            ActiveRecord::Base.connection.execute "DROP VIEW  IF EXISTS #{personas_cons2}"
            ActiveRecord::Base.connection.execute "DROP VIEW  IF EXISTS #{personas_cons1}"

            if where1 != ''
              where1 = 'WHERE ' + where1
            end
            # Filtrar 
            q1="CREATE VIEW #{personas_cons1} AS 
              SELECT #{que1}
              FROM #{tablas1} #{where1}
            "
            puts "OJO q1 es #{q1}<hr>"
            ActiveRecord::Base.connection.execute q1

            # Paso 2
            # Añadimos información geográfica que se pueda
            q2, que3, tablas3, where3 = 
              personas_vista_geo(que3, tablas3, where3)
            #puts "OJO q2 es #{q2}<hr>"
            ActiveRecord::Base.connection.execute q2

            #puts "OJO que3 es #{que3}"
            # Generamos 1,2,3 ...n para GROUP BY
            gb = sep = ""
            qc = ""
            i = 1
            que3.each do |t|
              if (t[1] != "") 
                gb += sep + i.to_s
                qc += t[0] + ", "
                sep = ", "
                i += 1
              end
            end
            if (gb != "") 
              gb ="GROUP BY #{gb} ORDER BY #{gb}"
            end
            q3 = personas_consulta_final(i, que3, tablas3, where3, qc, gb)
            @cuerpotabla = ActiveRecord::Base.connection.select_all(q3)

            @enctabla = []
            que3.each do |t|
              if (t[1] != "") 
                @enctabla << CGI.escapeHTML(t[1])
              end
            end

            respond_to do |format|
              format.html { render 'sivel2_gen/conteos/personas', layout: 'application' }
              format.json { head :no_content }
              format.js   { render 'sivel2_gen/conteos/resultado' }
            end
          end # def personas
          
        end


        def victimizaciones
          authorize! :contar, Sivel2Gen::Caso

          # Filtros
          pFini = param_escapa([:filtro, 'fechaini'])
          pFfin = param_escapa([:filtro, 'fechafin'])
          pTviolencia = param_escapa([:filtro, 'tviolencia_id'])
          pEtiqueta1 = param_escapa([:filtro, 'etiqueta1'])
          pEtiqueta2 = param_escapa([:filtro, 'etiqueta2'])
          pSegun = param_escapa([:filtro, 'segun'])

          # Desagregar
          pMunicipio = param_escapa([:filtro, 'municipio'])
          pDepartamento = param_escapa([:filtro, 'departamento'])

          @opsegun =  ["", 
            "ACTOS PRESUNTOS RESPONSABLES", 
            "FILIACIÓN", 
            "MES CASO", 
            "ORGANIZACIÓN SOCIAL", 
            "PROFESIÓN", 
            "RANGO DE EDAD", 
            "SECTOR SOCIAL", 
            "SEXO"
          ]

          #pContar='victimizaciones'
          #if (pContar == '') 
          #  pContar = pContarDef
          #end

          #byebug
          tcons1 = 'cvt1'
          # La estrategia es 
          # 1. Agrupar en la vista tcons1 respuesta con lo que se contará 
          #    con máxima desagregación restringiendo por filtros con códigos 
          # 2. Contar derechos/respuestas tcons1, cambiar códigos
          #    por información por desplegar

          # Para la vista tcons1 emplear que1, tablas1 y where1
          que1 = 'DISTINCT acto.id_caso, acto.id_persona, acto.id_categoria, 
            supracategoria.id_tviolencia AS id_tviolencia, 
            categoria.nombre AS categoria'
          tablas1 = ' public.sivel2_gen_acto AS acto JOIN ' +
            'public.sivel2_gen_caso AS caso ON acto.id_caso=caso.id ' +
            'JOIN public.sivel2_gen_categoria AS categoria ' + 
            ' ON acto.id_categoria=categoria.id ' +
            'JOIN public.sivel2_gen_supracategoria AS supracategoria ' + 
            ' ON categoria.supracategoria_id=supracategoria.id ' +
            'JOIN public.sivel2_gen_victima AS victima ' + 
            ' ON victima.id_persona=acto.id_persona AND ' +
            ' victima.id_caso=caso.id ' +
            'JOIN public.sip_persona AS persona ' + 
            ' ON persona.id=acto.id_persona'
          where1 = ''

          # Para la consulta final emplear arreglo que3, que tendrá parejas
          # (campo, titulo por presentar en tabla)
          que3 = []
          tablas3 = tcons1
          where3 = ''

          if (pFini != '') 
            pfechaini = DateTime.strptime(pFini, '%Y-%m-%d')
            @fechaini = pfechaini.strftime('%Y-%m-%d')
            where1 = consulta_and(
              where1, "caso.fecha", @fechaini, ">="
            )
          end
          if (pFfin != '') 
            pfechafin = DateTime.strptime(pFfin, '%Y-%m-%d')
            @fechafin = pfechafin.strftime('%Y-%m-%d')
            where1 = consulta_and(
              where1, "caso.fecha", @fechafin, "<="
            )
          end
          if (pTviolencia != '') 
            where1 = consulta_and(
              where1, "id_tviolencia", pTviolencia[0], "="
            )
          end
          if (pEtiqueta1 != '' || pEtiqueta2 != '')
            tablas1 += ' JOIN sivel2_gen_caso_etiqueta AS caso_etiqueta ON' +
              ' caso.id=caso_etiqueta.id_caso' 
            if (pEtiqueta1 != '') 
              where1 = consulta_and(
               where1, "caso_etiqueta.id_etiqueta", pEtiqueta1, "="
            )
            end
            if (pEtiqueta2 != '') 
              where1 = consulta_and(
               where1, "caso_etiqueta.id_etiqueta", pEtiqueta2, "="
              )
            end
          end

          que3 << ["id_tviolencia", 'T. Violencia']
          que3 << ["id_categoria", 'Id. Categoria']
          que3 << ["categoria", 'Categoria']

          if (pDepartamento.to_i == 1 || pMunicipio.to_i == 1) 
            que3 << ["departamento_nombre", "Departamento"]
            que1 += ', ubicacion.id_departamento' +
              ', departamento.nombre AS departamento_nombre'
            # Tomamos ubicacion principal
            tablas1 += ' LEFT JOIN sip_ubicacion AS ubicacion ON' +
              ' caso.ubicacion_id = ubicacion.id'
            tablas1 += ' LEFT JOIN sip_departamento AS departamento ON ' +
              ' ubicacion.id_departamento=departamento.id'
          end

          if (pMunicipio.to_i == 1) 
            que3 << ["municipio_nombre", "Municipio"]
            que1 += ', ubicacion.id_municipio' +
              ', municipio.nombre AS municipio_nombre'
            tablas1 += ' LEFT JOIN sip_municipio AS municipio ON ' +
              ' ubicacion.id_municipio=municipio.id'
          end

          if pSegun && pSegun != ''
            case pSegun
            when "ACTOS PRESUNTOS RESPONSABLES"
            que3 << ["presponsable_nombre", "P. Responsable"]
            que1 += ', presponsable.id, presponsable.nombre AS presponsable_nombre' 
            tablas1 += ' LEFT JOIN sivel2_gen_presponsable AS presponsable ON ' +
              ' acto.id_presponsable=presponsable.id'

            when "FILIACIÓN"
            que3 << ["filiacion_nombre", "Filiacion"]
            que1 += ', filiacion.id, filiacion.nombre AS filiacion_nombre' 
            tablas1 += ' LEFT JOIN public.sivel2_gen_filiacion AS filiacion ON ' +
              ' victima.id_filiacion=filiacion.id'

            when "MES CASO"
              que3 << ["mes_anio", "Mes"]
              que1 += ", TO_CHAR(EXTRACT(YEAR FROM caso.fecha), '0000') || " +
                " '-' || TO_CHAR(EXTRACT(MONTH FROM caso.fecha),'00') " +
                "AS mes_anio" 

            when "ORGANIZACIÓN SOCIAL"
              que3 << ["organizacion_nombre", "Organización"]
              que1 += ', organizacion.id, organizacion.nombre AS organizacion_nombre' 
              tablas1 += ' LEFT JOIN public.sivel2_gen_organizacion AS organizacion ON ' +
                ' victima.id_organizacion=organizacion.id'

            when "PROFESIÓN"
              que3 << ["profesion_nombre", "Profesión"]
              que1 += ', profesion.id, profesion.nombre AS profesion_nombre' 
              tablas1 += ' LEFT JOIN public.sivel2_gen_profesion AS profesion ON ' +
                ' victima.id_profesion=profesion.id'


            when "RANGO DE EDAD"
              que3 << ["rangoedad_rango", "Rango de edad"]
              que1 += ', rangoedad.id, rangoedad.rango AS rangoedad_rango' 
              tablas1 += ' LEFT JOIN public.sivel2_gen_rangoedad AS rangoedad ON ' +
                ' victima.id_rangoedad=rangoedad.id'

            when "SECTOR SOCIAL"
              que3 << ["sectorsocial_nombre", "Sector social"]
              que1 += ', sectorsocial.id, sectorsocial.nombre AS sectorsocial_nombre' 
              tablas1 += ' LEFT JOIN public.sivel2_gen_sectorsocial AS sectorsocial ON ' +
                ' victima.id_sectorsocial=sectorsocial.id'

            when "SEXO"
              que3 << ["sexo", "Sexo"]
              que1 += ', persona.sexo AS sexo' 
              tablas1 += ' LEFT JOIN public.sivel2_gen_profesion AS profesion ON ' +
                ' victima.id_profesion=profesion.id'
            end
          end


          if where1 != ''
            where1 = "WHERE #{where1}"
          end
          ActiveRecord::Base.connection.execute "DROP VIEW  IF EXISTS #{tcons1}"
          # Filtrar 
          q1="CREATE VIEW #{tcons1} AS 
          SELECT #{que1}
          FROM #{tablas1} #{where1} "
          puts "q1 es #{q1}"
          ActiveRecord::Base.connection.execute q1


#          "CREATE VIEW #{tcons2} AS SELECT #{tcons1}.*,
#            ubicacion.id_departamento, departamento.nombre AS departamento_nombre, 
#            ubicacion.id_municipio, municipio.nombre AS municipio_nombre, 
#            ubicacion.id_clase, clase.nombre AS clase_nombre
#            FROM
#            #{tcons1} LEFT JOIN sip_ubicacion AS ubicacion ON
#              (#{tcons1}.id_caso = ubicacion.id_caso) 
#            LEFT JOIN sip_departamento AS departamento ON 
#              (ubicacion.id_departamento=departamento.id) 
#            LEFT JOIN sip_municipio AS municipio ON 
#              (ubicacion.id_municipio=municipio.id)
#            LEFT JOIN sip_clase AS clase ON 
#              (ubicacion.id_clase=clase.id)"
#
#
          puts que3
#          # Generamos 1,2,3 ...n para GROUP BY
          gb = sep = ""
          qc = ""
          i = 1
          que3.each do |t|
            if (t[1] != "") 
              gb += sep + i.to_s
              qc += t[0] + ", "
              sep = ", "
              i += 1
            end
          end

          @coltotales = [i-1, i]
          if (gb != "") 
            gb ="GROUP BY #{gb}" #ORDER BY #{i} DESC"
          end
          gb += " ORDER BY id_categoria"
          que3 << ["", "Victimizaciones"]
          twhere3 = where3 == "" ? "" : "WHERE " + where3
          q3 = "SELECT #{qc}
              COUNT(cast(#{tcons1}.id_caso as text))
              FROM #{tablas3}
              #{twhere3}
              #{gb} 
          "
	#q3 = "SELECT COUNT(*) FROM #{tcons1}"
          puts "q3=#{q3}"
          @cuerpotabla = ActiveRecord::Base.connection.select_all(q3)

          @enctabla = []
          que3.each do |t|
            if (t[1] != "") 
              @enctabla << CGI.escapeHTML(t[1])
            end
          end

          respond_to do |format|
            format.html { render 'victimizaciones', layout: 'application'}
            format.json { head :no_content }
            format.js   { render 'sivel2_gen/conteos/resultado' }
          end
        end # def victimizaciones



        def cuenta_actos(cat, where)
          w = where
          w = consulta_and_sinap(w, "sivel2_gen_caso.id", 
                                 "sivel2_gen_acto.id_caso");
          w = consulta_and(w, "sivel2_gen_acto.id_categoria", cat.to_i);
          q = "SELECT count(*) FROM (SELECT DISTINCT sivel2_gen_acto.id_caso, 
            sivel2_gen_acto.id_persona, sivel2_gen_acto.id_categoria 
            FROM public.sivel2_gen_caso, public.sivel2_gen_acto
            WHERE #{w}) AS subcuentaactos;";
          r = ActiveRecord::Base.connection.select_all(q)
          #byebug
          return r[0]["count"];
        end

        def genvic_tabla(titulo, filas, tittotales, where1)
          cuerpo = []
          tot = 0;
          filas.each do |f|
            s = 0;
            f["cat"].each do |c|
              mult = 1;
              if (c < 0)
                mult = -1;
                c = -c;
              end
              s += mult * cuenta_actos(c, where1);
            end
            cuerpo << [f["titulo"], s.to_s]
            tot += s
          end
          cuerpo << [tittotales, tot]
          return { 
            titulo: titulo, 
            cuerpo: cuerpo
          }
        end

        def genvic
          authorize! :contar, Sivel2Gen::Caso

          where1 = '';
          @fechaini = '';
          @fechafin = '';
          if (params[:filtro] && params[:filtro]['fechaini'] && 
              params[:filtro]['fechaini'] != "") 
            @fechaini = fecha_local_estandar(params[:filtro]['fechaini'])
            where1 = personas_fecha_inicial(where1)
          end
          if (params[:filtro] && params[:filtro]['fechafin'] && 
              params[:filtro]['fechafin'] != "") 
            @fechafin = fecha_local_estandar(params[:filtro]['fechafin'])
            where1 = personas_fecha_final(where1)
          end
          @tablader = [
            { 
              titulo: 'DERECHO A LA VIDA',
              tablas: [
                genvic_tabla(
                  '', 
                  [
                    {"cat" => [20, 30],
                     "titulo" => "Víctimas de Ejecución Extrajudicial por Abuso de Autoridad e Intolerancia Social por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)"},
                    {"cat" => [10],
                     "titulo" => "Víctimas registradas simultáneamente como Ejecuciones Extrajudiciales perpetradas por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y como Homicidios Intencionales de personas protegidas (Infracciones al Derecho Internacional Humanitario)."},
                    {"cat" => [701, -10, 97, 703, 87],
                     "titulo" => "Víctimas de Homicidio Intencional de Persona Protegida (excepto casos de Violaciones a Derechos Humanos) o Civiles Muertos por uso de Métodos y Medios Ilícitos de guerra o Civiles Muertos en Acciones Bélicas o en Ataques a Bienes Civiles."},
                    {"cat" => [40, 50],
                     "titulo" => "Víctimas de Asesinatos por Móviles Político-Sociales sin autor determinado"}
                  ], "Total víctimas que perdieron la vida", where1
                )
              ]
            }, 
            {
              titulo: 'INTEGRIDAD',
              tablas: [
                genvic_tabla(
                  'HERIDOS', 
                  [
                    {"cat" => [23, 33],
                     "titulo" => "Víctimas de Ejecución Extrajudicial por Abuso de Autoridad e Intolerancia Social por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)"},
                    {"cat" => [13],
                     "titulo" => "Víctimas registradas simultáneamente como Heridas por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y como Heridas Intencionales de personas protegidas (Infracciones al Derecho Internacional Humanitario)."},
                    {"cat" => [702, -13, 98, 704, 88],
                     "titulo" => "Víctimas de Herida Intencional de Persona Protegida (excepto casos de Violación a Derechos Humanos) o Civiles Heridos por uso de Métodos y Medios Ilícitos de guerra o Civiles Heridos en Acciones Bélicas o en Ataques a Bienes Civiles."}
                  ], "Total víctimas heridas", where1
                ),
                genvic_tabla(
                  'AMENAZAS', 
                  [
                    {"cat" => [25, 35],
                     "titulo" => "Víctimas de Amenaza por Abuso de Autoridad e Intolerancia Social por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)."},
                    {"cat" => [15],
                     "titulo" => "Víctimas registradas simultáneamente como Amenazadas por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y como víctimas de Amenazas que constituyen Infracciones al Derecho Internacional Humanitario por parte de agentes directos o indirectos del Estado."},
                    {"cat" => [73, -15],
                     "titulo" => "Víctimas de Amenaza como Infracciones al Derecho Internacional Humanitario por parte de la insurgencia o combatientes."}
                  ], "Total víctimas de amenazas", where1
                ),
                genvic_tabla(
                  'TORTURA', 
                  [
                    {"cat" => [22, 36],
                     "titulo" => "Víctimas de Tortura por Abuso de Autoridad e Intolerancia Social por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)."},
                    {"cat" => [12],
                     "titulo" => "Víctimas registradas simultáneamente como Torturadas por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y como víctimas de Tortura que constituye Infracción al Derecho Internacional Humanitario por parte de agentes directos o indirectos del Estado."},
                    {"cat" => [72, -12],
                     "titulo" => "Víctimas de Tortura como Infracciones al Derecho Internacional Humanitario por parte de la insurgencia o combatientes."}
                  ], "Total víctimas de tortura", where1
                ),
                genvic_tabla(
                  'ATENTADOS', 
                  [
                    {"cat" => [16, 26, 37],
                     "titulo" => "Víctimas de Atentados por Persecución Política, Abuso de Autoridad o Intolerancia Social por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)."}
                  ], "Total víctimas de atentados", where1
                ),
                genvic_tabla(
                  'VIOLENCIA SEXUAL', 
                  [
                    {"cat" => [29, 39],
                     "titulo" => "Víctimas de Violencia Sexual por móvil de Abuso de Autoridad o Intolerancia Social, perpetrada por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)."},
                    {"cat" => [19],
                     "titulo" => "Casos registrados simultáneamente como víctimas de Violencia Sexual por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y como casos que constituyen al mismo tiempo infracciones al Derecho Internacional Humanitario."},
                    {"cat" => [77, -19],
                     "titulo" => "Casos de Violencia Sexual que constituyen infracciones al Derecho Internacional Humanitario por parte de la insurgencia o combatientes."}
                  ], "Total víctimas de violencia sexual", where1
                )
              ]
            }, 
            {
              titulo: 'DERECHO A LA LIBERTAD',
              tablas: [
                genvic_tabla(
                  'HERIDOS', 
                  [
                    {"cat" => [11],
                     "titulo" => "Víctimas de Desaparición por móviles de Persecución Política por parte de agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)."},
                    {"cat" => [14, 24],
                     "titulo" => "Víctimas de Detención Arbitraria por móviles de Persecución Política o Abuso de Autoridad por parte de agentes directos e indirectos del Estado (Violaciones a los Derechos Humanos)."}
                  ], "Total víctimas de violación del derecho a la libertad",
                  where1
                )
              ]
            }
          ]

          respond_to do |format|
            format.html { render 'sivel2_gen/conteos/genvic', 
                          layout: 'application' }
            format.json { head :no_content }
            format.js   { render 'sivel2_gen/conteos/genvic' }
          end
        end # def personas
 

      end
    end
  end
end

