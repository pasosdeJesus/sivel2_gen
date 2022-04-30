
require 'date'

module Sivel2Gen
  module Concerns
    module Controllers
      module VictimasController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          load_and_authorize_resource class: Sivel2Gen::Victima

          def clase
            "Sivel2Gen::Victima"
          end

          def genclase
            return 'F'
          end

          def atributos_filtro_antestabla
            r = [
              :etiqueta_caso
            ]
          end

          def atributos_index
            r = [
              :id_caso,
              :fecha_caso_localizada,
              :ubicacion_caso,
              :nombre,
              :pconsolidado,
              :presponsables_caso,
              :presponsables_caso_ids
            ]
            r
          end

          def self.index_reordenar(c)
            #c.reorder(['sip_persona.nombres', 'sip_persona.apellidos', :id_caso])
            c.reorder([:id_caso])
          end


          def index(c = nil)
            if c == nil
              c = Sivel2Gen::Victima.joins(:persona).all.order(
                ['sip_persona.nombres', 'sip_persona.apellidos', :id_caso])
            end
            @titulo = 'Víctimas y Casos'
            @pconsolidado = Sivel2Gen::Pconsolidado.
              where(fechadeshabilitacion: nil).order(:peso, :id).map { |r|
              [r.id, r.nombre, Sivel2Gen::Categoria.
               where(id_pconsolidado: r.id).map(&:id)]
            }
            super(c)
          end


          # Crea un nuevo registro para el caso que recibe por parametro 
          # params[:caso_id].  Pone valores simples en los campos requeridos
          def nuevo
            if params[:caso_id]
              @persona = Sip::Persona.new
              @victima = Victima.new
              @persona.nombres = 'N'
              @persona.apellidos = 'N'
              @persona.sexo = 'S'
              if !@persona.save
                respond_to do |format|
                  format.html { render inline: 'No pudo crear persona' }
                end
                return
              end
              @victima.id_caso = params[:caso_id]
              @victima.id_persona = @persona.id
              if @victima.save
                respond_to do |format|
                  format.js { render json: {'victima' => @victima.id.to_s,
                                            'persona' => @persona.id.to_s} }
                  format.json { render json: {'victima' => @victima.id.to_s,
                                              'persona' => @persona.id.to_s}, 
                                              status: :created }
                  format.html { render json: {'victima' => @victima.id.to_s,
                                              'persona' => @persona.id.to_s} }
                end
              else
                respond_to do |format|
                  format.html { render action: "error" }
                  format.json { render json: @victima.errors, 
                                status: :unprocessable_entity }
                end
              end
            else
              respond_to do |format|
                format.html { render inline: 'Falta identificacion del caso' }
              end
            end
          end # nuevo

          def set_victima
            @victima = Sivel2Gen::Victima.find(params[:id])
            @registro = @victima
          end

          def vistas_manejadas
            ['Victima']
          end

        end # included

      end
    end
  end
end
