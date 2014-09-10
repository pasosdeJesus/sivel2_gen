# encoding: UTF-8
require 'rails_helper'

RSpec.describe Rangoedad, :type => :model do

  it "valido" do
		rangoedad = FactoryGirl.build(:rangoedad)
		expect(rangoedad).to be_valid
		rangoedad.destroy
	end

  it "no valido" do
		rangoedad = FactoryGirl.build(:rangoedad, nombre: '')
		expect(rangoedad).not_to be_valid
		rangoedad.destroy
	end

	it "existente" do
		rangoedad = Rangoedad.where(id: 1).take
		expect(rangoedad.nombre).to eq("R1")
	end

end

