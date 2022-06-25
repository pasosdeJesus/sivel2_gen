module Sivel2Gen
  class CasoSolicitud < ActiveRecord::Base
    include Sip::Modelo 

    belongs_to :caso, 
      class_name: 'Sivel2Gen::Caso',
      validate: true, foreign_key: 'caso_id', optional: false
    belongs_to :solicitud, class_name: 'Sip::Solicitud', validate: true,
      foreign_key: 'solicitud_id', optional: false
    accepts_nested_attributes_for :solicitud, reject_if: :all_blank

  end
end
