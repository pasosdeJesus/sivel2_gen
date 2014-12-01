# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Tclase, :type => :model do

    it "valido" do
      tclase = FactoryGirl.build(:sivel2_gen_tclase)
      expect(tclase).to be_valid
      tclase.destroy
    end

    it "no valido" do
      tclase = FactoryGirl.build(:sivel2_gen_tclase, nombre: '')
      expect(tclase).not_to be_valid
      tclase.destroy
    end

    it "existente" do
      tclase = Sivel2Gen::Tclase.where(id: 'C').take
      expect(tclase.nombre).to eq("CORREGIMIENTO")
    end

  end
end
