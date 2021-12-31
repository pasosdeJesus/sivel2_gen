class Sivel2Gen::CasoRespuestafor < ActiveRecord::Base

  belongs_to :respuestafor, class_name: 'Mr519Gen::Respuestafor', 
    foreign_key: 'respuestafor_id', optional: false
  accepts_nested_attributes_for :respuestafor,
    reject_if: :all_blank

  belongs_to :caso, 
    class_name: 'Sivel2Gen::Caso',
    foreign_key: 'caso_id', optional: false

end
