# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Iglesia, :type => :model do

    it "valido" do
      iglesia = FactoryGirl.build(:sivel2_gen_iglesia)
      expect(iglesia).to be_valid
      iglesia.destroy
    end

    it "no valido" do
      iglesia = FactoryGirl.build(:sivel2_gen_iglesia, nombre: '')
      expect(iglesia).not_to be_valid
      iglesia.destroy
    end

    it "existente" do
      iglesia = Sivel2Gen::Iglesia.where(id: 1).take
      expect(iglesia.nombre).to eq("SIN INFORMACIÓN")
    end

  end
end
