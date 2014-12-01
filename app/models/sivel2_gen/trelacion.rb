# encoding: UTF-8
module Sivel2Gen
  class Trelacion < ActiveRecord::Base
    has_many :persona_trelacion, foreign_key: "id_trelacion", validate: true, 
      class_name: 'Sivel2Gen::PersonaTrelacion'
  end
end
