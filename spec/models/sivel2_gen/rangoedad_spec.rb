# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Rangoedad, :type => :model do

    it "valido" do
      rangoedad = FactoryGirl.build(:sivel2_gen_rangoedad)
      expect(rangoedad).to be_valid
      rangoedad.destroy
    end

    it "no valido" do
      rangoedad = FactoryGirl.build(:sivel2_gen_rangoedad, nombre: '')
      expect(rangoedad).not_to be_valid
      rangoedad.destroy
    end

    it "existente" do
      rangoedad = Sivel2Gen::Rangoedad.where(id: 1).take
      expect(rangoedad.nombre).to eq("R1")
    end

  end
end
