# encoding: UTF-8
class AslegalRespuesta < ActiveRecord::Base
  belongs_to :aslegal, foreign_key: "id_aslegal", validate: true
  belongs_to :respuesta, foreign_key: "id_respuesta", validate: true
end
