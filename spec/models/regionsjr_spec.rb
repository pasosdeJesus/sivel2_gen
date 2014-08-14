# encoding: UTF-8
require 'rails_helper'

RSpec.describe Regionsjr, :type => :model do
  it "valido" do
		regionsjr = FactoryGirl.build(:regionsjr)
		expect(regionsjr).to be_valid
		regionsjr.destroy
	end

  it "no valido" do
		regionsjr = FactoryGirl.build(:regionsjr, nombre: '')
		expect(regionsjr).not_to be_valid
		regionsjr.destroy
	end

	it "existente" do
		regionsjr = Regionsjr.where(id: 1).take
		expect(regionsjr.nombre).to eq("SIN INFORMACIÓN")
		regionsjr = Regionsjr.where(id: 100).take
		expect(regionsjr.id).to eq(100)
	end
end
