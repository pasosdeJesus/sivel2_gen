# encoding: UTF-8
module Sivel2Gen
  class PersonaTrelacion < ActiveRecord::Base
    belongs_to :persona, foreign_key: "persona1", validate: true, 
      class_name: 'Sivel2Gen::Persona'
    belongs_to :persona, foreign_key: "persona2", validate: true, 
      class_name: 'Sivel2Gen::Persona'
    belongs_to :trelacion, foreign_key: "id_trelacion", validate: true, 
      class_name: 'Sivel2Gen::Trelacion'

  end
end
