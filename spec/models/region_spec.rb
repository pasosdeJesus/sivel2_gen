# encoding: UTF-8
require 'rails_helper'

RSpec.describe Region, :type => :model do

  it "valido" do
		region = FactoryGirl.build(:region)
		expect(region).to be_valid
		region.destroy
	end

  it "no valido" do
		region = FactoryGirl.build(:region, nombre: '')
		expect(region).not_to be_valid
		region.destroy
	end

	it "existente" do
		region = Region.where(id: 5).take
		expect(region.nombre).to eq("COSTA ATLANTICA")
	end

end

