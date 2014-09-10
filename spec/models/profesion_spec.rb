# encoding: UTF-8
require 'rails_helper'

RSpec.describe Profesion, :type => :model do

  it "valido" do
		profesion = FactoryGirl.build(:profesion)
		expect(profesion).to be_valid
		profesion.destroy
	end

  it "no valido" do
		profesion = FactoryGirl.build(:profesion, nombre: '')
		expect(profesion).not_to be_valid
		profesion.destroy
	end

	it "existente" do
		profesion = Profesion.where(id: 22).take
		expect(profesion.nombre).to eq("SIN INFORMACIÓN")
	end

end

