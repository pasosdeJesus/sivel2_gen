module Sivel2Gen
  module Concerns
    module Controllers
      module GraficarConteoController
        extend ActiveSupport::Concern

        included do

          include Sip::FormatoFechaHelper
          include Sip::SqlHelper

          # Estructura para mantener filtros posibles y desagregar según estos
          # Cada entrada es como en el siguiente ejemplo
          #   'ETNIA' => { 
          #      nomfiltro: :etnias,
          #      coleccion: Sivel2Gen::Etnia.all.order(:nombre), 
          #      # No usuamos habilitados porque deben incluirse históricos
          #      metodo_etiqueta: :nombre,
          #      metodo_id: :id,
          #      campocons: 'victima.id_etnia'
          #    }
          # O para colecciones como sexo:
          #   'SEXO' => { 
          #      nomfiltro: :sexos,
          #      coleccion: Sip::Persona::sexo_opciones,
          #      metodo_etiqueta: false,
          #      metodo_id: false,
          #      campocons: 'persona.sexo'
          #    }
          # O cuando un filtro no se maneja de manera genérica
          # 'CATEGORIA' => {
          #      nomfiltro: nil,
          #      coleccion: nil,
          #      metodo_etiqueta: nil,
          #      metodo_id: nil,
          #      campocons: 'categoria.id'
          #    }
          @estfiltrosm = {}

          @opdesagregarpor = []  # Opciones para desagregar segun

          # Valores ingresados en formulario
          @pFechaini = '' # Filtro por fecha inicial
          @pFechafin = '' # Filtro por fecha final
          @pDesagregarpor = '' # Desagregar según

          # Resultados
          @cuerpotabla = nil # Resultado de consulta que llenará tabla
          @enctabla = [] # Encabezado de tabla que se llenará

          def plantillahtml 
            'sivel2_gen/conteos/personas'
          end

          def tiposgraficas 
            [ 
              'BARRAS VERTICALES', 
              'BARRAS HORIZONTALES',
              'LÍNEAS',
              'ÁREAS',
              'TORTA',
              'DONA'
            ]
          end

          # Llena variables de clase: @opdesagregarpor, @estfiltrosm
          def arma_estructuras
            @estfiltrosm = arma_estfiltrosm()
            @opdesagregarpor =  [''] + @estfiltrosm.keys
          end

          # Arma varios filtros de selección múltiple genéricos
          def arma_estfiltrosm_gen
            f = {
              'DEPARTAMENTO' => { 
                nomfiltro: :departamentos,
                coleccion: Sip::Departamento.where(
                  id_pais: ENV.fetch('SIVEL2_PAIS', '170').to_i).order(:nombre),
                metodo_etiqueta: :nombre,
                metodo_id: :id,
                campocons: 'departamento.id'
              },
              'SEXO' => { 
                nomfiltro: :sexos,
                coleccion: Sip::Persona::sexo_opciones,
                metodo_etiqueta: false,
                metodo_id: false,
                campocons: 'persona.sexo'
              }
            }

            return f
          end # arma_estfiltrosm_gen

          # Arma filtros de selección múltiple 
          def arma_estfiltrosm
            arma_estfiltrosm_gen
          end


          def cons1 
            'cvt1'
          end


          def cons1 
            'cvt2'
          end


          # A partir de params llena @pFechaini, @pFechafin y 
          # retorna where1 limitando a esas
          def procesa_filtros_fechas(where1)
            if (params[:filtro] && params[:filtro]['fechaini'] && 
                params[:filtro]['fechaini'] != "") 
              @pFechaini = fecha_local_estandar(params[:filtro]['fechaini'])
            else
              @pFechaini = Sivel2Gen::Caso.minimum(:fecha).to_s
            end
            where1 = ampliar_where(where1, 'caso.fecha', @pFechaini, '>=')
            if (params[:filtro] && params[:filtro]['fechafin'] && 
                params[:filtro]['fechafin'] != "") 
              @pFechafin = fecha_local_estandar(params[:filtro]['fechafin'])
            else
              @pFechafin = Sivel2Gen::Caso.maximum(:fecha).to_s
            end
            return ampliar_where(where1, 'caso.fecha', @pFechafin, '<=')
          end


          def procesa_un_filtrom(where1, r, ids)
            if r[:nomfiltro] == :aniosnac
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

          # Retorna consultas y llena variables de clase usadas
          # en formulario como @pFechaini, @pFechafin
          # No procesa pDesagregarpor
          def procesa_filtrosm(que1, tablas1, where1, que3, 
                                  tablas3, where3)
            @estfiltrosm.each do |e, r|
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
                  where1 = ampliar_where_sinap(where1, 'TRUE', 'FALSE', '=')
                else
                  where1 = procesa_un_filtrom(where1, r, ids)
                end
              end

            end

            return [que1, tablas1, where1, que3, tablas3, where3]
          end


          def procesa_filtros_categoria(where1)
            pTviolencia = escapar_param(params, [:filtro, 'tviolencia_id'])
            @pDesagregarpor = escapar_param(params, [:filtro, 'segun'])
            pExcluirCateRep = escapar_param(params, [:filtro, 'excluircaterep'])
            lcat = Sivel2Gen::Categoria.habilitados.pluck(:id)
            pCategoria = params[:filtro] && params[:filtro][:categoria] ?
              lcat & params[:filtro][:categoria].map(&:to_i) : lcat
        
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

            return where1
          end


          def procesa_filtros(que1, tablas1, where1, que3, 
                              tablas3, where3)
            where1 = procesa_filtros_categoria(where1)
            return procesa_filtrosm(que1, tablas1, where1, que3, 
                                       tablas3, where3)
          end


          def desagregarpor_tipico(tabla, nomtabla, que1, que3, tablas3, where3)
            que1 = agregar_tabla(
              que1, "victima.id_#{tabla} AS id_#{tabla}")
            tablas3 = agregar_tabla(
              tablas3, "public.sivel2_gen_#{tabla} AS #{tabla}")
            where3 = ampliar_where_sinap(
              where3, "id_#{tabla}", "#{tabla}.id")
            que3 << ["#{tabla}.nombre", nomtabla]
            return [que1, que3, tablas3, where3]
          end


          def procesa_desagregarpor_om(que1, tablas1, where1, que3, tablas3, where3)

            case @pDesagregarpor
            when ''
              que1 = agregar_tabla(que1, 'cast(\'total\' as text) as total')
              que3 << ["", ""]

            when 'MES CASO'
              que1 = agregar_tabla(
                que1, "extract(year from fecha) || '-' " +
                "|| lpad(cast(extract(month from fecha) as text), 2 , " +
                "cast('0' as text)) as mes")
              que3 << ["mes", "Mes"]

            when 'ORGANIZACIÓN'
              que1, que3, tablas3, where3 = desagregarpor_tipico(
                'organizacion', 'Organización', 
                que1, que3, tablas3, where3
              )

            when 'CATEGORIA'
              que1, que3, tablas3, where3 = desagregarpor_tipico(
                'categoria', 'Categoria', 
                que1, que3, tablas3, where3
              )

            when 'RANGO DE EDAD'
              que1, que3, tablas3, where3 = desagregarpor_tipico(
                'rangoedad', 'Rango de Edad', 
                que1, que3, tablas3, where3
              )

            when 'SECTOR SOCIAL'
              que1, que3, tablas3, where3 = desagregarpor_tipico(
                'sectorsocial', 'Sector Social', 
                que1, que3, tablas3, where3
              )

            when Sivel2Gen::Victima.human_attribute_name(:vinculoestado).upcase
              que1, que3, tablas3, where3 = desagregarpor_tipico(
                'vinculoestado', Sivel2Gen::Victima.human_attribute_name(:vinculoestado),
                que1, que3, tablas3, where3
              )

            when 'SEXO'
              que1 = agregar_tabla(que1, 'persona.sexo AS sexo')
              que3 << ["sexo", "Sexo"]

            else
              puts "opción desconocida pDesagregarpor=#{@pDesagregarpor}"
            end

            return que1, tablas1, where1, que3, tablas3, where3
          end


          def procesa_desagregarpor(que1, tablas1, where1, que3, tablas3, where3)
            @pDesagregarpor = escapar_param(params, [:filtro, 'desagregarpor'])

            return procesa_desagregarpor_om(
              que1, tablas1, where1, que3, tablas3, where3
            )
          end


          # A partir de vista cons1, crea vista cons2 que añade
          # información geografica
          def vista_geo(que3, tablas3, where3)
            if (@pDepartamento == "1") 
              que3 << ["departamento_nombre", "Departamento"]
            end
            if (@pMunicipio== "1") 
              que3 << ["municipio_nombre", "Municipio"]
            end

            return ["CREATE VIEW #{cons2} AS SELECT #{cons1}.*,
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
            #{cons1} JOIN sivel2_gen_caso AS caso ON
              (#{cons1}.id_caso = caso.id) 
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
          def consulta_final(i, que3, tablas3, where3, qc, gb)
            @coltotales = [i-1]
            que3 << ["", "Víctimas"]
            twhere3 = where3 == "" ? "" : "WHERE " + where3
            q3="SELECT #{qc}
            SUM(#{cons2}.npersona) AS npersona
            FROM #{tablas3}
            #{twhere3}
            #{gb}"
            #puts "OJO q3 es #{q3}"
            return q3
          end


          def post_consulta_final
            @pColormax = @colorg = escapar_param(params,  [:filtro, 'colormax'])
            @pTipografica = escapar_param(params,  [:filtro, 'tipografica'])
          end


          def inicializa(where1)
            # Para la vista cons1 emplear que1, tablas1 y where1
            que1 = 'DISTINCT acto.id_caso, acto.id_persona, acto.id_categoria,'\
              'supracategoria.id_tviolencia AS id_tviolencia, '\
              'categoria.nombre AS categoria'
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
            return [que1, tablas1, where1]
          end


          def consulta
            authorize! :contar, Sivel2Gen::Caso

            arma_estructuras

            # La estrategia es 
            # 1. Agrupar en la vista cons1 lo que se contará 
            #    restringiendo por filtros con códigos sin desp. ni info geog.
            # 2. En vista cons2 dejar lo mismo que en cons1, pero añadiendo
            #    info geografica.
            # 3. Contar sobre cons2, cambiar códigos
            #    por información por desplegar

            # Validaciones todo caso tiene victima
            # Validaciones todo caso tiene ubicacion
            where1 = '';
            que1, tablas1, where1 = inicializa(where1)

            where1 = procesa_filtros_fechas(where1)

            # Para la consulta final emplear arreglo que3, que tendrá parejas
            # (campo, titulo por presentar en tabla)
            que3 = []
            tablas3 = "#{cons2}"
            where3 = ''
            que1, tablas1, where1, que3, tablas3, where3 = procesa_filtros(
              que1, tablas1, where1, que3, tablas3, where3)

            que1, tablas1, where1, que3, tablas3, where3 = 
              procesa_desagregarpor(
                que1, tablas1, where1, que3, tablas3, where3)
            ActiveRecord::Base.connection.execute "DROP VIEW  IF EXISTS #{cons2} CASCADE"
            ActiveRecord::Base.connection.execute "DROP VIEW  IF EXISTS #{cons1} CASCADE"

            if where1 != ''
              where1 = 'WHERE ' + where1
            end
            # Filtrar 
            q1="CREATE VIEW #{cons1} AS 
              SELECT #{que1}
              FROM #{tablas1} #{where1}
            "
#            q1 += 'GROUP BY '
#            q1 += (3..que1.split(',').count).to_a.join(', ')
            puts "OJO q1 es #{q1}<hr>"
            ActiveRecord::Base.connection.execute q1

            # Paso 2
            # Añadimos información geográfica que se pueda
            if cons2 != ''
              q2, que3, tablas3, where3 = 
                vista_geo(que3, tablas3, where3)
              #puts "OJO q2 es #{q2}<hr>"
              ActiveRecord::Base.connection.execute q2
            end

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
            q3 = consulta_final(i, que3, tablas3, where3, qc, gb)
            puts "OJO q3=#{q3}"
            @cuerpotabla = ActiveRecord::Base.connection.select_all(q3)

            @enctabla = []
            que3.each do |t|
              if (t[1] != "") 
                @enctabla << CGI.escapeHTML(t[1])
              end
            end

            post_consulta_final
          end # def consulta



          def graficar
            consulta

            respond_to do |format|
              format.html { 
                render plantillahtml, layout: 'application' 
              }
              format.json { head :no_content }
              format.js   { 
                render plantillahtml
              }
            end
          end # def grafica


          # Llamada desde vista para ajusta serie y opciones
          def ajusta_serie_opciones(serie, opciones)
          end

        end  #include


      end
    end
  end
end

