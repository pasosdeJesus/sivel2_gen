# encoding: UTF-8

FactoryGirl.define do
  factory :sivel2_gen_categoria, :class => 'Sivel2Gen::Categoria' do
		id 1000 # Buscamos que no intefiera con existentes
    nombre "Categoria"
    supracategoria_id 1
    fechacreacion "2014-09-09"
    created_at "2014-09-09"
  end
end
