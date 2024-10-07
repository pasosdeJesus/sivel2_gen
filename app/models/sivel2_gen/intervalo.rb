module Sivel2Gen
  # Tabla básica Intervalo
  class Intervalo < ActiveRecord::Base
    include Msip::Basica

    has_many :caso, foreign_key: "intervalo_id", validate: true,
      class_name: 'Sivel2Gen::Caso'

    validates_presence_of :rango
  end
end
