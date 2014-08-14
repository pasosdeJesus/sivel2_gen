# encoding: UTF-8
class Inclusion < ActiveRecord::Base
	has_many :desplazamiento, foreign_key: "id_inclusion", validate: true
end
