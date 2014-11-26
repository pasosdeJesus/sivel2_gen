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
          belongs_to :persona, class_name: 'Sivel2Gen::Persona',
            foreign_key: "id_persona", validate: true
          belongs_to :caso, class_name: 'Sivel2Gen::Caso', 
            foreign_key: "id_caso", validate: true
          belongs_to :categoria, class_name: 'Sivel2Gen::Categoria',
            foreign_key: "id_categoria", validate: true

          validates_presence_of :presponsable
          validates_presence_of :persona
          validates_presence_of :caso
          validates_presence_of :categoria
        end
      end
    end
  end
end
