# encoding: UTF-8

FactoryGirl.define do
  factory :sivel2_gen_maternidad, class: 'Sivel2Gen::Maternidad' do
		id 1000 # Buscamos que no intefiera con existentes
    nombre "Maternidad"
    fechacreacion "2014-09-11"
    created_at "2014-09-11"
  end
end
