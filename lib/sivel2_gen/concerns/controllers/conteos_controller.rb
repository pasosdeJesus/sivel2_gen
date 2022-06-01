
module Sivel2Gen
  module Concerns
    module Controllers
      module ConteosController
        extend ActiveSupport::Concern

        included do

          include Sip::FormatoFechaHelper
          include Sip::SqlHelper

          @pDepartamento = ''
          @pMunicipio = ''
          @pSegun = ''

          def persona_ajusta_serie_opciones(serie, opciones)
          end

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
            @titulo_personas = 'Demografía de Víctimas'
            @titulo_personas_fecha = 'Fecha del Caso'
            @filtrosegun = personas_arma_filtros()
            @opsegun =  [''] + @filtrosegun.keys
          end

          # Restringe con base en @fechaini
          def personas_fecha_inicial(where1)
            return ampliar_where(
              where1, "caso.fecha", @fechaini, ">="
            )
          end

          # Restringe con base en @fechafin
          def personas_fecha_final(where1)
            return ampliar_where(
                where1, "caso.fecha", @fechafin, "<="
              )
          end


          # Arma filtros que ve el usuario tras tener poblada la vista
          # indicada por personas_cons1
          def personas_arma_filtros_sivel2_gen
            caniosnac = Sip::Persona.where('anionac IS NOT NULL').
              pluck('distinct anionac').sort

            cmesescasos = Sivel2Gen::Caso.all.pluck('distinct fecha').
              map { |f| "#{f.year}-#{f.month.to_s.rjust(2, '0')}"}.uniq.sort

            f = {
              'AÑO DE NACIMIENTO' => { 
                nomfiltro: :aniosnac,
                coleccion: caniosnac.map {|a| [a, a]},
                metodo_etiqueta: false,
                metodo_id: false,
                campocons: 'persona.anionac'
              },
              'ETNIA' => { 
                nomfiltro: :etnias,
                coleccion: Sivel2Gen::Etnia.all.order(:nombre), 
                # No usuamos habilitados porque deben incluirse históricos
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'victima.id_etnia'
              },
              'FILIACIÓN' => { 
                nomfiltro: :filiaciones,
                coleccion: Sivel2Gen::Filiacion.all.order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'victima.id_filiacion'
              },
              'MES CASO' => { 
                nomfiltro: :mesescasos,
                coleccion: cmesescasos.map {|m| [m, m]},
                metodo_etiqueta: false,
                metodo_id: false,
                campocons: "EXTRACT(YEAR FROM caso.fecha)::text || '-' || "+
                  "LPAD(EXTRACT(MONTH FROM caso.fecha)::text, 2, '0')"
              },
              'ORGANIZACIÓN' => { 
                nomfiltro: :organizaciones,
                coleccion: Sivel2Gen::Organizacion.all.order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'victima.id_organizacion'

              },
              'PROFESIÓN' => { 
                nomfiltro: :profesiones,
                coleccion: Sivel2Gen::Profesion.all.order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'victima.id_profesion'

              },
              'RANGO DE EDAD' => { 
                nomfiltro: :rangosedad,
                coleccion: Sivel2Gen::Rangoedad.all.order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'victima.id_rangoedad'
              },
              'SECTOR SOCIAL' => { 
                nomfiltro: :sectoresociales,
                coleccion: Sivel2Gen::Sectorsocial.all.order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'victima.id_sectorsocial'
              },
              'SEXO' => { 
                nomfiltro: :sexos,
                coleccion: Sip::Persona::SEXO_OPCIONES,
                metodo_etiqueta: false,
                metodo_id: false,
                campocons: 'persona.sexo'
              },
              Sivel2Gen::Victima.human_attribute_name(:vinculoestado).upcase=>{ 
                nomfiltro: :vinculosestado,
                coleccion: Sivel2Gen::Vinculoestado.all.order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'victima.id_vinculoestado'

              }
            }
            return f
          end # personas_arma_filtros


          def personas_arma_filtros
            personas_arma_filtros_sivel2_gen
          end

          # Retorna consultas y llena variables de clase usadas
          # en formulario como @fechaini, @fechafin
          # No procesa pSegun
          def personas_procesa_filtros_sivel2_gen(que1, tablas1, where1, que3, 
                                       tablas3, where3)
            @filtrosegun.each do |e, r|
              if (params[:filtro] && params[:filtro][r[:nomfiltro]] && 
                  params[:filtro][r[:nomfiltro]] != '') 
                if r[:metodo_id] == :id
                  ids = r[:coleccion].where(
                    id: params[:filtro][r[:nomfiltro]].select{|x| x!= ''}.
                    map(&:to_i)
                  ).pluck(:id)
                else # e.g sexo

                  ids = r[:coleccion].map(&:last).select {|id| 
                    id && id.to_s != '' && params[:filtro][r[:nomfiltro]].
                      map(&:to_s).include?(id.to_s)
                  }
                end
                if ids.count == 0
                  where1 =ampliar_where_sinap(where1, 'TRUE', 'FALSE', '=')
                elsif r[:nomfiltro] == :aniosnac
                  where1 += (where1 != '' ? ' AND ' : '') + 
                    "(persona.anionac IS NULL OR persona.anionac IN ('" +
                    ids.sort.join("', '") + "'))"
                else
                  where1 = ampliar_where_sinap(
                    where1, r[:campocons], "('" + 
                    ids.sort.join("', '") + "')", ' IN '
                  )
                end
              end

            end

            return [que1, tablas1, where1, que3, tablas3, where3]
          end


          def personas_procesa_filtros(que1, tablas1, where1, que3, 
                                       tablas3, where3)
            return personas_procesa_filtros_sivel2_gen(que1, tablas1, 
                                                       where1, que3, 
                                                       tablas3, where3)
          end


          def personas_segun_tipico(tabla, nomtabla, que1, que3, tablas3, where3)
            que1 = agregar_tabla(
              que1, "victima.id_#{tabla} AS id_#{tabla}")
            tablas3 = agregar_tabla(
              tablas3, "public.sivel2_gen_#{tabla} AS #{tabla}")
            where3 = ampliar_where_sinap(
              where3, "id_#{tabla}", "#{tabla}.id")
            que3 << ["#{tabla}.nombre", nomtabla]
            return [que1, que3, tablas3, where3]
          end


          def personas_procesa_segun_om(que1, tablas1, where1, que3, tablas3, where3)
            ctablas1 = tablas1
            tablas1 = agregar_tabla(tablas1, 'public.sip_persona AS persona')
            if (ctablas1 != tablas1)
              where1 = ampliar_where_sinap(
                where1, "persona.id", "victima.id_persona")
            end

            case @pSegun
            when ''
              que1 = agregar_tabla(que1, 'cast(\'total\' as text) as total')
              que3 << ["", ""]

            when 'AÑO DE NACIMIENTO'
              que1 = agregar_tabla(que1, 'persona.anionac AS anionac')
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
              que1 = agregar_tabla(
                que1, "extract(year from fecha) || '-' " +
                "|| lpad(cast(extract(month from fecha) as text), 2 , " +
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
              que1 = agregar_tabla(que1, 'persona.sexo AS sexo')
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
            departamento.id_deplocal AS departamento_divipola,
            departamento.nombre AS departamento_nombre, 
            ubicacion.id_municipio, 
            municipio.id_munlocal AS municipio_divipola,
            municipio.nombre AS municipio_nombre, 
            ubicacion.id_clase, 
            clase.id_clalocal AS clase_divipola,
            clase.nombre AS clase_nombre
            FROM
            #{personas_cons1} JOIN sivel2_gen_caso AS caso ON
              (#{personas_cons1}.id_caso = caso.id) 
            LEFT JOIN sip_ubicacion AS ubicacion ON
              (caso.ubicacion_id = ubicacion.id) 
            LEFT JOIN sip_departamento AS departamento ON 
              (ubicacion.id_departamento=departamento.id) 
            LEFT JOIN sip_municipio AS municipio ON 
              (ubicacion.id_municipio=municipio.id)
            LEFT JOIN sip_clase AS clase ON 
              (ubicacion.id_clase=clase.id)
            GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14", que3, tablas3, where3]
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


          def personas_inicializa1(where1)
            que1 = 'caso.id AS id_caso, subv.id_victima AS id_victima, ' +
              'subv.id_persona AS id_persona, 1 AS npersona'
            tablas1 = 'public.sivel2_gen_caso AS caso, ' +
              'public.sivel2_gen_victima AS victima, ' +
              '(SELECT id_persona, ' +
              ' MAX(id) AS id_victima' +
              ' FROM sivel2_gen_victima GROUP BY 1) AS subv '
            where1 = ampliar_where_sinap(where1, "subv.id_victima", "victima.id")
            where1 = ampliar_where_sinap(where1, "caso.id", "victima.id_caso")
            return que1, tablas1, where1
          end

            
          def personas_post_consulta_final
          end

          def personas
            authorize! :contar, Sivel2Gen::Caso

            @pSegun = escapar_param(params, [:filtro, 'segun'])
            @pMunicipio = escapar_param(params, [:filtro, 'municipio'])
            @pDepartamento = escapar_param(params, [:filtro, 'departamento'])
            @filtrosegun = {}
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

            que1, tablas1, where1 = personas_inicializa1(where1)

            # Para la consulta final emplear arreglo que3, que tendrá parejas
            # (campo, titulo por presentar en tabla)
            que3 = []
            tablas3 = "#{personas_cons2}"
            where3 = ''
            que1, tablas1, where1, que3, tablas3, where3 = 
              personas_procesa_filtros(
                que1, tablas1, where1, que3, tablas3, where3)

            que1, tablas1, where1, que3, tablas3, where3 = 
              personas_procesa_segun(
                que1, tablas1, where1, que3, tablas3, where3)
            ActiveRecord::Base.connection.execute "DROP VIEW  IF EXISTS #{personas_cons2} CASCADE"
            ActiveRecord::Base.connection.execute "DROP VIEW  IF EXISTS #{personas_cons1} CASCADE"

            if where1 != ''
              where1 = 'WHERE ' + where1
            end
            # Filtrar 
            q1="CREATE VIEW #{personas_cons1} AS 
              SELECT #{que1}
              FROM #{tablas1} #{where1}
            "
#            q1 += 'GROUP BY '
#            q1 += (3..que1.split(',').count).to_a.join(', ')
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

            personas_post_consulta_final

            respond_to do |format|
              format.html { render 'sivel2_gen/conteos/personas', layout: 'application' }
              format.json { head :no_content }
              format.js   { render 'sivel2_gen/conteos/personas' }
            end
          end # def personas

        end

        def filtros_victimizaciones_gen(
          pFini, pFfin, pTviolencia, pEtiqueta1, pEtiqueta2, 
          pExcluirCateRep, pSegun, pDepartamento, pMunicipio, otro= nil,
          pCategoria = nil)

          tcons1 = Sivel2Gen::ConteosController::genconsulta_victimizaciones(
            pFini, pFfin, pTviolencia, pEtiqueta1, pEtiqueta2, pExcluirCateRep,
            pSegun, pDepartamento, pMunicipio, pCategoria
          )
          return tcons1
        end

        def victimizaciones
          authorize! :contar, Sivel2Gen::Caso

          # Filtros
          pFini = escapar_param(params, [:filtro, 'fechaini'])
          pFfin = escapar_param(params, [:filtro, 'fechafin'])
          pTviolencia = escapar_param(params, [:filtro, 'tviolencia_id'])
          pEtiqueta1 = escapar_param(params, [:filtro, 'etiqueta1'])
          pEtiqueta2 = escapar_param(params, [:filtro, 'etiqueta2'])
          pSegun = escapar_param(params, [:filtro, 'segun'])
          pExcluirCateRep = escapar_param(params, [:filtro, 'excluircaterep'])
          # Desagregar
          pMunicipio = escapar_param(params, [:filtro, 'municipio'])
          pDepartamento = escapar_param(params, [:filtro, 'departamento'])

          lcat = Sivel2Gen::Categoria.habilitados.pluck(:id)
          pCategoria = params[:filtro] && params[:filtro][:categoria] ?
            lcat & params[:filtro][:categoria].map(&:to_i) : lcat


          tcons1 = filtros_victimizaciones_gen(
            pFini, pFfin, pTviolencia, pEtiqueta1, pEtiqueta2, 
            pExcluirCateRep, pSegun, pDepartamento, pMunicipio, nil, pCategoria)

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

          que3 = []
          tablas3 = tcons1
          where3 = ''

          que3 << ["id_tviolencia", 'T. Violencia']
          que3 << ["id_categoria", 'Id. Categoria']
          que3 << ["categoria", 'Categoria']

          if (pDepartamento.to_i == 1 || pMunicipio.to_i == 1) 
            que3 << ["departamento_divipola", "Cod. Departamento"]
            que3 << ["departamento_nombre", "Departamento"]
          end

          if (pMunicipio.to_i == 1) 
            que3 << ["municipio_nombre", "Municipio"]
          end

          if pSegun && pSegun != ''
            case pSegun
            when "ACTOS PRESUNTOS RESPONSABLES"
              que3 << ["presponsable_nombre", "P. Responsable"]

            when "FILIACIÓN"
              que3 << ["filiacion_nombre", "Filiacion"]

            when "MES CASO"
              que3 << ["mes_anio", "Mes"]

            when "ORGANIZACIÓN SOCIAL"
              que3 << ["organizacion_nombre", "Organización"]

            when "PROFESIÓN"
              que3 << ["profesion_nombre", "Profesión"]

            when "RANGO DE EDAD"
              que3 << ["rangoedad_rango", "Rango de edad"]

            when "SECTOR SOCIAL"
              que3 << ["sectorsocial_nombre", "Sector social"]

            when "SEXO"
              que3 << ["sexo", "Sexo"]

            end
          end

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

          twhere3 = where3 == "" ? "" : "WHERE " + where3
          q3 = "SELECT #{qc}
              COUNT(cast(#{tcons1}.id_caso as text))
              FROM #{tablas3}
              #{twhere3}
              #{gb} 
          "
          puts "q3=#{q3}"

          if params[:filtro] && params[:filtro][:agrucol] &&
            params[:filtro][:agrucol] == 'CATEGORÍA'
            @totalesfila = true

            if que3.count == 3
              # Si no se desagrega, solo presenta tabla mínima con 
              # categorías y conteos por categoría
              q4 = "SELECT categoria, SUM(count)::INTEGER " +
                "FROM (#{q3}) AS sub GROUP BY 1 ORDER BY 1;"

              r = ActiveRecord::Base.connection.select_all(q4)
              @enctabla = []
              fila = []
              i = 0
              r.each do |t|
                @enctabla << CGI.escapeHTML(t['categoria'])
                fila << CGI.escapeHTML(t['sum'].to_s)
                @coltotales << i
                i += 1
              end
              @cuerpotabla = [fila]

            elsif que3.count == 4
              # Si se desagrega, pone los desagregados en columnas
              fila = que3.last[0]
              fila_hum = que3.last[1]
              q4 = "SELECT #{fila}, categoria, SUM(count)::INTEGER " +
                "FROM (#{q3}) AS sub GROUP BY 1, 2 ORDER BY 1, 2;"

              r = ActiveRecord::Base.connection.select_all(q4)
              @enctabla = []
              inter = {}
              filas = []
              et = []
              r.each do |t|
                if !inter[t[fila]]
                  inter[t[fila]] = {}
                end
                if !inter[t[fila]][t['categoria']]
                  inter[t[fila]][t['categoria']] = 0
                end
                inter[t[fila]][t['categoria']] += t['sum'].to_i
                if !et.include?(t['categoria'])
                  et << t['categoria']
                end
                if !filas.include?(t[fila])
                  filas << t[fila]
                end
              end
              et.sort!
              @enctabla << fila_hum
              i = 1
              et.each do |e|
                @enctabla << CGI.escapeHTML(e)
                @coltotales << i
                i += 1
              end
              @cuerpotabla = []
              filas.each do |f|
                ft = [f]
                et.each do |e|
                  if inter[f] && inter[f][e]
                    ft << inter[f][e]
                  else
                    ft << 0
                  end
                end
                @cuerpotabla << ft
              end

            end
          else
            que3 << ["", "Victimizaciones"]
            @cuerpotabla = ActiveRecord::Base.connection.select_all(q3)

            @enctabla = []
            que3.each do |t|
              if (t[1] != "") 
                @enctabla << CGI.escapeHTML(t[1])
              end
            end
          end

          respond_to do |format|
            format.html { render 'victimizaciones', layout: 'application'}
            format.json { head :no_content }
            format.js   { render 'sivel2_gen/conteos/resultado' }
          end
        end # def victimizaciones


        def cuenta_actos(cat, concat, sincat, where)
          w = where
          w = ampliar_where(w, "sivel2_gen_acto.id_categoria", cat.to_i);
          if concat > 0
            w = "#{w} AND (sivel2_gen_acto.id_caso, sivel2_gen_acto.id_persona) IN 
                (SELECT id_caso, id_persona FROM sivel2_gen_acto 
                WHERE sivel2_gen_acto.id_categoria='" + concat.to_s + "') ";
          end
          if sincat > 0
            w = "#{w} AND (sivel2_gen_acto.id_caso, sivel2_gen_acto.id_persona) NOT IN 
                (SELECT id_caso, id_persona FROM sivel2_gen_acto 
                WHERE sivel2_gen_acto.id_categoria='" + sincat.to_s + "')";
          end
          q = "SELECT count(*) FROM (SELECT DISTINCT sivel2_gen_acto.id_caso, 
            sivel2_gen_acto.id_persona, sivel2_gen_acto.id_categoria 
            FROM public.sivel2_gen_acto 
            JOIN public.sivel2_gen_caso AS caso
              ON caso.id = sivel2_gen_acto.id_caso 
            LEFT JOIN public.sivel2_gen_caso_etiqueta AS casoetiqueta 
              ON casoetiqueta.id_caso = caso.id
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
              pc = c.to_s.split('&')
              concat = 0
              sincat = 0
              if (pc.count > 2) 
                  puts 'Implementar primero'
                  return
              elsif pc.count == 2
                if pc[1][0] == '!'
                  sincat = pc[1][1..-1].to_i
                else
                  concat = pc[1].to_i
                end
              end
              s += cuenta_actos(pc[0].to_i, concat, sincat, where1);
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
          if (params[:filtro] && params[:filtro]['etiqueta_id'] && 
              params[:filtro]['etiqueta_id'] != "") 
            @etiqueta_id = params[:filtro]['etiqueta_id']
            where1 = ampliar_where(
              where1, "casoetiqueta.id_etiqueta", @etiqueta_id, "="
                )
          end
          @tablader = [
            { 
              titulo: 'DERECHO A LA VIDA',
              tablas: [
                genvic_tabla(
                  'Ejecuciones extrajudiciales, homicidios y asesinatos', 
                  [
                    {"cat" => [20, 30],
                     "titulo" => "Víctimas de `Ejecución Extrajudicial´ por Abuso de Autoridad e Intolerancia Social por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)"},
                    {"cat" => ['10&!701'],
                     "titulo" => "Víctimas de `Ejecución Extrajudicial´ por Persecución Política (Violaciones a los DH) que no representan infracciones al DIHC"},
                    {"cat" => ['10&701'],
                     "titulo" => "Víctimas simultáneamente de `Ejecución Extrajudicial´ perpetradas por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y de `Homicidio Intencional de Persona Protegida´ (Infracciones al Derecho Internacional Humanitario Consuetudinario)."},
                    {"cat" => ['701&!10', 97, 703, 87],
                     "titulo" => "Víctimas de `Homicidio Intencional de Persona Protegida´ (excepto casos de Violaciones a Derechos Humanos) o `Muerte Causada por Empleo de Métodos y Medios Ilícitos de Guerra´ o `Muerte de Civil en Acción Bélica´ o `Muerte Causada por Ataque a Bienes Civiles.´"},
                    {"cat" => [40],
                     "titulo" => "Víctimas de `Asesinato´ por Persecución Política sin autor determinado"},
                    {"cat" => [50],
                     "titulo" => "Víctimas de `Asesinato´ por Intolerancia Social sin autor determinado"},

                  ], "Total víctimas que perdieron la vida", where1
                ),
                genvic_tabla(
                  'Atentados', 
                  [
                    {"cat" => [26, 37],
                     "titulo" => "Victimizaciones por `Atentado´ por Abuso de Autoridad o Intolerancia Social por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)."},
                    {"cat" => [16],
                     "titulo" => "Victimizaciones por `Atentado´ por Persecución Política por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)."},
                    {"cat" => [46],
                     "titulo" => "Victimizaciones por `Atentado´ por Persecución Política sin autor determinado" },
                    {"cat" => [57],
                     "titulo" => "Victimizaciones por `Atentado´ por Intolerancia Social sin autor determinado" }
                  ], "Total victimizaciones por atentados", where1
                ),
                genvic_tabla(
                  'Amenazas', 
                  [
                    {"cat" => [25, 35],
                     "titulo" => "Victimizaciones por `Amenaza´ por Abuso de Autoridad e Intolerancia Social por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)."},
                    {"cat" => ['15&!73'],
                     "titulo" => "Victimizaciones por `Amenaza´ por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) que no constituyen Infracciones al Derecho Internacional Humanitario Consuetudinario."},
                    {"cat" => ['15&73'],
                     "titulo" => "Víctimas simultáneamente de `Amenaza´ por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y de `Amenaza´ que constituyen Infracciones al Derecho Internacional Humanitario Consuetudinario por parte de agentes directos o indirectos del Estado."},
                    {"cat" => ['73&!15'],
                     "titulo" => "Victimizaciones por `Amenaza´ como Infracciones al Derecho Internacional Humanitario Consuetudinario por parte de la insurgencia."},
                    {"cat" => [45],
                     "titulo" => "Victimizaciones por `Amenaza´ por Persecución Política sin autor determinado"},
                    {"cat" => [55],
                     "titulo" => "Victimizaciones por `Amenaza´ por Intolerancia Social sin autor determinado"}
                  ], "Total víctimizaciones por amenazas", where1
                ),

              ]
            }, 
            {
              titulo: 'DERECHO A LA INTEGRIDAD',
              tablas: [
                genvic_tabla(
                  'Lesiones físicas', 
                  [
                    {"cat" => [23, 33],
                     "titulo" => "Victimizaciones por `Lesión Física´ por Abuso de Autoridad e Intolerancia Social por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)"},
                    {"cat" => ['13&!702'],
                     "titulo" => "Victimizaciones por `Lesión Física´ por Persecución Política (Violaciones a los DH) que no representan infracciones al DIHC"},
                    {"cat" => ['13&702'],
                     "titulo" => "Victimizaciones por `Lesión Física´ por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y de `Lesión Intencional a la Integridad Personal de Personas Protegidas´ (Infracciones al Derecho Internacional Humanitario Consuetudinario)."},
                    {"cat" => ['702&!13', 98, 704, 88],
                     "titulo" => "Victimizaciones por `Lesión Intencional a la Integridad de Persona Protegida´ (excepto casos de Violación a Derechos Humanos) o `Lesiones a la Integridad Personal de Persona Protegida´ por Empleo de Métodos o Medios Ilícitos de Guerra o `Lesiones a la Integridad Personal de Persona Protegida´ como Consecuencia de una Acción Bélica o `Lesiones a la Integridad Personal de Persona Protegida´ como Consecuencia de Ataques a Bienes de Cáracter Civil"},
                    {"cat" => [43],
                     "titulo" => "Victimizaciones por `Lesión Física´ por Persecución Política sin autor determinado"},
                    {"cat" => [53],
                     "titulo" => "Victimizaciones por `Lesión Física´ por Intolerancia Social sin autor determinado"},
                  ], "Total victimizaciones por lesión física", where1
                ),
                genvic_tabla(
                  'Tortura', 
                  [
                    {"cat" => [22, 36],
                     "titulo" => "Victimizaciones por `Tortura´ por Abuso de Autoridad e Intolerancia Social por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)."},
                    {"cat" => ['12&!72'],
                     "titulo" => "Victimizaciones por `Tortura´ por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) que no constituye Infracción al Derecho Internacional Humanitario Consuetudinario."},
                    {"cat" => ['12&72'],
                     "titulo" => "Víctimas simultáneamente de `Tortura´ por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y de `Tortura y Tratos Crueles e Inhumanos, Atentados contra la Dignidad Personal, Tratos Humillantes y Degradantes y Castigos Corporales, como Instrumentos de Guerra´ que constituye Infracción al Derecho Internacional Humanitario Consuetudinario por parte de agentes directos o indirectos del Estado."},
                    {"cat" => ['72&!12'],
                     "titulo" => "Victimizaciones por `Tortura y Tratos Crueles e Inhumanos, Atentados contra la Dignidad Personal, Tratos Humillantes y Degradantes y Castigos Corporales, como Instrumentos de Guerra´ como Infracciones al Derecho Internacional Humanitario Consuetudinario por parte de la insurgencia."},
                    {"cat" => [47],
                     "titulo" => "Victimizaciones por `Tortura´ por Persecución Política sin autor determinado"},
                    {"cat" => [56],
                     "titulo" => "Victimizaciones por `Tortura´ por Intolerancia Social sin autor determinado"}
                  ], "Total victimizaciones por tortura", where1
                ),
                genvic_tabla(
                  'Violencia sexual', 
                  [
                    {"cat" => [29, 39],
                     "titulo" => "Victimizaciones por `Violencia Sexual´ por móvil de Abuso de Autoridad o Intolerancia Social, perpetradas por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)."},
                    {"cat" => ['19&!77'],
                     "titulo" => "Victimizaciones por `Violencia Sexual´ por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) que no representan infracciones al Derecho Internacional Humanitario Consuetudinario."},
                    {"cat" => ['19&77'],
                     "titulo" => "Victimizaciones por `Violencia Sexual´ por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y que constituyen al mismo tiempo infracciones al Derecho Internacional Humanitario Consuetudinario."},
                    {"cat" => ['77&!19'],
                     "titulo" => "Victimizaciones por `Violencia Sexual´ que constituyen infracciones al Derecho Internacional Humanitario Consuetudinario por parte de la insurgencia."},
                    {"cat" => [420],
                     "titulo" => "Victimizaciones por `Violencia Sexual´ por Persecución Política sin autor determinado"},
                    {"cat" => [520],
                     "titulo" => "Victimizaciones por `Violencia Sexual´ por Intolerancia Social sin autor determinado"}
                  ], "Total victimizaciones por violencia sexual", where1
                )
              ]
            }, 
            {
              titulo: 'DERECHO A LA LIBERTAD',
              tablas: [
                genvic_tabla(
                  'Desaparición forzada e involuntaria', 
                  [
                    {"cat" => [21, 302],
                     "titulo" => "Victimizaciones por `Desaparición Forzada e Involuntaria´ por móvil de Abuso de Autoridad o Intolerancia Social, perpetradas por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)."},
                    {"cat" => ['11&!76'],
                     "titulo" => "Victimizaciones por `Desaparicion Forzada e Involuntaria´ por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) que no representan infracciones al Derecho Internacional Humanitario Consuetudinario."},
                    {"cat" => ['11&76'],
                     "titulo" => "Victimizaciones por `Desaparicion Forzada e Involuntaria´ por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y que constituyen al mismo tiempo infracciones al Derecho Internacional Humanitario Consuetudinario."},
                    {"cat" => ['76&!11'],
                     "titulo" => "Victimizaciones por `Desaparición Forzada como Instrumento de Guerra´ que constituyen infracciones al Derecho Internacional Humanitario Consuetudinario pero no violación a los Derechos Humanos."}
                  ], "Total victimizaciones por desaparición forzada e involuntaria",
                  where1
                ),
                genvic_tabla(
                  'Otras violaciones al derecho a la libertad', 
                  [
                    {"cat" => [24, 241, 301, 341],
                     "titulo" => "Victimizaciones por `Detención Arbitraria´ y `Judicialización Arbitraria´ por móvil de Abuso de Autoridad o Intolerancia Social, perpetradas por agentes directos o indirectos del Estado (Violaciones a los Derechos Humanos)."},
                    {"cat" => [14, 141, 101],
                     "titulo" => "Victimizaciones por `Detención Arbitraria´,  `Judicialización Arbitraria´ y `Deportación´ por móviles de Persecución Política (Violaciones a los Derechos Humanos)."},
                  {"cat" => [48],
                   "titulo" => "Victimizaciones por `Rapto´ por Móviles Políticos sin autor determinado."},
                  {"cat" => [41],
                   "titulo" => "Victimizaciones por `Secuestro´ perpetrado por organizaciones insurgentes."},
                  {"cat" => [58],
                   "titulo" => "Victimizaciones por `Rapto´ por Móviles de Intolerancia Social sin autor determinado."}
                  ], "Total victimizaciones de otras violaciones al derecho a la libertad",
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
        end # def genvic



        class_methods do

          include Sip::SqlHelper

          def genconsulta_victimizaciones(
            pFini, pFfin, pTviolencia, pEtiqueta1, pEtiqueta2, pExcluirCateRep,
            pSegun, pDepartamento, pMunicipio, pCategoria = nil)

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

            if (pFini != '')
              @fechaini = Sip::FormatoFechaHelper.fecha_local_estandar pFini
              if @fechaini
                where1 = ampliar_where(
                  where1, "caso.fecha", @fechaini, ">="
                )
              end
            end
            if (pFfin != '') 
              @fechafin = Sip::FormatoFechaHelper.fecha_local_estandar pFfin
              if @fechafin
                where1 = ampliar_where(
                  where1, "caso.fecha", @fechafin, "<="
                )
              end
            end
            if (pTviolencia != '') 
              where1 = ampliar_where(
                where1, "id_tviolencia", pTviolencia[0], "="
              )
            end

            if (!pCategoria.nil? && !pCategoria.empty? && pCategoria != [""])
              where1 += (where1 != '' ? ' AND ' : '') + 
                "(categoria.id IN ('" + pCategoria.join("', '") + "'))"
            else 
              where1 += (where1 != '' ? ' AND ' : '') + 
                "(categoria.id IN ('-1'))"
            end

            if (pExcluirCateRep == '1')
              cats_repetidas = Sivel2Gen::Categoria.habilitados.
                where(contadaen: nil).pluck(:id)
              where1 = ampliar_where_sinap(
                where1, 'categoria.id', "('" + 
                cats_repetidas.join("', '") + "')", ' IN '
              )
            end
            if (pEtiqueta1 != '' || pEtiqueta2 != '')
              tablas1 += ' JOIN sivel2_gen_caso_etiqueta AS caso_etiqueta ON' +
                ' caso.id=caso_etiqueta.id_caso' 
              if (pEtiqueta1 != '') 
                where1 = ampliar_where(
                  where1, "caso_etiqueta.id_etiqueta", pEtiqueta1, "="
                )
              end
              if (pEtiqueta2 != '') 
                where1 = ampliar_where(
                  where1, "caso_etiqueta.id_etiqueta", pEtiqueta2, "="
                )
              end
            end

            if (pDepartamento.to_i == 1 || pMunicipio.to_i == 1) 
              que1 += ', ubicacion.id_departamento' +
                ', departamento.id_deplocal AS departamento_divipola' +
                ', INITCAP(departamento.nombre) AS departamento_nombre'
              # Tomamos ubicacion principal
              tablas1 += ' LEFT JOIN sip_ubicacion AS ubicacion ON' +
                ' caso.ubicacion_id = ubicacion.id'
              tablas1 += ' LEFT JOIN sip_departamento AS departamento ON ' +
                ' ubicacion.id_departamento=departamento.id'
            end

            if (pMunicipio.to_i == 1) 
              que1 += ', ubicacion.id_municipio' +
                ', INITCAP(municipio.nombre) AS municipio_nombre'
              tablas1 += ' LEFT JOIN sip_municipio AS municipio ON ' +
                ' ubicacion.id_municipio=municipio.id'
            end

            if pSegun && pSegun != ''
              case pSegun
              when "ACTOS PRESUNTOS RESPONSABLES"
                que1 += ', presponsable.id, INITCAP(presponsable.nombre) AS presponsable_nombre' 
                tablas1 += ' LEFT JOIN sivel2_gen_presponsable AS presponsable ON ' +
                  ' acto.id_presponsable=presponsable.id'

              when "FILIACIÓN"
                que1 += ', filiacion.id, INITCAP(filiacion.nombre) AS filiacion_nombre' 
                tablas1 += ' LEFT JOIN public.sivel2_gen_filiacion AS filiacion ON ' +
                  ' victima.id_filiacion=filiacion.id'

              when "MES CASO"
                que1 += ", TO_CHAR(EXTRACT(YEAR FROM caso.fecha), '0000') || " +
                  " '-' || TO_CHAR(EXTRACT(MONTH FROM caso.fecha),'00') " +
                  "AS mes_anio" 

              when "ORGANIZACIÓN SOCIAL"
                que1 += ', organizacion.id, INITCAP(organizacion.nombre) AS organizacion_nombre' 
                tablas1 += ' LEFT JOIN public.sivel2_gen_organizacion AS organizacion ON ' +
                  ' victima.id_organizacion=organizacion.id'

              when "PROFESIÓN"
                que1 += ', profesion.id, INITCAP(profesion.nombre) AS profesion_nombre' 
                tablas1 += ' LEFT JOIN public.sivel2_gen_profesion AS profesion ON ' +
                  ' victima.id_profesion=profesion.id'


              when "RANGO DE EDAD"
                que1 += ', rangoedad.id, INITCAP(rangoedad.nombre) AS rangoedad_rango' 
                tablas1 += ' LEFT JOIN public.sivel2_gen_rangoedad AS rangoedad ON ' +
                  ' victima.id_rangoedad=rangoedad.id'

              when "SECTOR SOCIAL"
                que1 += ", sectorsocial.id, "\
                  "INITCAP(sectorsocial.nombre) AS sectorsocial_nombre" 
                tablas1 += " LEFT JOIN public.sivel2_gen_sectorsocial "\
                  "AS sectorsocial ON victima.id_sectorsocial=sectorsocial.id"

              when "SEXO"
                que1 += ", CASE  WHEN persona.sexo='F' THEN 'Femenino' "\
                  "  WHEN persona.sexo='M' THEN 'Masculino' "\
                  "  ELSE 'Sin Información' "\
                  "END AS sexo"
                tablas1 += " LEFT JOIN public.sivel2_gen_profesion "\
                  "AS profesion ON victima.id_profesion=profesion.id"
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

            return tcons1
          end # def

        end # class_methods

      end
    end
  end
end

