
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

          has_many :caso_categoria_presponsable, 
            foreign_key: :id_caso_presponsable,
            dependent: :destroy, validate: true
          has_many :categoria, through: :caso_categoria_presponsable,
            class_name: 'Sivel2Gen::Categoria'

          validates :id_presponsable, presence: true
          validates :id_caso, presence: true


          def importa(datosent, datossal, menserror, opciones = {})
            pres = Sivel2Gen::Presponsable.
              where(nombre: datosent['nombre_grupo'])
            unless pres.empty?
              self.id_presponsable = pres.ids[0]
              def recorrer_observaciones(ele)
                case ele[0]
                when 'bloque'
                  self.bloque = ele[1]
                when 'frente'
                  self.frente = ele[1]
                when 'brigada'
                  self.brigada = ele[1]
                when 'batallon'
                  self.batallon = ele[1]
                when 'division'
                  self.division = ele[1]
                when 'otro'
                  self.otro = ele[1]
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
