
module Sivel2Gen
  module Concerns
    module Controllers
      module ActoscolectivosController
        extend ActiveSupport::Concern

        included do

         def create
           if params[:caso][:id].nil?
             respond_to do |format|
               format.html { render inline: 'Falta identificacion del caso' }
             end
             return
           elsif !params[:caso_actocolectivo_presponsable_id]
             respond_to do |format|
               format.html { render inline: 'Debe tener Presunto Responsable' }
             end
             return
           elsif !params[:caso_actocolectivo_categoria_id]
             respond_to do |format|
               format.html { render inline: 'Debe tener Categoria' }
             end
             return
           elsif !params[:caso_actocolectivo_grupoper_id]
             respond_to do |format|
               format.html { render inline: 'Debe tener Víctima Colectiva' }
             end
             return
           else
             params[:caso_actocolectivo_presponsable_id].each do |cpresp|
               presp = cpresp.to_i
               params[:caso_actocolectivo_categoria_id].each do |ccat|
                 cat = ccat.to_i
                 params[:caso_actocolectivo_grupoper_id].each do |cvicc|
                   vicc = cvicc.to_i
                   @caso = Sivel2Gen::Caso.find(params[:caso][:id])
                   @caso.current_usuario = current_usuario
                   authorize! :update, @caso
                   if Sivel2Gen::Actocolectivo.where(
                     presponsable_id: presp,
                     categoria_id: cat,
                     grupoper_id: vicc,
                     caso_id: @caso.id).count == 0 then
                     actocolectivo = Sivel2Gen::Actocolectivo.new(
                       presponsable_id: presp,
                       categoria_id: cat,
                       grupoper_id: vicc,
                     )
                     actocolectivo.caso = @caso
                     actocolectivo.save!
                   end
                 end
               end
             end
           end
         end

         def destroy
           actocolectivo = Actocolectivo.where(id: params[:id].to_i).take
           if actocolectivo
             @caso = actocolectivo.caso
             actocolectivo.destroy!
           end
         end
        end
      end
    end
  end
end

