# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :persona do
    nombres "Nombres"
    apellidos "Apellidos"
    anionac 1974
    mesnac 1
    dianac 1
    sexo "F"
    id_departamento 1
    id_municipio 1
    id_clase 1
    tdocumento_id 1
    numerodocumento "10000000"
    id_pais 1
    nacionalde 1
  end
end
