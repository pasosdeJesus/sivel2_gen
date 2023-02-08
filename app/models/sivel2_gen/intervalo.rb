module Sivel2Gen
  class Intervalo < ActiveRecord::Base
    include Msip::Basica

    has_many :caso, foreign_key: "id_intervalo", validate: true,
      class_name: 'Sivel2Gen::Caso'

    validates_presence_of :rango
  end
end
