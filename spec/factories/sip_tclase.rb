# encoding: UTF-8

FactoryGirl.define do
  factory :sip_tclase, class: 'Sip::Tclase' do
		id 'x' # Buscamos que no intefiera con existentes
    nombre "TX"
    fechacreacion "2014-09-09"
    created_at "2014-09-09"
  end
end
