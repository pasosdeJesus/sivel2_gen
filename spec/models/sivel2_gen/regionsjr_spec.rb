# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Regionsjr, :type => :model do

    it "valido" do
      regionsjr = FactoryGirl.build(:sivel2_gen_regionsjr)
      expect(regionsjr).to be_valid
      regionsjr.destroy
    end

    it "no valido" do
      regionsjr = FactoryGirl.build(:sivel2_gen_regionsjr, nombre: '')
      expect(regionsjr).not_to be_valid
      regionsjr.destroy
    end

    it "existente" do
      regionsjr = Sivel2Gen::Regionsjr.where(id: 1).take
      expect(regionsjr.nombre).to eq("SIN INFORMACIÓN")
    end

  end
end
