# encoding: UTF-8

FactoryGirl.define do
  factory :sivel2_gen_tdocumento, class: 'Sivel2Gen::Tdocumento' do
		id 1000 # Buscamos que no intefiera con existentes
    nombre "Tdocumento"
    formatoregex "[0-9]*"
    fechacreacion "2014-09-22"
    created_at "2014-09-22"
  end
end
