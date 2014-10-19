# encoding: UTF-8
class Intervalo < ActiveRecord::Base
  include Basica

	has_many :caso, foreign_key: "id_intervalo", validate: true
end
