# frozen_string_literal: true

require "date"

module Sivel2Gen
  module Concerns
    module Controllers
      module VictimasController
        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          # Autorizaciones en controlador
          before_action :prepara_caso

          def clase
            "Sivel2Gen::Victima"
          end

          def genclase
            "F"
          end

          def atributos_filtro_antestabla
            [
              :etiqueta_caso,
            ]
          end

          def atributos_index
            r = [
              :caso_id,
              :fecha_caso_localizada,
              :ubicacion_caso,
              :nombre,
              :pconsolidado,
              :presponsables_caso,
              :presponsables_caso_ids,
            ]
            r
          end

          def self.index_reordenar(c)
            # c.reorder(['msip_persona.nombres', 'msip_persona.apellidos', :caso_id])
            c.reorder([:caso_id])
          end

          def index(c = nil)
            if c.nil?
              c = Sivel2Gen::Victima.joins(:persona).all.order(
                ["msip_persona.nombres", "msip_persona.apellidos", :caso_id],
              )
            end
            @titulo = "Listado de víctimas y casos"
            @pconsolidado = Sivel2Gen::Pconsolidado
              .where(fechadeshabilitacion: nil).order(:peso, :id).map do |r|
              [r.id, r.nombre, Sivel2Gen::Categoria
                .where(pconsolidado_id: r.id).map(&:id),]
            end
            super(c)
          end

          # Crea un nuevo registro para el caso que recibe por parametro
          # params[:caso_id].  Pone valores simples en los campos requeridos
          def nuevo
            if params[:caso_id]
              @persona = Msip::Persona.new
              @victima = Victima.new
              @persona.nombres = "N"
              @persona.apellidos = "N"
              @persona.sexo = Msip::Persona.convencion_sexo[:sexo_sininformacion]
              if Rails.configuration.x.msip_docid_obligatorio === true
                @persona.tdocumento_id = 11
                numale = 10000 + rand(10000)
                @persona.numerodocumento = numale.to_s + "X"
              end
              unless @persona.save
                respond_to do |format|
                  format.html { render(inline: "No pudo crear persona") }
                end
                return
              end
              if Rails.configuration.x.msip_docid_obligatorio === true
                @persona.numerodocumento = @persona.id
                @persona.save
              end
              @victima.caso_id = params[:caso_id]
              @victima.persona_id = @persona.id
              if @victima.save
                respond_to do |format|
                  format.js do
                    render(json: {
                      "victima" => @victima.id.to_s,
                      "persona" => @persona.id.to_s,
                    })
                  end
                  format.json do
                    render(
                      json: {
                        "victima" => @victima.id.to_s,
                        "persona" => @persona.id.to_s,
                      },
                      status: :created,
                    )
                  end
                  format.html do
                    render(json: {
                      "victima" => @victima.id.to_s,
                      "persona" => @persona.id.to_s,
                    })
                  end
                end
              else
                respond_to do |format|
                  format.html { render(action: "error") }
                  format.json do
                    render(
                      json: @victima.errors,
                      status: :unprocessable_entity,
                    )
                  end
                end
              end
            else
              respond_to do |format|
                format.html { render(inline: "Falta identificacion del caso") }
              end
            end
          end # nuevo

          def destroy
          end

          def create
          end

          def update
          end

          def set_victima
            @victima = Sivel2Gen::Victima.find(params[:id])
            @registro = @victima
          end

          def vistas_manejadas
            ["Victima"]
          end

          private

          def prepara_caso
            @caso = Sivel2Gen::Caso.new(victima: [Sivel2Gen::Victima.new])
          end
        end # included
      end
    end
  end
end
