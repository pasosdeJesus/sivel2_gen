# encoding: UTF-8
module Sivel2Gen
  class Persona < ActiveRecord::Base
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

    validate :vformatonumdoc
    def vformatonumdoc
      if (tdocumento && tdocumento.formatoregex != '' && 
          !(numerodocumento =~ Regexp.new("^" + 
                                          tdocumento.formatoregex + 
                                          "$")))
        errors.add(:numerodocumento, "No cumple expresion regular: " +
                   tdocumento.formatoregex)
      end
    end
  end
end
