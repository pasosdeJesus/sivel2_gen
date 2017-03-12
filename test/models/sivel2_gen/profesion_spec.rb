# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Profesion, :type => :model do

    it "valido" do
      profesion = FactoryGirl.build(:sivel2_gen_profesion)
      expect(profesion).to be_valid
      profesion.destroy
    end

    it "no valido" do
      profesion = FactoryGirl.build(:sivel2_gen_profesion, nombre: '')
      expect(profesion).not_to be_valid
      profesion.destroy
    end

    it "existente" do
      profesion = Sivel2Gen::Profesion.where(id: 22).take
      expect(profesion.nombre).to eq("SIN INFORMACIÓN")
    end

  end
end
