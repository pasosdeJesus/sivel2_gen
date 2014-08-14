# encoding: UTF-8
class DerechoProcesosjr < ActiveRecord::Base
	belongs_to :procesosjr, foreign_key: "id_proceso", validate: true
	belongs_to :derecho, foreign_key: "id_derecho", validate: true
end
