# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sip_etiqueta, class: 'Sip::Etiqueta' do
		id 1000 # No intefiere con existentes
    nombre "Eti"
    observaciones "O"
    fechacreacion "2014-09-04"
    created_at "2014-09-04"
  end
end
