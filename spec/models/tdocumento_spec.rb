# encoding: UTF-8
require 'rails_helper'

RSpec.describe Tdocumento, :type => :model do

  it "valido" do
		tdocumento = FactoryGirl.build(:tdocumento)
		expect(tdocumento).to be_valid
		tdocumento.destroy
	end

  it "no valido" do
		tdocumento = FactoryGirl.build(:tdocumento, nombre: '')
		expect(tdocumento).not_to be_valid
		tdocumento.destroy
	end

	it "existente" do
		tdocumento = Tdocumento.where(id: 7).take
		expect(tdocumento.nombre).to eq("OTRO")
	end

end

