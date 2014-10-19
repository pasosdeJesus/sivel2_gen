# encoding: UTF-8
class Pconsolidado < ActiveRecord::Base
  include Basica

	has_many :categoria, foreign_key: "id_pconsolidado", validate: true
end
