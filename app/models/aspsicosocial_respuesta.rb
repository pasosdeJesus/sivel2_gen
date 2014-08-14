# encoding: UTF-8
class AspsicosocialRespuesta < ActiveRecord::Base
  belongs_to :aspsicosocial, foreign_key: "id_aspsicosocial", validate: true
  belongs_to :respuesta, foreign_key: "id_respuesta", validate: true
end
