# encoding: UTF-8

FactoryGirl.define do
  factory :sivel2_gen_etnia, class: 'Sivel2Gen::Etnia' do
		id 1000 # Buscamos que no interfiera con existentes
    nombre "Etnia"
    fechacreacion "2014-09-09"
    created_at "2014-09-09"
  end
end
