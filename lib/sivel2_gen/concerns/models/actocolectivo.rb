# frozen_string_literal: true

module Sivel2Gen
  module Concerns
    module Models
      module Actocolectivo
        extend ActiveSupport::Concern

        included do
          include Msip::Modelo

          belongs_to :presponsable,
            validate: true,
            class_name: "Sivel2Gen::Presponsable",
            optional: false
          belongs_to :grupoper,
            validate: true,
            class_name: "Msip::Grupoper",
            optional: false
          belongs_to :caso,
            validate: true,
            class_name: "Sivel2Gen::Caso",
            optional: false
          belongs_to :categoria,
            validate: true,
            class_name: "Sivel2Gen::Categoria",
            optional: false

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
            cat = categoria
            ce = cat.contadaen if cat
            actoscolectivos = Sivel2Gen::Actocolectivo.all
            unless ce.nil?
              colectivos_hermanos = actoscolectivos.where.not(id: id)
              vale = false
              colectivos_hermanos.each do |ah|
                next unless ah.persona == grupoper &&
                  ah.presponsable == presponsable &&
                  ah.categoria.id == ce

                vale = true
              end
              unless vale
                errors.add(:categoria_id, "Falta categoría #{ce} requerida por categoría #{cat.id}.")
              end
            end
            if tv == "A" && !descpoloe_ids.include?(pr)
              errors.add(:actocolectivo, "Si el tipo de violencia es " \
                "Derechos Humanos el presunto responsable debe " \
                "ser del Polo Estatal")
            elsif tv == "B" && descpoloe_ids.include?(pr)
              errors.add(:actocolectivo, "Si el tipo de violencia es " \
                "Violencia Socio Política el presunto responsable " \
                "no puede ser del Polo Estatal")
            end
          end

          def importa(datosent, datossal, menserror, opciones = {})
            victimascol = datosent[0]
            d = datosent[1]
            if d["id_grupo_victima"]
              self.presponsable_id = d["id_presunto_grupo_responsable"]
              if Sivel2Gen::Presponsable.where(id: presponsable_id).count == 0
                menserror << "No pudo crear acto colectivo porque no existe presunto responsable #{presponsable_id}. "
                return
              end

              cate = d["agresion_particular"].split(" ")
              self.categoria_id = cate[-1].tr("()", "").to_i
              if Sivel2Gen::Categoria.where(id: categoria_id).count == 0
                menserror << "No pudo crear acto colectivo porque no existe categoria #{categoria_id}. "
                return
              end
              self.grupoper_id = victimascol[d["id_grupo_victima"]]
              if save
                save!
              else
                menserror << "No pudo crearse acto colectivo. "
              end
            end
          end
        end # included
      end
    end
  end
end
