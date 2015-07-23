# encoding: UTF-8

FactoryGirl.define do
  factory :sivel2_gen_supracategoria, class: 'Sivel2Gen::Supracategoria' do
		id 1000 # Buscamos que no intefiera con existentes
    id_tviolencia 'A'
    nombre "Supracategoria"
    fechacreacion "2014-09-09"
    created_at "2014-09-09"
  end
end
