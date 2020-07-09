# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Acto
        extend ActiveSupport::Concern
        included do
          belongs_to :presponsable, class_name: 'Sivel2Gen::Presponsable',
            foreign_key: "id_presponsable", validate: true 
          accepts_nested_attributes_for :presponsable
          belongs_to :persona, class_name: 'Sip::Persona',
            foreign_key: "id_persona", validate: true
          belongs_to :caso, class_name: 'Sivel2Gen::Caso', 
            foreign_key: "id_caso", validate: true
          belongs_to :categoria, class_name: 'Sivel2Gen::Categoria',
            foreign_key: "id_categoria", validate: true

          validates_presence_of :presponsable
          validates_presence_of :persona
          validates_presence_of :caso
          validates_presence_of :categoria

          def importa(datosent, datossal, menserror, opciones = {})
            victimas = datosent[0]
            d = datosent[1]
            if d['id_victima_individual']
              self.id_presponsable = d['id_presunto_responsable_individual'].to_i
              cate = d['agresion_particular'].split(" ")
              self.id_categoria = cate[-1].tr('()', '').to_i
              self.id_persona = victimas[d['id_victima_individual']]
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
