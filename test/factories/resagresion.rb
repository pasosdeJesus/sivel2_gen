# encoding: UTF-8

FactoryGirl.define do
  factory :resagresion, class: 'Resagresion' do
    id 1000 # Buscamos que no interfiera con existentes
    nombre "Resagresion"
    fechacreacion "2016-07-19"
    created_at "2016-07-19"
  end
end
