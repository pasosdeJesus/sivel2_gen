# encoding: UTF-8
require 'rails_helper'

RSpec.describe Categoria, :type => :model do

  it "valido" do
		categoria = FactoryGirl.build(:categoria)
		expect(categoria).to be_valid
		categoria.destroy
	end

  it "no valido" do
		categoria = FactoryGirl.build(:categoria, nombre: '')
		expect(categoria).not_to be_valid
		categoria.destroy
	end

	it "existente" do
		categoria = Categoria.where(id: 10).take
		expect(categoria.nombre).to eq("EJECUCIÓN EXTRAJUDICIAL")
	end

end

