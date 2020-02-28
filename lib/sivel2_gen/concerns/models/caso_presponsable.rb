# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module CasoPresponsable
        extend ActiveSupport::Concern

        included do

          include Sip::Localizacion
          include Sip::FormatoFechaHelper

          belongs_to :caso, foreign_key: "id_caso", validate: true,
            class_name: 'Sivel2Gen::Caso'
          belongs_to :presponsable, foreign_key: "id_presponsable", validate: true, 
            class_name: 'Sivel2Gen::Presponsable'
          accepts_nested_attributes_for :presponsable, :reject_if => :all_blank

          has_many :caso_categoria_presponsable, foreign_key: :id_caso_presponsable,
            dependent: :destroy, validate: true
          has_many :categoria, through: :caso_categoria_presponsable,
            class_name: 'Sivel2Gen::Categoria'

          validates :id_presponsable, presence: true
          validates :id_caso, presence: true


          def importa(datosent, datossal, menserror, opciones = {})
            datosent['grupo'].each do |g|
              pres = Sivel2Gen::Presponsable.where(nombre: g['nombre_grupo'])
              self.id_presponsable = pres.ids[0] if pres
            end
          end
        end # included

      end
    end
  end
end
