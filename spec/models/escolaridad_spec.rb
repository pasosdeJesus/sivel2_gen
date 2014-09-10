# encoding: UTF-8
require 'rails_helper'

RSpec.describe Escolaridad, :type => :model do

  it "valido" do
		escolaridad = FactoryGirl.build(:escolaridad)
		expect(escolaridad).to be_valid
		escolaridad.destroy
	end

  it "no valido" do
		escolaridad = FactoryGirl.build(:escolaridad, nombre: '')
		expect(escolaridad).not_to be_valid
		escolaridad.destroy
	end

	#it "existente" do
	#	escolaridad = Escolaridad.where(id: 1).take
	#	expect(escolaridad.nombre).to eq("SIN INFORMACIÓN")
	#end

end

