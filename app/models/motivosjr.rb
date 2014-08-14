# encoding: UTF-8
class Motivosjr < ActiveRecord::Base
  has_many :motivosjr_respuesta, foreign_key: "id_motivosjr", validate: true, dependent: :destroy
end
