module Sivel2Gen
  module Concerns
    module Controllers
      module CategoriasController
        extend ActiveSupport::Concern

        included do

          before_action :set_categoria, only: [:show, :edit, :update, :destroy]

          def clase
            "Sivel2Gen::Categoria"
          end

          def set_categoria
            @basica = Categoria.find(params[:id])
          end

          def atributos_index
            [
              :id,
              :nombre,
              :supracategoria_id,
              :contadaen,
              :tipocat,
              :pconsolidado_id,
              :observaciones,
              :fechacreacion_localizada,
              :habilitado
            ]
          end

          def atributos_form
            atributos_show -
              [:fechacreacion_localizada]-
              [:fechadeshabilitacion_localizada] +
              [:fechacreacion] +
              [:fechadeshabilitacion]
          end

          def filtra_por_tviolencia
            datos = []
            if params[:tviolencia] && Sivel2Gen::Supracategoria.where(
                tviolencia_id: params[:tviolencia]).count > 0

              supras = Sivel2Gen::Supracategoria.
                where(tviolencia_id: params[:tviolencia])
              @categorias = Sivel2Gen::Categoria.
                habilitados.where(supracategoria_id: supras.pluck(:id))
              datos[0] = @categorias.map { |cat| cat.id }
              par = params[:tviolencia]
              datos[1] = @categorias.map { |k| par + k.id.to_s + " " + k.nombre }
            end
            if params[:categorias_seleccionadas] && 
                params[:categorias_seleccionadas] != ''
              categorias = Sivel2Gen::Categoria.where(
                id: params[:categorias_seleccionadas]
              ).map { |cat| cat.supracategoria.tviolencia_id }
              datos[0] = false
              if categorias.uniq.size <= 1
                supras = Sivel2Gen::Supracategoria.
                  where(tviolencia_id: categorias.uniq[0])
                total_categorias = Sivel2Gen::Categoria.
                  habilitados.where(
                    supracategoria_id: supras.pluck(:id)
                  )
                if total_categorias.count == categorias.count
                  datos[0] = true
                end
              end
            end
            respond_to do |format|
              format.json do
                render json: datos
                return
              end
            end
          end

          def categoria_params
            params.require(:categoria).permit(*atributos_form)
          end

        end # included

      end
    end
  end
end
