# encoding: UTF-8
class EmprendimientoRespuesta < ActiveRecord::Base
  belongs_to :emprendimiento, foreign_key: "id_emprendimiento", validate: true
  belongs_to :respuesta, foreign_key: "id_respuesta", validate: true
end

