module Sivel2Gen
  class Frontera < ActiveRecord::Base
    include Msip::Basica

    has_many :caso_frontera, foreign_key: "frontera_id", validate: true, 
      dependent: :delete_all, class_name: 'Sivel2Gen::CasoFrontera'
    has_many :caso, through: :caso_frontera, class_name: 'Sivel2Gen::Caso'
  end
end
