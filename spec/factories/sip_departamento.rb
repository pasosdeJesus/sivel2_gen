# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sip_departamento, class: 'Sip::Departamento' do
		id 1000  # No interfiere
    nombre "Departamento1"
    latitud 1.5
    longitud 1.5
    fechacreacion "2014-08-04"
    fechadeshabilitacion nil
		id_pais	862 # Venezuela
  end
end
