# encoding: UTF-8
module Sivel2Gen
  module Concerns
    module Models
      module Persona
        extend ActiveSupport::Concern
        included do
          has_many :acto, foreign_key: "id_persona", validate: true,
            class_name: "Sivel2Gen::Acto"
          has_many :antecedente_victima, foreign_key: "id_persona", 
            validate: true, class_name: "Sivel2Gen::AntecedenteVictima"
          has_many :persona_trelacion1, foreign_key: "persona1", validate: true,
            class_name: "Sivel2Gen::PersonaTrelacion"
          has_many :persona_trelacion2, foreign_key: "persona2", validate: true,
            class_name: "Sivel2Gen::PersonaTrelacion"
          has_many :victima, foreign_key: "id_persona", validate: true,
            class_name: "Sivel2Gen::Victima"
          has_many :casos, :through => :victimas
          belongs_to :clase, foreign_key: "id_clase", validate: true
          belongs_to :nacional, class_name: "Sivel2Gen::Pais", 
            foreign_key: "nacionalde", validate: true
          belongs_to :departamento, foreign_key: "id_departamento", validate: true, 
            class_name: "Sivel2Gen::Departamento"
          belongs_to :municipio, foreign_key: "id_municipio", validate: true,
            class_name: "Sivel2Gen::Municipio"
          belongs_to :pais, class_name: "Sivel2Gen::Pais", foreign_key: "id_pais", 
            validate: true
          belongs_to :tdocumento, class_name: "Sivel2Gen::Tdocumento", 
            foreign_key: "tdocumento_id", validate: true

          # identificación autogenerada en este y demás modelos (excepto los de
          # información geográfica).
          validates :nombres, presence: true, allow_blank: false
          validates :apellidos, presence: true, allow_blank: false
          validates :sexo, presence: true
          validates :anionac, :numericality => {:allow_blank => true}
          validates :mesnac, :numericality => {:allow_blank => true}
          validates :dianac, :numericality => {:allow_blank => true}
          validate :vfechanac
          validate :vformatonumdoc
        end

        def vformatonumdoc
          if (tdocumento && tdocumento.formatoregex != '' && 
              !(numerodocumento =~ Regexp.new("^#{tdocumento.formatoregex}$")))
            errors.add(:numerodocumento, 
                       "No cumple exp. regular: #{tdocumento.formatoregex}")
          end
        end

        def vfechanac
          if (anionac && anionac<1900)
            errors.add(:anionac, "Año debe ser mayor o igual a 1900")
          end
          if (mesnac && (mesnac < 1 || mesnac > 12))
            errors.add(:mesnac, "Mes debe estar entre 1 y 12")
          end
          if (dianac && dianac < 1)
            errors.add(:dianac, "Dia debe ser positivo")
          end
          if (dianac && mesnac && mesnac == 2 && dianac > 29)
            errors.add(:dianac, "Dia debe ser menor o igual a 29")
          elsif (dianac && mesnac && (mesnac == 4 || mesnac == 6 || 
                                       mesnac == 9 || mesnac == 11) && 
                                       dianac > 30)
            errors.add(:dianac, "Dia debe ser menor o igual a 30")
          elsif (dianac && dianac > 31)
            errors.add(:dianac, "Dia debe ser menor o igual a 31")
          end
        end

      end
    end
  end
end

