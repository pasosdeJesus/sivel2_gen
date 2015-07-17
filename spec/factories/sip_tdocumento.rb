# encoding: UTF-8

FactoryGirl.define do
  factory :sip_tdocumento, class: 'Sip::Tdocumento' do
		id 1000 # Buscamos que no intefiera con existentes
    nombre "Tdocumento"
    formatoregex "[0-9]*"
    fechacreacion "2014-09-22"
    created_at "2014-09-22"
  end
end
