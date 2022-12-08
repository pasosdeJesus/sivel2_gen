module Sivel2Gen
  module Concerns
    module Controllers
      module MapadepController
        extend ActiveSupport::Concern

        included do

          include Msip::FormatoFechaHelper
          include Msip::SqlHelper

          # Control de acceso no estándar en función

          def self.nomrango(fechaini, fechafin)
            if fechaini > fechafin
              return 'fechaini > fechafin'
            end
            if fechaini == fechafin
              return fechaini.to_s
            end
            ai = "/#{fechaini.year}"
            af = "/#{fechafin.year}"
            if fechaini.year == fechafin.year
              ai=''
              af=" de #{fechaini.year}"
            end
            if fechaini.day == 1
              mi = Msip::FormatoFechaHelper::MESES[fechaini.month]
            else
              mi = "#{fechaini.day}/#{fechaini.month}"
            end
            if fechafin.day == fechafin.end_of_month.day
              mf = Msip::FormatoFechaHelper::MESES[fechafin.month]
            else
              mf = "#{fechafin.day}/#{fechafin.month}"
            end
            return mi + ai + " - " + mf + af
          end


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

            lcat = Sivel2Gen::Categoria.habilitados.pluck(:id)
            pCategoria = params[:filtro] && params[:filtro][:categoria] ?
              lcat & params[:filtro][:categoria].map(&:to_i) : lcat

            cons = Sivel2Gen::ConteosController::genconsulta_victimizaciones(
              pFini, pFfin, pTviolencia, pEtiqueta1, pEtiqueta2, 
              pExcluirCateRep, nil, 1, nil, pCategoria
            )

            r = ActiveRecord::Base.connection.select_all(
              "SELECT  departamento_divipola, count(*) FROM #{cons} GROUP BY 1")

            @mapa_depcuenta = {}
            r.each {|h| 
              @mapa_depcuenta[h['departamento_divipola']]=h['count']
            }
            @mapadep_titulo = 'VICTIMIZACIONES'
            if pTviolencia != ''
              @mapadep_titulo += " POR " +
                "#{Sivel2Gen::Tviolencia.find(pTviolencia).nombre}"
            end
            @mapadep_subtitulo = Sivel2Gen::MapadepController.nomrango(
              pFini != '' ? 
              Msip::FormatoFechaHelper::reconoce_adivinando_locale(pFini) : 
              Sivel2Gen::Caso.all.minimum(:fecha), 
              pFfin != '' ? 
              Msip::FormatoFechaHelper::reconoce_adivinando_locale(pFfin) : 
              Sivel2Gen::Caso.all.maximum(:fecha))
            colormax = Color::RGB.from_html(pColormax == '' ? '#00ff00' : pColormax)
            @mapadep_colormax_r = colormax.red.to_i
            @mapadep_colormax_v = colormax.green.to_i
            @mapadep_colormax_a = colormax.blue.to_i

            @mapadep_titulorangos = 'Rango de victimizaciones'
            @mapadep_fuente = 'Fuente: Banco de Datos de Derechos Humanos, DIH y Violencia Política del CINEP www.nocheyniebla.org'

            ajusta_titulos(pFini, pFfin, pTviolencia, pEtiqueta1,
                           pEtiqueta2, pColormax)

            respond_to do |format|
              format.html { render 'mapadep_victimizaciones', layout: 'application' }
              format.json { render head :no_content }
              format.js { render 'actualiza_mapa' }
            end
          end

        end # included do

      end
    end
  end
end

