# encoding: UTF-8
class CasoRegion < ActiveRecord::Base
	belongs_to :region, foreign_key: "id_region", validate: true
	belongs_to :caso, foreign_key: "id_caso", validate: true
end
