# encoding: UTF-8
require 'rails_helper'

RSpec.describe Frontera, :type => :model do

  it "valido" do
		frontera = FactoryGirl.build(:frontera)
		expect(frontera).to be_valid
		frontera.destroy
	end

  it "no valido" do
		frontera = FactoryGirl.build(:frontera, nombre: '')
		expect(frontera).not_to be_valid
		frontera.destroy
	end

	it "existente" do
		frontera = Frontera.where(id: 1).take
		expect(frontera.nombre).to eq("Ecuador")
	end

end

