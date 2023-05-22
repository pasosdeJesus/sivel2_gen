module Sivel2Gen
  module Concerns
    module Controllers
      module MapamunController
        extend ActiveSupport::Concern

        included do

          include Msip::FormatoFechaHelper
          include Msip::SqlHelper

          # Control de acceso no estándar en función


          def ajusta_titulos(pFini, pFfin, pTviolencia, pEtiqueta1,
                             pEtiqueta2, pColormax)
            return
          end


          def victimizaciones
            authorize! :contar, Sivel2Gen::Caso

            # Filtros
            pFini = escapar_param(params, [:filtro, 'fechaini'])
            pFfin = escapar_param(params, [:filtro, 'fechafin'])
            pTviolencia = escapar_param(params, [:filtro, 'tviolencia_id'])
            pEtiqueta1 = escapar_param(params, [:filtro, 'etiqueta1'])
            pEtiqueta2 = escapar_param(params, [:filtro, 'etiqueta2'])
            pColormax = escapar_param(params, [:filtro, 'colormax'])
            pExcluirCateRep = escapar_param(params, [:filtro, 'excluircaterep'])
            pDepartamento = escapar_param(params, [:filtro, 'departamento'])
            if pDepartamento.nil? || pDepartamento == '' 
              pDepartamento = 11
            end

            lcat = Sivel2Gen::Categoria.habilitados.pluck(:id)
            pCategoria = params[:filtro] && params[:filtro][:categoria] ?
              lcat & params[:filtro][:categoria].map(&:to_i) : lcat

            cons = Sivel2Gen::ConteosController::genconsulta_victimizaciones(
              pFini, pFfin, pTviolencia, pEtiqueta1, pEtiqueta2, 
              pExcluirCateRep, nil, 1, 1, pCategoria
            )

            @mapamun_depid = pDepartamento.to_i > 0 ? pDepartamento.to_i : 
              11 # BOYACÁ
            idmun = Msip::Municipio.where(
              departamento_id: @mapamun_depid).take.id

            r = ActiveRecord::Base.connection.select_all(
              "SELECT  municipio_divipola, count(*) FROM #{cons} "\
              "WHERE departamento_id=#{@mapamun_depid} "\
              "GROUP BY 1")

            @mapa_muncuenta = {}
            r.each {|h| 
              @mapa_muncuenta[h['municipio_divipola']]=h['count']
            }
            @mapamun_titulo = 'VICTIMIZACIONES'
            if pTviolencia != ''
              @mapamun_titulo += " POR " +
                "#{Sivel2Gen::Tviolencia.find(pTviolencia).nombre}"
            end
            @mapamun_subtitulo = Sivel2Gen::MapadepController.nomrango(
              pFini != '' ? 
              Msip::FormatoFechaHelper::reconoce_adivinando_locale(pFini) : 
              Sivel2Gen::Caso.all.minimum(:fecha), 
              pFfin != '' ? 
              Msip::FormatoFechaHelper::reconoce_adivinando_locale(pFfin) : 
              Sivel2Gen::Caso.all.maximum(:fecha))
            colormax = Color::RGB.from_html(pColormax == '' ? '#00ff00' : pColormax)
            @mapamun_colormax_r = colormax.red.to_i
            @mapamun_colormax_v = colormax.green.to_i
            @mapamun_colormax_a = colormax.blue.to_i

            @mapamun_titulorangos = 'Rango de victimizaciones'
            @mapamun_fuente = "Fuente: " + ENV.fetch(
              "SIVEL2_MAPAFUENTE", 
              "Banco de Datos de Derechos Humanos, DIH y "\
              "Violencia Política del CINEP www.nocheyniebla.org")

            ajusta_titulos(pFini, pFfin, pTviolencia, pEtiqueta1,
                           pEtiqueta2, pColormax)


            hermanos = Msip::Municipio.where(departamento_id: @mapamun_depid)
            @depcad = render_to_string(
              partial: 'msip/admin/departamentos/show_svgruta_con_hermanos',
              locals: {
                registro: nil,
                hermanos: hermanos,
                maxdim: 768,
                prefijoid: "mixtimun"
              } 
            )

            respond_to do |format|
              format.html { render 'mapamun_victimizaciones', 
                            layout: 'application' }
              format.json { render head :no_content }
              format.js { render 'actualiza_mapa' }
            end
          end

        end # included do

      end
    end
  end
end

