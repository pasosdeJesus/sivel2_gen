# encoding: UTF-8
require 'rails_helper'

module Sip
	RSpec.describe Clase, :type => :model do
		it "valido" do
			clase = FactoryGirl.build(:sip_clase)
			expect(clase).to be_valid
			clase.destroy
		end

		it "no valido" do
			clase = FactoryGirl.build(:sip_clase, nombre: '')
			expect(clase).not_to be_valid
			clase.destroy
		end

		it "existente" do
			clase = Sip::Clase.where(id: 217).take
			expect(clase.nombre).to eq("CARACAS")
		end

	end
end
