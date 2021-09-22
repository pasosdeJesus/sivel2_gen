
module Sivel2Gen
  module Concerns
    module Models
      module Categoria
        extend ActiveSupport::Concern

        include Sip::Basica
        included do
          Nombresunicos=false

          belongs_to :contada, foreign_key: "contadaen", 
            class_name: 'Sivel2Gen::Categoria', optional: true
          belongs_to :pconsolidado, foreign_key: "id_pconsolidado", 
            class_name: 'Sivel2Gen::Pconsolidado', optional: true
          belongs_to :supracategoria, foreign_key: "supracategoria_id", 
             class_name: 'Sivel2Gen::Supracategoria', validate: true


          has_many :acto, foreign_key: "id_categoria", validate: true,
            class_name: 'Sivel2Gen::Acto'

          has_many :caso_categoria_presponsable, foreign_key: 'id_categoria',
            validate: true, class_name: 'Sivel2Gen::CasoCategoriaPresponsable'
          has_many :caso_presponsable, through: :caso_categoria_presponsable,
            class_name: 'Sivel2Gen::CasoPresponsable'

          validates :supracategoria, presence: true
          validates :id, presence:true, uniqueness: true
          validates :tipocat, length: { maximum: 1 }

          def presenta_nombre
            if !self.supracategoria_id
              return ""
            end
            sup = Sivel2Gen::Supracategoria.find(self.supracategoria_id)
            self.nombre + " (" + sup.nombre + " / " + 
              Sivel2Gen::Tviolencia.find(sup.id_tviolencia).nombre + ")"
          end

          def presenta_con_codigo
            if !supracategoria_id
              return nombre
            end
            supracategoria.id_tviolencia + 
              id.to_s + ' ' +nombre
          end

          def presenta(atr)
            #clf = clase_llave_foranea(atr)
            if (atr.to_s == "tipocat")
              h={C: "Colectivo", I: "Individual", O: "Otro"}
              return h[self[atr.to_s].to_sym]
            else
              presenta_gen(atr)
            end
          end
        end

      end
    end
  end
end
