module Sivel2Gen
  module Concerns
    module Controllers
      module RegionesController
        extend ActiveSupport::Concern

        included do

          include ActionView::Helpers::AssetUrlHelper

          Sip::Municipio.conf_presenta_nombre_con_origen = true
          Sip::Departamento.conf_presenta_nombre_con_origen = true

          def clase 
            "Sivel2Gen::Region"
          end

          def set_region
            @basica = Region.find(params[:id])
          end

          def atributos_index
            [
              "id", "nombre", "observaciones"] +
              [ :departamento_ids =>  [] ] +
              [ :municipio_ids =>  [] ] +
              [ 
                "fechacreacion_localizada", 
                "habilitado"
              ]
          end

          def genclase
            'F'
          end

          def region_params
            params.require(:region).permit(*atributos_form)
          end


        end # included

      end
    end
  end
end

