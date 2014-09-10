# encoding: UTF-8
require 'rails_helper'

RSpec.describe Tclase, :type => :model do

  it "valido" do
		tclase = FactoryGirl.build(:tclase)
		expect(tclase).to be_valid
		tclase.destroy
	end

  it "no valido" do
		tclase = FactoryGirl.build(:tclase, nombre: '')
		expect(tclase).not_to be_valid
		tclase.destroy
	end

	it "existente" do
		tclase = Tclase.where(id: 'C').take
		expect(tclase.nombre).to eq("CORREGIMIENTO")
	end

end

