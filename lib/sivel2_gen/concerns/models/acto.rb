# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Acto
        extend ActiveSupport::Concern
        included do
          include Msip::Modelo

          belongs_to :presponsable,
            class_name: "Sivel2Gen::Presponsable",
            optional: false,
            validate: true
          accepts_nested_attributes_for :presponsable

          belongs_to :persona,
            class_name: "Msip::Persona",
            optional: false,
            validate: true

          belongs_to :caso,
            class_name: "Sivel2Gen::Caso",
            optional: false,
            validate: true

          belongs_to :categoria,
            class_name: "Sivel2Gen::Categoria",
            optional: false,
            validate: true

          validates_presence_of :presponsable
          validates_presence_of :persona
          validates_presence_of :caso
          validates_presence_of :categoria

          validate :valida_categoria_presponsable
          def valida_categoria_presponsable
            consl = "WITH RECURSIVE cteRecursion AS (
               SELECT id, 1 AS Level
                   FROM public.sivel2_gen_presponsable
                   WHERE id = 39
               UNION ALL
               SELECT t.id, c.Level+1
                   FROM public.sivel2_gen_presponsable t
                       INNER JOIN cteRecursion c
                           ON t.papa_id = c.id
                       )
               SELECT id, Level
                   FROM cteRecursion
                   ORDER BY Level, id;"
            descendientes_poloe = ActiveRecord::Base.connection.select_all(
              consl,
            )
            descpoloe_ids = descendientes_poloe.to_a.map { |de| de["id"] }
            tv = categoria.supracategoria.tviolencia_id
            pr = presponsable.id
            if tv == "A" && !descpoloe_ids.include?(pr)
              errors.add(:acto, "Si el tipo de violencia es " \
                "Derechos Humanos el presunto responsable debe " \
                "ser del Polo Estatal")
            elsif tv == "B" && descpoloe_ids.include?(pr)
              errors.add(:acto, "Si el tipo de violencia es " \
                "Violencia Socio Política el presunto responsable " \
                "no puede ser del Polo Estatal")
            end
          end

          def importa(datosent, datossal, menserror, opciones = {})
            victimas = datosent[0]
            d = datosent[1]
            if d["id_victima_individual"]
              self.presponsable_id = d["id_presunto_responsable_individual"].to_i
              if Sivel2Gen::Presponsable.where(id: presponsable_id).count == 0
                menserror << "No pudo crear acto porque no existe presunto responsable #{presponsable_id}. "
                return
              end
              cate = d["agresion_particular"].split(" ")
              self.categoria_id = cate[-1].tr("()", "").to_i
              if Sivel2Gen::Categoria.where(id: categoria_id).count == 0
                menserror << "No pudo crear acto porque no existe categoria #{categoria_id}. "
                return
              end
              self.persona_id = victimas[d["id_victima_individual"]]
              if save
                save!
              else
                menserror << "No pudo crearse acto. "
              end
            end
          end
        end
      end
    end
  end
end
