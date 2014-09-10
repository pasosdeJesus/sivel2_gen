# encoding: UTF-8
require 'rails_helper'

RSpec.describe Rangoedadac, :type => :model do

  it "valido" do
		rangoedadac = FactoryGirl.build(:rangoedadac)
		expect(rangoedadac).to be_valid
		rangoedadac.destroy
	end

  it "no valido" do
		rangoedadac = FactoryGirl.build(:rangoedadac, nombre: '')
		expect(rangoedadac).not_to be_valid
		rangoedadac.destroy
	end

	it "existente" do
	  rangoedadac = Rangoedadac.where(id: 6).take
		expect(rangoedadac.nombre).to eq("De 61 en adelante")
	end

end

