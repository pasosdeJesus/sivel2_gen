# encoding: UTF-8

FactoryGirl.define do
  factory :sivel2_gen_estadocivil, class: 'Sivel2Gen::Estadocivil' do
		id 1000 # Buscamos que no intefiera con existentes
    nombre "Estadocivil"
    fechacreacion "2014-09-11"
    created_at "2014-09-11"
  end
end
