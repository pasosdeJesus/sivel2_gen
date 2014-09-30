# encoding: UTF-8
class Pconsolidado < ActiveRecord::Base
  extend Basica

	has_many :categoria, foreign_key: "id_pconsolidado", validate: true
end
