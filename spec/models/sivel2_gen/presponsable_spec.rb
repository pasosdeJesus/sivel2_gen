# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Presponsable, :type => :model do

    it "valido" do
      presponsable = FactoryGirl.build(:sivel2_gen_presponsable)
      expect(presponsable).to be_valid
      presponsable.destroy
    end

    it "no valido" do
      presponsable = FactoryGirl.build(:sivel2_gen_presponsable, nombre: '')
      expect(presponsable).not_to be_valid
      presponsable.destroy
    end

    it "existente" do
      presponsable = Sivel2Gen::Presponsable.where(id: 35).take
      expect(presponsable.nombre).to eq("SIN INFORMACIÓN")
    end

  end
end
