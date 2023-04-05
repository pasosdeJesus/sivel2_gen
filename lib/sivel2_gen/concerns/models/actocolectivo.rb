
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

          def importa(datosent, datossal, menserror, opciones = {})
            victimascol = datosent[0]
            d = datosent[1]
            if d['grupo_victima_id']
              self.presponsable_id = d['presunto_grupo_responsable_id']
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
              self.grupoper_id = victimascol[d['grupo_victima_id']]
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
