# encoding: UTF-8
require 'rails_helper'

RSpec.describe Actividadarea, :type => :model do

  it "valido" do
		actividadarea = FactoryGirl.build(:actividadarea)
		expect(actividadarea).to be_valid
		actividadarea.destroy
	end

  it "no valido" do
		actividadarea = FactoryGirl.build(:actividadarea, nombre: '')
		expect(actividadarea).not_to be_valid
		actividadarea.destroy
	end

	it "existente" do
		actividadarea = Actividadarea.where(id: 1).take
	  expect(actividadarea.nombre).to eq("PSICOSOCIAL")
	end

end

