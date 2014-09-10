# encoding: UTF-8
require 'rails_helper'

RSpec.describe Tviolencia, :type => :model do

  it "valido" do
		tviolencia = FactoryGirl.build(:tviolencia)
		expect(tviolencia).to be_valid
		tviolencia.destroy
	end

  it "no valido" do
		tviolencia = FactoryGirl.build(:tviolencia, nombre: '')
		expect(tviolencia).not_to be_valid
		tviolencia.destroy
	end

	it "existente" do
		tviolencia = Tviolencia.where(id: 'A').take
		expect(tviolencia.nombre).to eq("VIOLACIONES A LOS DERECHOS HUMANOS")
	end

end

