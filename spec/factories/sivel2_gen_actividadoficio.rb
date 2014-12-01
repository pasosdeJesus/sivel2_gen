# encoding: UTF-8

FactoryGirl.define do
  factory :sivel2_gen_actividadoficio, :class => 'Sivel2Gen::Actividadoficio' do
		id 1000 # Buscamos que no intefiera con existentes
    nombre "Actividadoficio"
    fechacreacion "2014-09-09"
    created_at "2014-09-09"
  end
end
