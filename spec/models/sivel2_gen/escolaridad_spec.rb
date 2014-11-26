# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Escolaridad, :type => :model do

    it "valido" do
      escolaridad = FactoryGirl.build(:sivel2_gen_escolaridad)
      expect(escolaridad).to be_valid
      escolaridad.destroy
    end

    it "no valido" do
      escolaridad = FactoryGirl.build(:sivel2_gen_escolaridad, nombre: '')
      expect(escolaridad).not_to be_valid
      escolaridad.destroy
    end

    it "existente" do
    	escolaridad = Sivel2Gen::Escolaridad.where(id: 0).take
      expect(escolaridad.nombre).to eq("SIN INFORMACIÓN")
    end

  end
end
