# encoding: UTF-8
module Sivel2Gen
  class Procesosjr < ActiveRecord::Base
    has_many :derecho_procesosjr, foreign_key: "id_proceso", validate: true, 
      dependent: :destroy, class_name: 'Sivel2Gen::DerechoProcesosjr'
    
    belongs_to :proceso, foreign_key: "id_proceso", validate: true, 
      class_name: 'Sivel2Gen::Proceso'
    belongs_to :motivoconsulta, foreign_key: "id_motivoconsulta", validate: true,
      class_name: 'Sivel2Gen::Motivoconsulta'
    belongs_to :mecanismoder, foreign_key: "id_mecanismoder", validate: true, 
      class_name: 'Sivel2Gen::Mecanismoder'
    belongs_to :instanciader, foreign_key: "id_instanciader", validate: true, 
      class_name: 'Sivel2Gen::Instanciader'
    belongs_to :otromecanismo, foreign_key: "otromecanismo", validate: true, 
      class_name: 'Sivel2Gen::Mecanismoder'
    belongs_to :otrainstancia, foreign_key: "otrainstancia", validate: true, 
      class_name: 'Sivel2Gen::Instanciader'
  end
end
