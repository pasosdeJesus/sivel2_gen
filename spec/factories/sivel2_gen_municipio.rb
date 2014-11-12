# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sivel2_gen_municipio, class: 'Sivel2Gen::Municipio' do
		id 1000
    nombre "Municipio1"
    latitud 1.5
    longitud 1.5
    fechacreacion "2014-08-04"
    fechadeshabilitacion "2014-08-04"
    id_pais 862 # Venezuela
		id_departamento 1 # Distrito Capital
  end
end
