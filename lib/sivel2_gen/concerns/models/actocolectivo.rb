
module Sivel2Gen
  module Concerns
    module Models
      module Actocolectivo
        extend ActiveSupport::Concern

        included do

          include Msip::Modelo

          belongs_to :presponsable, foreign_key: "presponsable_id", 
            validate: true, class_name: 'Sivel2Gen::Presponsable', 
            optional: false
          belongs_to :grupoper, foreign_key: "grupoper_id", 
            validate: true, class_name: 'Msip::Grupoper', optional: false
          belongs_to :caso, foreign_key: "caso_id", validate: true, 
            class_name: 'Sivel2Gen::Caso', optional: false
          belongs_to :categoria, foreign_key: "categoria_id", 
            validate: true, class_name: 'Sivel2Gen::Categoria', 
            optional: false

          validate :valida_categoria_presponsable
          def valida_categoria_presponsable
            consl= "WITH RECURSIVE cteRecursion AS (
               SELECT id, 1 AS Level
                   FROM public.sivel2_gen_presponsable
                   WHERE id = 42
               UNION ALL
               SELECT t.id, c.Level+1
                   FROM public.sivel2_gen_presponsable t
                       INNER JOIN cteRecursion c
                           ON t.papa_id = c.id
                       )
               SELECT id, Level
                   FROM cteRecursion
                   ORDER BY Level, id;"
            descendientes_psei = ActiveRecord::Base.connection.select_all(
              consl)
            descpsei_ids = descendientes_psei.to_a.map{|de| de["id"]} 
            tv = self.categoria.supracategoria.tviolencia_id
            pr = self.presponsable.id
            cat = self.categoria
            ce = cat.contadaen if cat
            actoscolectivos = Sivel2Gen::Actocolectivo.all
            if ce != nil
              colectivos_hermanos = actoscolectivos.where.not(id: self.id)
              vale = false
              colectivos_hermanos.each do |ah|
                if ah.persona == self.grupoper &&
                    ah.presponsable == self.presponsable &&
                    ah.categoria.id == ce
                  vale = true
                end
              end
              if !vale
                errors.add(:categoria_id, "Falta categoría #{ce} requerida por categoría #{cat.id}.")
              end
            end
            if tv == "A" && !descpsei_ids.include?(pr) then
              errors.add(:actocolectivo, "Si el tipo de violencia es "\
                         "Derechos Humanos el presunto responsable debe "\
                         "ser del PSEI")
            elsif tv == "B" && descpsei_ids.include?(pr) then
              errors.add(:actocolectivo, "Si el tipo de violencia es "\
                         "Violencia Socio Política el presunto responsable "\
                         "no puede ser del PSEI")
            end
          end

          def importa(datosent, datossal, menserror, opciones = {})
            victimascol = datosent[0]
            d = datosent[1]
            if d['id_grupo_victima']
              self.presponsable_id = d['id_presunto_grupo_responsable']
              if Sivel2Gen::Presponsable.where(id: self.presponsable_id).count == 0
                menserror << "No pudo crear acto colectivo porque no existe presunto responsable #{self.presponsable_id}. "
                return
              end

              cate = d['agresion_particular'].split(" ")
              self.categoria_id = cate[-1].tr('()', '').to_i
              if Sivel2Gen::Categoria.where(id: self.categoria_id).count == 0
                menserror << "No pudo crear acto colectivo porque no existe categoria #{self.categoria_id}. "
                return
              end
              self.grupoper_id = victimascol[d['id_grupo_victima']]
              if self.save
                self.save!
              else
                menserror << "No pudo crearse acto colectivo. "
              end
            end 
          end
        end #included
      end
    end
  end
end
