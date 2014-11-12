# encoding: UTF-8
module Sivel2Gen
  class Intervalo < ActiveRecord::Base
    include Basica

    has_many :caso, foreign_key: "id_intervalo", validate: true,
      class_name: 'Sivel2Gen::Caso'
  end
end
