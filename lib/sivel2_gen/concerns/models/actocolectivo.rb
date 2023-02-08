
module Sivel2Gen
  module Concerns
    module Models
      module Actocolectivo
        extend ActiveSupport::Concern

        included do

          include Sip::Modelo

          belongs_to :presponsable, foreign_key: "id_presponsable", 
            validate: true, class_name: 'Sivel2Gen::Presponsable', 
            optional: false
          belongs_to :grupoper, foreign_key: "id_grupoper", 
            validate: true, class_name: 'Sip::Grupoper', optional: false
          belongs_to :caso, foreign_key: "id_caso", validate: true, 
            class_name: 'Sivel2Gen::Caso', optional: false
          belongs_to :categoria, foreign_key: "id_categoria", 
            validate: true, class_name: 'Sivel2Gen::Categoria', 
            optional: false

          def importa(datosent, datossal, menserror, opciones = {})
            victimascol = datosent[0]
            d = datosent[1]
            if d['id_grupo_victima']
              self.id_presponsable = d['id_presunto_grupo_responsable']
              if Sivel2Gen::Presponsable.where(id: self.id_presponsable).count == 0
                menserror << "No pudo crear acto colectivo porque no existe presunto responsable #{self.id_presponsable}. "
                return
              end

              cate = d['agresion_particular'].split(" ")
              self.id_categoria = cate[-1].tr('()', '').to_i
              if Sivel2Gen::Categoria.where(id: self.id_categoria).count == 0
                menserror << "No pudo crear acto colectivo porque no existe categoria #{self.id_categoria}. "
                return
              end
              self.id_grupoper = victimascol[d['id_grupo_victima']]
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
