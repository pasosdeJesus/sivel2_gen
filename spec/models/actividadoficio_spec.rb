# encoding: UTF-8
require 'rails_helper'

RSpec.describe Actividadoficio, :type => :model do

  it "valido" do
		actividadoficio = FactoryGirl.build(:actividadoficio)
		expect(actividadoficio).to be_valid
		actividadoficio.destroy
	end

  it "no valido" do
		actividadoficio = FactoryGirl.build(:actividadoficio, nombre: '')
		expect(actividadoficio).not_to be_valid
		actividadoficio.destroy
	end

	#it "existente" do
	#	actividadoficio = Actividadoficio.where(id: 1).take
	#	expect(actividadoficio.nombre).to eq("SIN INFORMACIÓN")
	#end

end

