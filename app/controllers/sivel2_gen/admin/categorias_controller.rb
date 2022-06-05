module Sivel2Gen
  module Admin
    class CategoriasController < Sip::Admin::BasicasController
      before_action :set_categoria, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Categoria

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
          :id_pconsolidado, 
          :observaciones, 
          :fechacreacion_localizada, 
          :habilitado
        ]
      end

      def atributos_form
        atributos_show
      end

      def filtra_por_tviolencia
        datos= []
        if params[:tviolencia]
          supra = Sivel2Gen::Supracategoria.where(id_tviolencia: params[:tviolencia])[0]
          @categorias = Sivel2Gen::Categoria.habilitados.where(supracategoria_id: supra.id)
          datos[0]= @categorias.map{|cat| cat.id}
          datos[1] = @categorias.map{|cat| params[:tviolencia] + cat.id.to_s + ' ' + cat.nombre}

        end
        if params[:categorias_seleccionadas]
          categorias = Sivel2Gen::Categoria.where(id: params[:categorias_seleccionadas]).map{|cat| cat.supracategoria.id_tviolencia}
          datos[0] = false
          if categorias.uniq.size <= 1
            supra = Sivel2Gen::Supracategoria.where(id_tviolencia: categorias.uniq[0])[0]
            total_categorias = Sivel2Gen::Categoria.habilitados.where(supracategoria_id: supra.id)

            if total_categorias.count == categorias.count
              datos[0] = true
            end
          end
        end
        respond_to do |format|
          format.json {
            render json: datos
            return
          }
        end
      end

      def categoria_params
        params.require(:categoria).permit(*atributos_form)
      end

    end
  end
end
