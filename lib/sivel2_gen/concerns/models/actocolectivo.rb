# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Actocolectivo
        extend ActiveSupport::Concern

        included do

          belongs_to :presponsable, foreign_key: "id_presponsable", 
            validate: true, class_name: 'Sivel2Gen::Presponsable'
          belongs_to :grupoper, foreign_key: "id_grupoper", 
            validate: true, class_name: 'Sip::Grupoper'
          belongs_to :caso, foreign_key: "id_caso", validate: true, 
            class_name: 'Sivel2Gen::Caso'
          belongs_to :categoria, foreign_key: "id_categoria", 
            validate: true, class_name: 'Sivel2Gen::Categoria'

          def importa(datosent, datossal, menserror, opciones = {})
            victimascol = datosent[0]
            d = datosent[1]
            self.id_presponsable = d['id_presunto_grupo_responsable']
            cat = d['agresion'].split('_')
            self.id_categoria = cat[0]
            self.id_grupoper = victimascol[d['id_victima_colectiva']]
            self.save!          
          end
        end #included
      end
    end
  end
end
