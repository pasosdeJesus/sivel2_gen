# encoding: UTF-8
require 'rails_helper'

RSpec.describe Iglesia, :type => :model do

  it "valido" do
		iglesia = FactoryGirl.build(:iglesia)
		expect(iglesia).to be_valid
		iglesia.destroy
	end

  it "no valido" do
		iglesia = FactoryGirl.build(:iglesia, nombre: '')
		expect(iglesia).not_to be_valid
		iglesia.destroy
	end

	it "existente" do
		iglesia = Iglesia.where(id: 1).take
		expect(iglesia.nombre).to eq("SIN INFORMACIÓN")
	end

end

