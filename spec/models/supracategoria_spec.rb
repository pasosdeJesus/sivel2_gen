# encoding: UTF-8
require 'rails_helper'

RSpec.describe Supracategoria, :type => :model do

  it "valido" do
		supracategoria = FactoryGirl.build(:supracategoria)
		expect(supracategoria).to be_valid
		supracategoria.destroy
	end

  it "no valido" do
		supracategoria = FactoryGirl.build(:supracategoria, nombre: '')
		expect(supracategoria).not_to be_valid
		supracategoria.destroy
	end

	it "existente" do
		supracategoria = Supracategoria.where(id: 1).take
		expect(supracategoria.nombre).to eq("PERSECUCIÓN POLÍTICA")
	end

end

