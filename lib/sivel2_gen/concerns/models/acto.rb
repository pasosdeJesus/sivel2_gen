
module Sivel2Gen
  module Concerns
    module Models
      module Acto
        extend ActiveSupport::Concern
        included do

          include Msip::Modelo

          belongs_to :presponsable, class_name: 'Sivel2Gen::Presponsable',
            foreign_key: "presponsable_id", validate: true, optional: false
          accepts_nested_attributes_for :presponsable
          belongs_to :persona, class_name: 'Msip::Persona',
            foreign_key: "persona_id", validate: true, optional: false
          belongs_to :caso, class_name: 'Sivel2Gen::Caso', 
            foreign_key: "caso_id", validate: true, optional: false
          belongs_to :categoria, class_name: 'Sivel2Gen::Categoria',
            foreign_key: "categoria_id", validate: true, optional: false

          validates_presence_of :presponsable
          validates_presence_of :persona
          validates_presence_of :caso
          validates_presence_of :categoria

          validate :valida_categoria_presponsable
          def valida_categoria_presponsable
            consl= "WITH RECURSIVE cteRecursion AS (
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
              consl)
            descpe_ids = descendientes_poloe.to_a.map{|de| de["id"]} 
            tv = self.categoria.supracategoria.tviolencia_id
            pr = self.presponsable.id
            cat = self.categoria
            ce = cat.contadaen if cat
            if ce != nil
              actos_hermanos = actos.where.not(id: acto.id)
              vale = false
              actos_hermanos.each do |ah|
                if ah.persona == acto.persona && ah.presponsable == acto.presponsable && ah.categoria.id == ce
                  vale = true
                end
              end
              if !vale
                errors.add(:categoria_id, "Falta categoría #{ce} requerida por categoría #{cat.id}.")
              end
            end
            if tv == "A" && !descpe_ids.include?(pr) then
              errors.add(:acto, "Si el tipo de violencia es "\
                         "Derechos Humanos el presunto responsable debe "\
                         "ser del Polo Estatal")
            elsif tv == "B" && descpe_ids.include?(pr) then
              errors.add(:acto, "Si el tipo de violencia es "\
                         "Violencia Socio Política el presunto responsable "\
                         "no puede ser del Polo Estatal")
            end
          end


          def importa(datosent, datossal, menserror, opciones = {})
            victimas = datosent[0]
            d = datosent[1]
            if d['victima_individual_id']
              self.presponsable_id = d['presunto_responsable_individual_id'].to_i
              if Sivel2Gen::Presponsable.where(id: self.presponsable_id).count == 0
                menserror << "No pudo crear acto porque no existe presunto responsable #{self.presponsable_id}. "
                return
              end
              cate = d['agresion_particular'].split(" ")
              self.categoria_id = cate[-1].tr('()', '').to_i
              if Sivel2Gen::Categoria.where(id: self.categoria_id).count == 0
                menserror << "No pudo crear acto porque no existe categoria #{self.categoria_id}. "
                return
              end
              self.persona_id = victimas[d['victima_individual_id']]
              if self.save
                self.save!          
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
