
module Sivel2Gen
  module Concerns
    module Models
      module CasoPresponsable
        extend ActiveSupport::Concern

        included do

          include Msip::Modelo
          include Msip::Localizacion
          include Msip::FormatoFechaHelper

          belongs_to :caso, foreign_key: "caso_id", validate: true,
            class_name: 'Sivel2Gen::Caso', optional: false
          belongs_to :presponsable, foreign_key: "presponsable_id", 
            validate: true, class_name: 'Sivel2Gen::Presponsable', 
            optional: false
          accepts_nested_attributes_for :presponsable, :reject_if => :all_blank

          has_many :caso_categoria_presponsable, 
            foreign_key: :caso_presponsable_id,
            dependent: :destroy, validate: true,
            inverse_of: :caso_presponsable,
            class_name: 'Sivel2Gen::CasoCategoriaPresponsable'
          has_many :categoria, through: :caso_categoria_presponsable,
            class_name: 'Sivel2Gen::Categoria'

          validates :presponsable_id, presence: true
          validates :caso_id, presence: true


          def importa(datosent, datossal, menserror, opciones = {})
            pres = Sivel2Gen::Presponsable.
              where('upper(nombre COLLATE es_co_utf_8)=upper(? COLLATE es_co_utf_8)', datosent['nombre_grupo'])
            unless pres.empty?
              self.presponsable_id = pres.ids[0]
              def recorrer_observaciones(ele)
                case ele[0]
                when 'bloque'
                  self.bloque = ele[1]
                when 'frente'
                  self.frente = ele[1]
                when 'otro'
                  self.otro = ele[1]
                when "subdivision"
                  self.subdivision = ele[1]
                end
              end
              if datosent['observaciones']
                if datosent['observaciones'].kind_of?(Array)
                  datosent['observaciones'].each do |ob|
                    ele = ob.split(/\_([^_]*)$/)
                    recorrer_observaciones(ele)
                  end
                else
                  ele = datosent['observaciones'].split(/\_([^_]*)$/)
                  recorrer_observaciones(ele)
                end
              end
            end
          end
        end # included

      end
    end
  end
end
