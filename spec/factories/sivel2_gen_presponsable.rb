# encoding: UTF-8

FactoryGirl.define do
  factory :sivel2_gen_presponsable, class: 'Sivel2Gen::Presponsable' do
		id 1000 # Buscamos que no intefiera con existentes
    nombre "Presponsable"
    fechacreacion "2014-09-09"
    created_at "2014-09-09"
  end
end
