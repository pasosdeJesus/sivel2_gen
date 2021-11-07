
module Sivel2Gen
  class MapadepController < ApplicationController

    # Control de acceso no estándar en función

    def nomrango(fechaini, fechafin)
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
        mi = MES[fechaini.month]
      else
        mi = "#{fechaini.day}/#{fecahini.month}"
      end
      if fechafin.day == fechafin.end_of_month.day
        mi = MES[fechaini.month]
      else
        mi = "#{fechafin.day}/#{fechafin.month}"
      end
      return mi + ai + " - " + mf + af
    end


    def victimizaciones
      authorize! :contar, Sivel2Gen::Caso

      # Filtros
      pFini = Sivel2Gen::ApplicationHelper.param_escapa(
        params, [:filtro, 'fechaini'])
      pFfin = Sivel2Gen::ApplicationHelper.param_escapa(
        params, [:filtro, 'fechafin'])
      pTviolencia = Sivel2Gen::ApplicationHelper.param_escapa(
        params, [:filtro, 'tviolencia_id'])
      pEtiqueta1 = Sivel2Gen::ApplicationHelper.param_escapa(
        params, [:filtro, 'etiqueta1'])
      pEtiqueta2 = Sivel2Gen::ApplicationHelper.param_escapa(
        params, [:filtro, 'etiqueta2'])

      cons = Sivel2Gen::ConteosController::genconsulta_victimizaciones(
        pFini, pFfin, pTviolencia, pEtiqueta1, pEtiqueta2, nil,
        1, nil
      )

      r = ActiveRecord::Base.connection.select_all(
        "SELECT  departamento_divipola, count(*) FROM #{cons} GROUP BY 1")

      @mapa_depcuenta = {}
      r.each {|h| 
        @mapa_depcuenta[h['departamento_divipola']]=h['count']
      }
      @mapadep_titulo = 'Victimizaciones'
      @mapadep_subtitulo = nomrango(pFini ? Date.new(pFini) : @conscaso.min(fecha), 
                                  pFfin ? Date.new(pFfin) : @conscas.max(fecha))

      respond_to do |format|
        format.html { render 'mapadep_victimizaciones', layout: 'application' }
        format.json { render head :no_content }
        format.js { render 'actualiza_mapa' }
      end
    end

  end
end
