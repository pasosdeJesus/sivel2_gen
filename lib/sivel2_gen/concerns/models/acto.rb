
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
