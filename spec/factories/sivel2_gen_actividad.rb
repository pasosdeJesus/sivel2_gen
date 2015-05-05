# encoding: UTF-8

FactoryGirl.define do
  factory :sivel2_gen_actividad, class: 'Sivel2Gen::Actividad' do
    minutos "45"
    nombre "nombreact"
    oficina_id "1"
    fecha "2014-11-11"
    created_at "2014-11-11"
  end
end
