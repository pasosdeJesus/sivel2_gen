
module Sivel2Gen
  class MapadepController < ApplicationController

    # Control de acceso no estándar en función
    
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

      respond_to do |format|
        format.html { render 'mapadep_victimizaciones', layout: 'application' }
        format.json { render head :no_content }
        format.js { render 'actualiza_mapa' }
      end
    end

  end
end
