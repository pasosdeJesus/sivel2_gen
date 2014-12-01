# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sivel2_gen_clase, class: 'Sivel2Gen::Clase' do
		id 1000 # No intefiere con existentes
    nombre "Clase1"
    latitud 1.5
    longitud 1.5
    fechacreacion "2014-08-04"
    fechadeshabilitacion "2014-08-04"
    id_pais 862 # Venezuela
		id_departamento 1 # Distrito Capital
		id_municipio 1 # Bolivariano Libertador
  end
end
