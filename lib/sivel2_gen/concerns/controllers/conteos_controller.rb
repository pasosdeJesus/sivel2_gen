# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Controllers
      module ConteosController
        extend ActiveSupport::Concern

        included do

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
            w += " " + n + opcmp + Sivel2Gen::Caso.sanitize(v)
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

          def param_escapa(p)
            params[p] ? Sivel2Gen::Caso.connection.quote_string(params[p]) : ''
          end

          def agrega_tipico(tabla, nomtabla, que1, tablas3, where3, que3)
            que1 = agrega_tabla(
              que1, "victima.id_#{tabla} AS id_#{tabla}")
            tablas3 = agrega_tabla(
              tablas3, "sivel2_gen_#{tabla} AS #{tabla}")
            where3 = consulta_and_sinap(
              where3, "id_#{tabla}", "#{tabla}.id")
            que3 << ["#{tabla}.nombre", nomtabla]
            return [que1, tablas3, where3, que3]
          end


          def personas
            authorize! :contar, Sivel2Gen::Caso
            pSegun = param_escapa('segun')
            pMunicipio = param_escapa('municipio')
            pDepartamento = param_escapa('departamento')

            # La estrategia es 
            # 1. Agrupar en la vista cons1 personas con lo que se contará 
            #    restringiendo por filtros con códigos sin desp. ni info geog.
            # 2. En vista cons2 dejar lo mismo que en cons1, pero añadiendo
            #    expulsión más reciente y su ubicacion si la hay.
            #    Al añadir info. geográfica no es claro
            #    cual poner, porque un caso debe tener varias ubicaciones 
            #    correspondientes a los sitios por donde ha pasado durante
            #    desplazamientos.  Estamos suponiendo que interesa
            #    el sitio de la ultima expulsion.
            # 3. Contar beneficiarios contactos sobre cons2, cambiar códigos
            #    por información por desplegar
            # 4. Contar beneficiarios no contactos sobre cons2, cambiar códigos
            #    por información por desplegar

            # Validaciones todo caso tiene victima
            # Validaciones todo caso tiene ubicacion

            cons1 = 'cben1';
            cons2 = 'cben2';
            @fechaini = '';
            where1 = '';
            if (params[:fechaini] && params[:fechaini] != "") 
              pfechaini = DateTime.strptime(params[:fechaini], '%Y-%m-%d')
              @fechaini = pfechaini.strftime('%Y-%m-%d')
              where1 = consulta_and(
                where1, "caso.fecha", @fechaini, ">="
              )
            end
            @fechafin = '';
            if (params[:fechafin] && params[:fechafin] != "") 
              pfechafin = DateTime.strptime(params[:fechafin], '%Y-%m-%d')
              @fechafin = pfechafin.strftime('%Y-%m-%d')
              where1 = consulta_and(
                where1, "caso.fecha", @fechafin, "<="
              )
            end
            #byebug
            que1 = 'caso.id AS id_caso, victima.id_persona AS id_persona,
            1 AS npersona'
            tablas1 = 'sivel2_gen_caso AS caso, ' +
              ' sivel2_gen_victima AS victima'

            # Para la consulta final emplear arreglo que3, que tendrá parejas
            # (campo, titulo por presentar en tabla)
            que3 = []
            tablas3 = "#{cons2}"
            where3 = ''

            #    consulta_and(where1, 'caso.id', GLOBALS['idbus'], '<>')
            where1 = consulta_and_sinap(where1, "caso.id", "victima.id_caso")

            #byebug
            case pSegun
            when ''
              que1 = agrega_tabla(que1, 'cast(\'total\' as text) as total')
              que3 << ["", ""]

            when 'ETNIA'
              que1, tablas3, where3, que3 = agrega_tipico(
                'etnia', 'Etnia', que1, tablas3, where3, que3
              )

            when 'FILIACIÓN'
              que1, tablas3, where3, que3 = agrega_tipico(
                'filiacion', 'Filiacion', que1, tablas3, where3, que3
              )
              #que1 = agrega_tabla(
              #  que1, 'victima.id_filiacion AS id_filiacion')
              #tablas3 = agrega_tabla(
              #  tablas3, 'sivel2_gen_filiacion AS filiacion')
              #where3 = consulta_and_sinap(
              #  where3, "id_filiacion", "filiacion.id")
              #que3 << ["filiacion.nombre", "Filiación"]

            when 'MES CASO'
              que1 = agrega_tabla(
                que1, "extract(year from fecha) || '-' " +
                "|| lpad(cast(extract(month from fecha) as text), 2, " +
                "cast('0' as text)) as mes")
              que3 << ["mes", "Mes"]

            when 'ORGANIZACIÓN'
              que1, tablas3, where3, que3 = agrega_tipico(
                'organizacion', 'Organización', 
                que1, tablas3, where3, que3
              )
#              que1 = agrega_tabla(
#                que1, 'victima.id_organizacion AS id_organizacion')
#              tablas3 = agrega_tabla(
#                tablas3, 'sivel2_gen_organizacion AS organizacion')
#              where3 = consulta_and_sinap(
#                where3, "id_organizacion", "organizacion.id")
#              que3 << ["organizacion.nombre", "Organización"]
#
            when 'PROFESIÓN'
              que1, tablas3, where3, que3 = agrega_tipico(
                'profesion', 'Profesion', 
                que1, tablas3, where3, que3
              )
#              que1 = agrega_tabla(
#                que1, 'victima.id_profesion AS id_profesion')
#              tablas3 = agrega_tabla(
#                tablas3, 'sivel2_gen_profesion AS profesion')
#              where3 = consulta_and_sinap(
#                where3, "id_profesion", "profesion.id")
#              que3 << ["profesion.nombre", "Profesión"]
#
            when 'RANGO DE EDAD'
              que1, tablas3, where3, que3 = agrega_tipico(
                'rangoedad', 'Rango de Edad', 
                que1, tablas3, where3, que3
              )
#              que1 = agrega_tabla(
#                que1, 'victima.id_rangoedad AS id_rangoedad')
#              tablas3 = agrega_tabla(
#                tablas3, 'sivel2_gen_rangoedad AS rangoedad')
#              where3 = consulta_and_sinap(
#                where3, "id_rangoedad", "rangoedad.id")
#              que3 << ["rangoedad.nombre", "Rango de Edad"]
#
            when 'SECTOR SOCIAL'
              que1, tablas3, where3, que3 = agrega_tipico(
                'sectorsocial', 'Sector Social', 
                que1, tablas3, where3, que3
              )
#              que1 = agrega_tabla(
#                que1, 'victima.id_sectorsocial AS id_sectorsocial')
#              tablas3 = agrega_tabla(
#                tablas3, 'sivel2_gen_sectorsocial AS sectorsocial')
#              where3 = consulta_and_sinap(
#                where3, "id_sectorsocial", "sectorsocial.id")
#              que3 << ["sectorsocial.nombre", "Sector Social"]
#
            when 'VÍNCULO CON EL ESTADO'
              que1, tablas3, where3, que3 = agrega_tipico(
                'vinculoestado', 'Vínculo con el Estado', 
                que1, tablas3, where3, que3
              )
#              que1 = agrega_tabla(
#                que1, 'victima.id_vinculoestado AS id_vinculoestado')
#              tablas3 = agrega_tabla(
#                tablas3, 'sivel2_gen_vinculoestado AS vinculoestado')
#              where3 = consulta_and_sinap(
#                where3, "id_vinculoestado", "vinculoestado.id")
#              que3 << ["vinculoestado.nombre", "Vínculo con el Estado"]
#
            when 'SEXO'
              que1 = agrega_tabla(que1, 'persona.sexo AS sexo')
              tablas1 = agrega_tabla(tablas1, 'sip_persona AS persona')
              where1 = consulta_and_sinap(
                where1, "persona.id", "victima.id_persona")
              que3 << ["sexo", "Sexo"]


            else
              puts "opción desconocida pSegun=#{pSegun}"
            end

            ActiveRecord::Base.connection.execute "DROP VIEW  IF EXISTS #{cons2}"
            ActiveRecord::Base.connection.execute "DROP VIEW  IF EXISTS #{cons1}"

            if where1 != ''
              where1 = 'WHERE ' + where1
            end
            # Filtrar 
            q1="CREATE VIEW #{cons1} AS 
              SELECT #{que1}
              FROM #{tablas1} #{where1}
            "
            puts "OJO q1 es #{q1}<hr>"
            ActiveRecord::Base.connection.execute q1

            # Paso 2
            # Añadimos información geográfica que se pueda
            q2="CREATE VIEW #{cons2} AS SELECT #{cons1}.*,
            ubicacion.id_departamento, 
            departamento.nombre AS departamento_nombre, 
            ubicacion.id_municipio, municipio.nombre AS municipio_nombre, 
            ubicacion.id_clase, clase.nombre AS clase_nombre
            FROM
            #{cons1} LEFT JOIN sip_ubicacion AS ubicacion ON
              (#{cons1}.id_caso = ubicacion.id_caso) 
            LEFT JOIN sip_departamento AS departamento ON 
              (ubicacion.id_departamento=departamento.id) 
            LEFT JOIN sip_municipio AS municipio ON 
              (ubicacion.id_municipio=municipio.id)
            LEFT JOIN sip_clase AS clase ON 
              (ubicacion.id_clase=clase.id)
            GROUP BY 1,2,3,4,5,6,7,8,9,10"

            #puts "OJO q2 es #{q2}<hr>"
            ActiveRecord::Base.connection.execute q2

            if (pDepartamento == "1") 
              que3 << ["departamento_nombre", "Departamento"]
            end
            if (pMunicipio== "1") 
              que3 << ["municipio_nombre", "Municipio"]
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
            @coltotales = [i-1, i, i+1]
            que3 << ["", "Víctimas"]
            twhere3 = where3 == "" ? "" : "WHERE " + where3
            q3="SELECT #{qc}
            SUM(#{cons2}.npersona) AS npersona
            FROM #{tablas3}
            #{twhere3}
            #{gb}"
            #puts "OJO q3 es #{q3}"
            @cuerpotabla = ActiveRecord::Base.connection.select_all(q3)

            @enctabla = []
            que3.each do |t|
              if (t[1] != "") 
                @enctabla << CGI.escapeHTML(t[1])
              end
            end

            respond_to do |format|
              format.html { }
              format.json { head :no_content }
              format.js   { render 'resultado' }
            end
          end # def personas
          
        end

      end
    end
  end
end

