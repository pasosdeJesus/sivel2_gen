
module Sivel2Gen
  module Concerns
    module Controllers
      module PconsolidadosController
        extend ActiveSupport::Concern

        included do

          include ActionView::Helpers::AssetUrlHelper

          def clase 
            "Sivel2Gen::Pconsolidado"
          end

          def set_pconsolidado
            @basica = Pconsolidado.find(params[:id])
          end

          def atributos_index
            [:id, 
             :nombre, 
             :tipoviolencia, 
             :clasificacion, 
             :peso, 
             :observaciones, 
             :categoria_ids,
             :fechacreacion_localizada, 
             :habilitado
            ]
          end

          # Campos que se presentar en formulario
          def atributos_form
            r = atributos_show -  [:fechacreacion_localizada] + [:fechacreacion] -
              [:fechadeshabilitacion_localizada] + [:fechadeshabilitacion] - 
              ["id", :id, 'created_at', :created_at, 'updated_at', :updated_at]
            r[r.index(:categoria_ids)] = { 'categoria_ids' => [] }
            return r
          end

          def index_reordenar(c)
            c.reorder(:id)
          end

          def pconsolidado_params
            params.require(:pconsolidado).permit(*atributos_form)
          end

        end # included

      end
    end
  end
end
