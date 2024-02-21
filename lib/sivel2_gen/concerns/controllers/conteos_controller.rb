
module Sivel2Gen
  module Concerns
    module Controllers
      module ConteosController
        extend ActiveSupport::Concern

        included do

          include Msip::FormatoFechaHelper
          include Msip::SqlHelper

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
            @titulo_personas = 'Conteo por demografía de víctimas'
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
            caniosnac = Msip::Persona.where('anionac IS NOT NULL').
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
                coleccion: Msip::Etnia.all.order(:nombre), 
                # No usuamos habilitados porque deben incluirse históricos
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'persona.etnia_id'
              },
              'FILIACIÓN' => { 
                nomfiltro: :filiaciones,
                coleccion: Sivel2Gen::Filiacion.all.order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'victima.filiacion_id'
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
                campocons: 'victima.organizacion_id'

              },
              'PROFESIÓN' => { 
                nomfiltro: :profesiones,
                coleccion: Sivel2Gen::Profesion.all.order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'victima.profesion_id'

              },
              'RANGO DE EDAD' => { 
                nomfiltro: :rangosedad,
                coleccion: Sivel2Gen::Rangoedad.all.order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'victima.rangoedad_id'
              },
              'SECTOR SOCIAL' => { 
                nomfiltro: :sectoresociales,
                coleccion: Sivel2Gen::Sectorsocial.all.order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'victima.sectorsocial_id'
              },
              'SEXO' => { 
                nomfiltro: :sexos,
                coleccion: Msip::Persona::sexo_opciones,
                metodo_etiqueta: false,
                metodo_id: false,
                campocons: 'persona.sexo'
              },
              Sivel2Gen::Victima.human_attribute_name(:vinculoestado).upcase=>{ 
                nomfiltro: :vinculosestado,
                coleccion: Sivel2Gen::Vinculoestado.all.order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'victima.vinculoestado_id'

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
              que1, "victima.#{tabla}_id AS #{tabla}_id")
            tablas3 = agregar_tabla(
              tablas3, "public.sivel2_gen_#{tabla} AS #{tabla}")
            where3 = ampliar_where_sinap(
              where3, "#{tabla}_id", "#{tabla}.id")
            que3 << ["#{tabla}.nombre", nomtabla]
            return [que1, que3, tablas3, where3]
          end


          def personas_procesa_segun_om(que1, tablas1, where1, que3, tablas3, where3)
            ctablas1 = tablas1
            tablas1 = agregar_tabla(tablas1, 'public.msip_persona AS persona')
            if (ctablas1 != tablas1)
              where1 = ampliar_where_sinap(
                where1, "persona.id", "victima.persona_id")
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
            ubicacion.departamento_id, 
            departamento.deplocal_cod AS departamento_divipola,
            departamento.nombre AS departamento_nombre, 
            ubicacion.municipio_id, 
            departamento.deplocal_cod*1000 + municipio.munlocal_cod AS municipio_divipola,
            municipio.nombre AS municipio_nombre, 
            ubicacion.centropoblado_id, 
            centropoblado.cplocal_cod AS centropoblado_divipola,
            centropoblado.nombre AS centropoblado_nombre
            FROM
                    #{personas_cons1} JOIN sivel2_gen_caso AS caso ON
              (#{personas_cons1}.caso_id = caso.id) 
            LEFT JOIN msip_ubicacion AS ubicacion ON
              (caso.ubicacion_id = ubicacion.id) 
            LEFT JOIN msip_departamento AS departamento ON 
              (ubicacion.departamento_id=departamento.id) 
            LEFT JOIN msip_municipio AS municipio ON 
              (ubicacion.municipio_id=municipio.id)
            LEFT JOIN msip_centropoblado AS centropoblado ON 
              (ubicacion.centropoblado_id=centropoblado.id)
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
            que1 = 'caso.id AS caso_id, subv.victima_id AS victima_id, ' +
              'subv.persona_id AS persona_id, 1 AS npersona'
            tablas1 = 'public.sivel2_gen_caso AS caso, ' +
              'public.sivel2_gen_victima AS victima, ' +
              '(SELECT persona_id, ' +
              ' MAX(id) AS victima_id' +
              ' FROM sivel2_gen_victima GROUP BY 1) AS subv '
            where1 = ampliar_where_sinap(where1, "subv.victima_id", "victima.id")
            where1 = ampliar_where_sinap(where1, "caso.id", "victima.caso_id")
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
              format.html { render 'sivel2_gen/conteos/personas', 
                            layout: 'application' }
              format.json { head :no_content }
              format.js   { render 'sivel2_gen/conteos/personas' }
            end
          end # def personas



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

            pAgrucol = escapar_param(params, [:filtro, 'agrucol'])

            @opsegun, @coltotales, @totalesfila, @numpersonas, @enctabla,
              @cuerpotabla = Sivel2Gen::ConteosController::victimizaciones_gen_tabla(
                pFini, pFfin, pTviolencia, pEtiqueta1, pEtiqueta2,
                pExcluirCateRep, pSegun, pDepartamento, pMunicipio,
                nil, pCategoria, pAgrucol)

            #          @opsegun = lr[0]
            #          @coltotales = lr[1]
            #          @totalesfila = lr[2]
            #          @enctabla = lr[3]
            #          @cuerpotabla = lr[4]

            respond_to do |format|
              format.html { render 'victimizaciones', layout: 'application'}
              format.json { head :no_content }
              format.js   { render 'sivel2_gen/conteos/resultado' }
            end
          end # def victimizaciones

          def cuenta_actos(cat, concat, sincat, where)
            w = where
            w = ampliar_where(w, "sivel2_gen_acto.categoria_id", cat.to_i);
            if concat > 0
              w = "#{w} AND (sivel2_gen_acto.caso_id, sivel2_gen_acto.persona_id) IN 
                (SELECT caso_id, persona_id FROM sivel2_gen_acto 
                WHERE sivel2_gen_acto.categoria_id='" + concat.to_s + "') ";
            end
            if sincat > 0
              w = "#{w} AND (sivel2_gen_acto.caso_id, sivel2_gen_acto.persona_id) NOT IN 
                (SELECT caso_id, persona_id FROM sivel2_gen_acto 
                WHERE sivel2_gen_acto.categoria_id='" + sincat.to_s + "')";
            end
            q = "SELECT count(*) FROM (SELECT DISTINCT sivel2_gen_acto.caso_id, 
            sivel2_gen_acto.persona_id, sivel2_gen_acto.categoria_id 
            FROM public.sivel2_gen_acto 
            JOIN public.sivel2_gen_caso AS caso
              ON caso.id = sivel2_gen_acto.caso_id 
            LEFT JOIN public.sivel2_gen_caso_etiqueta AS casoetiqueta 
              ON casoetiqueta.caso_id = caso.id
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
                where1, "casoetiqueta.etiqueta_id", @etiqueta_id, "="
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
                     "titulo" => "Victimizaciones que son simultáneamente `Amenaza´ por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y `Amenaza´ que constituyen Infracciones al Derecho Internacional Humanitario Consuetudinario por parte de agentes directos o indirectos del Estado."},
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
                     "titulo" => "Victimizaciones que son simultáneamente `Tortura´ por agentes directos o indirectos del Estado por móviles de Persecución Política (Violaciones a los Derechos Humanos) y `Tortura y Tratos Crueles e Inhumanos, Atentados contra la Dignidad Personal, Tratos Humillantes y Degradantes y Castigos Corporales, como Instrumentos de Guerra´ que constituye Infracción al Derecho Internacional Humanitario Consuetudinario por parte de agentes directos o indirectos del Estado."},
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
                  ),
                  genvic_tabla(
                    'Otras violaciones al derecho a la integridad', 
                    [
                      {"cat" => [78],
                       "titulo" => "Victimizaciones por `Escudo Individual´ DIHC."},
                       {"cat" => [717],
                        "titulo" => "Victimizaciones por `Negación de Atención a persona Vulnerable´ DIHC."},
                        {"cat" => [718],
                         "titulo" => "Victimizaciones por `Profanación y Ocultamiento de Cadáveres´ DIHC."},
                         {"cat" => [716],
                          "titulo" => "Victimizaciones por `Negación de Derechos a Prisioneros de Guerra´ DIHC."}
                    ], "Total victimizaciones contra el derecho a la integridad", where1
                  ),


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
                    {"cat" => [14, 101],
                     "titulo" => "Victimizaciones por `Detención Arbitraria´  y `Deportación´ por móviles de Persecución Política (Violaciones a los Derechos Humanos)."},
                    {"cat" => ['141&!715'],
                     "titulo" => "Victimizaciones por `Judicialización Arbitraria´ que no representan `Judicialización Arbitraria como Instrumento de Guerra´."},
                     {"cat" => ['141&715'],
                      "titulo" => "Victimizaciones que son simultáneamente `Judicialización Arbitraria´ y `Judicialización Arbitraria como Instrumento de Guerra´."},
                      {"cat" => ['!141&715'],
                       "titulo" => "Victimizaciones que son `Judicialización Arbitraria como Instrumento de Guerra´  pero que no son `Judicialización Arbitraria´."},
                       {"cat" => [48],
                        "titulo" => "Victimizaciones por `Rapto´ por Móviles Políticos sin autor determinado."},
                        {"cat" => [41],
                         "titulo" => "Victimizaciones por `Secuestro´ perpetrado por organizaciones insurgentes."},
                         {"cat" => [58],
                          "titulo" => "Victimizaciones por `Rapto´ por Móviles de Intolerancia Social sin autor determinado."},
                          {"cat" => [74, 75, 714],
                           "titulo" => "Victimizaciones por `Toma de Rehenes´, `Reclutamiento de Menores´ y `Esclavitud y Trabajos Forzados´ DIHC."}
                    ], 
                    "Total victimizaciones de otras violaciones al derecho a la libertad",
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


        end  # included

        class_methods do

          include Msip::SqlHelper

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
            que1 = 'DISTINCT acto.caso_id, acto.persona_id, acto.categoria_id, 
            supracategoria.tviolencia_id AS tviolencia_id, 
            categoria.nombre AS categoria'
            tablas1 = ' public.sivel2_gen_acto AS acto JOIN ' +
            'public.sivel2_gen_caso AS caso ON acto.caso_id=caso.id ' +
            'JOIN public.sivel2_gen_categoria AS categoria ' + 
            ' ON acto.categoria_id=categoria.id ' +
            'JOIN public.sivel2_gen_supracategoria AS supracategoria ' + 
            ' ON categoria.supracategoria_id=supracategoria.id ' +
            'JOIN public.sivel2_gen_victima AS victima ' + 
            ' ON victima.persona_id=acto.persona_id AND ' +
            ' victima.caso_id=caso.id ' +
            'JOIN public.msip_persona AS persona ' + 
            ' ON persona.id=acto.persona_id'
            where1 = ''

            if (pFini != '')
              @fechaini = Msip::FormatoFechaHelper.fecha_local_estandar pFini
              if @fechaini
                where1 = ampliar_where(
                  where1, "caso.fecha", @fechaini, ">="
                )
              end
            end
            if (pFfin != '') 
              @fechafin = Msip::FormatoFechaHelper.fecha_local_estandar pFfin
              if @fechafin
                where1 = ampliar_where(
                  where1, "caso.fecha", @fechafin, "<="
                )
              end
            end
            if (pTviolencia != '') 
              where1 = ampliar_where(
                where1, "tviolencia_id", pTviolencia[0], "="
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
                ' caso.id=caso_etiqueta.caso_id' 
              if (pEtiqueta1 != '') 
                where1 = ampliar_where(
                  where1, "caso_etiqueta.etiqueta_id", pEtiqueta1, "="
                )
              end
              if (pEtiqueta2 != '') 
                where1 = ampliar_where(
                  where1, "caso_etiqueta.etiqueta_id", pEtiqueta2, "="
                )
              end
            end

            if (pDepartamento.to_i == 1 || pMunicipio.to_i == 1) 
              que1 += ', ubicacion.departamento_id' +
                ', departamento.deplocal_cod AS departamento_divipola' +
                ', departamento.nombre AS departamento_nombre'
              # Tomamos ubicacion principal
              tablas1 += ' LEFT JOIN msip_ubicacion AS ubicacion ON' +
                ' caso.ubicacion_id = ubicacion.id'
              tablas1 += ' LEFT JOIN msip_departamento AS departamento ON ' +
                ' ubicacion.departamento_id=departamento.id'
            end

            if (pMunicipio.to_i == 1) 
              que1 += ', ubicacion.municipio_id' +
                ', departamento.deplocal_cod*1000+ municipio.munlocal_cod AS municipio_divipola' +
                ', municipio.nombre AS municipio_nombre'
              tablas1 += ' LEFT JOIN msip_municipio AS municipio ON ' +
                ' ubicacion.municipio_id=municipio.id'
            end

            if pSegun && pSegun != ''
              case pSegun
              when "ACTOS PRESUNTOS RESPONSABLES"
                que1 += ', presponsable.id, INITCAP(presponsable.nombre) AS presponsable_nombre' 
                tablas1 += ' LEFT JOIN sivel2_gen_presponsable AS presponsable ON ' +
                  ' acto.presponsable_id=presponsable.id'

              when "FILIACIÓN"
                que1 += ', filiacion.id, INITCAP(filiacion.nombre) AS filiacion_nombre' 
                tablas1 += ' LEFT JOIN public.sivel2_gen_filiacion AS filiacion ON ' +
                  ' victima.filiacion_id=filiacion.id'

              when "MES CASO"
                que1 += ", TO_CHAR(EXTRACT(YEAR FROM caso.fecha), '0000') || " +
                  " '-' || TO_CHAR(EXTRACT(MONTH FROM caso.fecha),'00') " +
                  "AS mes_anio" 

              when "ORGANIZACIÓN SOCIAL"
                que1 += ', organizacion.id, INITCAP(organizacion.nombre) AS organizacion_nombre' 
                tablas1 += ' LEFT JOIN public.sivel2_gen_organizacion AS organizacion ON ' +
                  ' victima.organizacion_id=organizacion.id'

              when "PROFESIÓN"
                que1 += ', profesion.id, INITCAP(profesion.nombre) AS profesion_nombre' 
                tablas1 += ' LEFT JOIN public.sivel2_gen_profesion AS profesion ON ' +
                  ' victima.profesion_id=profesion.id'

              when "REGIÓN"
                que1 += ", (SELECT r.nombre FROM  sivel2_gen_caso_region AS cr "\
                  "  JOIN sivel2_gen_region AS r ON cr.region_id=r.id "\
                  "  WHERE cr.caso_id=caso.id LIMIT 1) AS region "

              when "RANGO DE EDAD"
                que1 += ', rangoedad.id, INITCAP(rangoedad.nombre) AS rangoedad_rango' 
                tablas1 += ' LEFT JOIN public.sivel2_gen_rangoedad AS rangoedad ON ' +
                  ' victima.rangoedad_id=rangoedad.id'

              when "SECTOR SOCIAL"
                que1 += ", sectorsocial.id, "\
                  "INITCAP(sectorsocial.nombre) AS sectorsocial_nombre" 
                tablas1 += " LEFT JOIN public.sivel2_gen_sectorsocial "\
                  "AS sectorsocial ON victima.sectorsocial_id=sectorsocial.id"

              when "SEXO"
                que1 += ", CASE  WHEN persona.sexo='#{Msip::Persona::convencion_sexo[:sexo_femenino].to_s}' THEN '#{Msip::Persona::convencion_sexo[:nombre_femenino]}' "\
                  "  WHEN persona.sexo='#{Msip::Persona::convencion_sexo[:sexo_masculino].to_s}' THEN '#{Msip::Persona::convencion_sexo[:nombre_masculino]}' "\
                  "  ELSE '#{Msip::Persona::convencion_sexo[:nombre_sininformacion]}' "\
                  "END AS sexo"
                tablas1 += " LEFT JOIN public.sivel2_gen_profesion "\
                  "AS profesion ON victima.profesion_id=profesion.id"
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

          def victimizaciones_gen_tabla(
            pFini, pFfin, pTviolencia, pEtiqueta1, pEtiqueta2,
            pExcluirCateRep, pSegun, pDepartamento, pMunicipio, otro,
            pCategoria, pAgrucol)

            tcons1 = self.filtros_victimizaciones_gen(
              pFini, pFfin, pTviolencia, pEtiqueta1, pEtiqueta2, 
              pExcluirCateRep, pSegun, pDepartamento, pMunicipio, nil, pCategoria)

            opsegun =  ["", 
                        "ACTOS PRESUNTOS RESPONSABLES", 
                        "FILIACIÓN", 
                        "MES CASO", 
                        "ORGANIZACIÓN SOCIAL", 
                        "PROFESIÓN", 
                        "RANGO DE EDAD", 
                        "REGIÓN",
                        "SECTOR SOCIAL", 
                        "SEXO"
            ]

            que3 = []
            tablas3 = tcons1
            where3 = ''

            que3 << ["tviolencia_id", 'T. Violencia']
            que3 << ["categoria_id", 'Id. Categoria']
            que3 << ["categoria", 'Categoria']

            if (pDepartamento.to_i == 1 || pMunicipio.to_i == 1) 
              que3 << ["departamento_divipola", "Cod. Departamento"]
              que3 << ["departamento_nombre", "Departamento"]
            end

            if (pMunicipio.to_i == 1) 
              que3 << ["municipio_divipola", "Cod. Municipio"]
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

              when "REGIÓN"
                que3 << ["region", "Región"]


              when "SECTOR SOCIAL"
                que3 << ["sectorsocial_nombre", "Sector social"]

              when "SEXO"
                que3 << ["sexo", "Sexo"]

              end
            end

            #          "CREATE VIEW #{tcons2} AS SELECT #{tcons1}.*,
            #            ubicacion.departamento_id, departamento.nombre AS departamento_nombre, 
            #            ubicacion.municipio_id, municipio.nombre AS municipio_nombre, 
            #            ubicacion.centropoblado_id, centropoblado.nombre AS centropoblado_nombre
            #            FROM
            #            #{tcons1} LEFT JOIN msip_ubicacion AS ubicacion ON
            #              (#{tcons1}.caso_id = ubicacion.caso_id) 
            #            LEFT JOIN msip_departamento AS departamento ON 
            #              (ubicacion.departamento_id=departamento.id) 
            #            LEFT JOIN msip_municipio AS municipio ON 
            #              (ubicacion.municipio_id=municipio.id)
            #            LEFT JOIN msip_centropoblado AS centropoblado ON 
            #              (ubicacion.centropoblado_id=centropoblado.id)"
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

            coltotales = [i-1, i]
            if (gb != "") 
              gb ="GROUP BY #{gb}" #ORDER BY #{i} DESC"
            end
            gb += " ORDER BY categoria_id"

            twhere3 = where3 == "" ? "" : "WHERE " + where3
            q3 = "SELECT #{qc} \n"\
              "COUNT(cast(#{tcons1}.caso_id as text)) \n"\
              "FROM #{tablas3} \n #{twhere3} \n #{gb}"
            puts "q3=#{q3}"

            if pAgrucol == 'CATEGORÍA'
              totalesfila = true

              if que3.count == 3
                # Si no se desagrega, solo presenta tabla mínima con 
                # categorías y conteos por categoría
                q4 = "SELECT categoria, SUM(count)::INTEGER " +
                  "FROM (#{q3}) AS sub GROUP BY 1 ORDER BY 1;"
                r = ActiveRecord::Base.connection.select_all(q4)
                enctabla = []
                fila = []
                i = 0
                r.each do |t|
                  enctabla << CGI.escapeHTML(t['categoria'])
                  fila << CGI.escapeHTML(t['sum'].to_s)
                  coltotales << i
                  i += 1
                end
                cuerpotabla = [fila]

              elsif que3.count == 4
                # Si se desagrega, pone los desagregados en columnas
                fila = que3.last[0]
                fila_hum = que3.last[1]
                q4 = "SELECT #{fila}, categoria, SUM(count)::INTEGER " +
                  "FROM (#{q3}) AS sub GROUP BY 1, 2 ORDER BY 1, 2;"

                r = ActiveRecord::Base.connection.select_all(q4)
                enctabla = []
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
                enctabla << fila_hum
                i = 1
                et.each do |e|
                  enctabla << CGI.escapeHTML(e)
                  coltotales << i
                  i += 1
                end
                cuerpotabla = []
                filas.each do |f|
                  ft = [f]
                  et.each do |e|
                    if inter[f] && inter[f][e]
                      ft << inter[f][e]
                    else
                      ft << 0
                    end
                  end
                  cuerpotabla << ft
                end

              end
            elsif pAgrucol == 'RÓTULO'
              totalesfila = true
              sub = "SELECT DISTINCT caso_id, persona_id, categoria_id, "\
                "c.pconsolidado_id, p.nombre FROM cvt1 "\
                " JOIN sivel2_gen_categoria AS c "\
                "  ON cvt1.categoria_id=c.id "\
                "JOIN sivel2_gen_pconsolidado AS p "\
                "  ON p.id=c.pconsolidado_id"

              if que3.count == 3
                # Si no se desagrega, solo presenta tabla mínima con 
                # categorías y conteos por categoría
                numpersonas = ActiveRecord::Base.connection.select_all(
                  "SELECT count(DISTINCT persona_id) FROM (#{sub}) AS sub"
                )[0]['count']
                q4 = "SELECT nombre, count(*)" +
                  "FROM (#{sub}) AS sub GROUP BY 1 ORDER BY 1;"
                puts "OJO q4=#{q4}"
                r = ActiveRecord::Base.connection.select_all(q4)
                enctabla = []
                fila = []
                i = 0
                r.each do |t|
                  enctabla << CGI.escapeHTML(t['nombre'].to_s)
                  fila << CGI.escapeHTML(t['count'].to_s)
                  coltotales << i
                  i += 1
                end
                cuerpotabla = [fila]

              elsif que3.count == 4
                # Si se desagrega, pone los desagregados en columnas
                fila = que3.last[0]
                fila_hum = que3.last[1]

                sub = "SELECT DISTINCT cvt1.caso_id, persona_id, categoria_id, "\
                  "c.pconsolidado_id, p.nombre AS rotulo, "\
                  "(SELECT r.nombre FROM  sivel2_gen_caso_region AS cr "\
                  "  JOIN sivel2_gen_region AS r ON cr.region_id=r.id "\
                  "  WHERE cr.caso_id=cvt1.caso_id LIMIT 1) AS region "\
                  " FROM cvt1 "\
                  " JOIN sivel2_gen_categoria AS c "\
                  "  ON cvt1.categoria_id=c.id "\
                  "JOIN sivel2_gen_pconsolidado AS p "\
                  "  ON p.id=c.pconsolidado_id "

                q4 = "SELECT #{fila}, rotulo, count(*)::INTEGER " +
                  "FROM (#{sub}) AS sub GROUP BY 1, 2 ORDER BY 1, 2;"
                puts "OJO q4=#{q4}"
                r = ActiveRecord::Base.connection.select_all(q4)
                enctabla = []
                inter = {}
                filas = []
                et = []
                r.each do |t|
                  if !inter[t[fila]]
                    inter[t[fila]] = {}
                  end
                  if !inter[t[fila]][t['rotulo']]
                    inter[t[fila]][t['rotulo']] = 0
                  end
                  inter[t[fila]][t['rotulo']] += t['count'].to_i
                  if !et.include?(t['rotulo'])
                    et << t['rotulo']
                  end
                  if !filas.include?(t[fila])
                    filas << t[fila]
                  end
                end
                et.sort!
                enctabla << fila_hum
                i = 1
                et.each do |e|
                  enctabla << CGI.escapeHTML(e)
                  coltotales << i
                  i += 1
                end
                cuerpotabla = []
                filas.each do |f|
                  ft = [f]
                  et.each do |e|
                    if inter[f] && inter[f][e]
                      ft << inter[f][e]
                    else
                      ft << 0
                    end
                  end
                  cuerpotabla << ft
                end

              end

            else
              que3 << ["", "Victimizaciones"]
              cuerpotabla = ActiveRecord::Base.connection.select_all(q3)

              enctabla = []
              que3.each do |t|
                if (t[1] != "") 
                  enctabla << CGI.escapeHTML(t[1])
                end
              end
            end

            return [opsegun, coltotales, totalesfila, 
                    numpersonas, enctabla, cuerpotabla]
          end


        end # class_methods

      end
    end
  end
end

