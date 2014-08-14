# encoding: UTF-8
require 'rails_helper'

RSpec.describe Clase, :type => :model do
  it "valido" do
		clase = FactoryGirl.build(:clase)
		expect(clase).to be_valid
		clase.destroy
	end

  it "no valido" do
		clase = FactoryGirl.build(:clase, nombre: '')
		expect(clase).not_to be_valid
		clase.destroy
	end

	it "existente" do
		clase = Clase.where(id_pais: 862, id_departamento:1, id_municipio:1, id: 0).take
		expect(clase.nombre).to eq("CARACAS")
	end

end
