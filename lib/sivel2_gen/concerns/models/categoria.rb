# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Categoria
        extend ActiveSupport::Concern

        include Msip::Basica
        included do
          Nombresunicos = false

          belongs_to :contada,
            foreign_key: "contadaen",
            class_name: "Sivel2Gen::Categoria",
            optional: true
          belongs_to :pconsolidado,
            class_name: "Sivel2Gen::Pconsolidado",
            optional: true
          belongs_to :supracategoria,
            class_name: "Sivel2Gen::Supracategoria",
            validate: true,
            optional: false

          has_many :acto,
            foreign_key: "categoria_id",
            validate: true,
            class_name: "Sivel2Gen::Acto"

          has_many :caso_categoria_presponsable,
            foreign_key: "categoria_id",
            validate: true,
            class_name: "Sivel2Gen::CasoCategoriaPresponsable",
            inverse_of: :categoria
          has_many :caso_presponsable,
            through: :caso_categoria_presponsable,
            class_name: "Sivel2Gen::CasoPresponsable"

          validates :supracategoria, presence: true
          validates :id, presence: true, uniqueness: true
          validates :tipocat, length: { maximum: 1 }

          def presenta_nombre
            unless supracategoria_id
              return ""
            end

            sup = Sivel2Gen::Supracategoria.find(supracategoria_id)
            nombre + " (" + sup.nombre + " / " +
              Sivel2Gen::Tviolencia.find(sup.tviolencia_id).nombre + ")"
          end

          def presenta_con_codigo
            unless supracategoria_id
              return nombre
            end

            supracategoria.tviolencia_id +
              id.to_s + " " + nombre
          end

          def presenta(atr)
            # clf = clase_llave_foranea(atr)
            if atr.to_s == "tipocat"
              h = { C: "Colectivo", I: "Individual", O: "Otro" }
              h[self[atr.to_s].to_sym]
            else
              presenta_gen(atr)
            end
          end
        end
      end
    end
  end
end
