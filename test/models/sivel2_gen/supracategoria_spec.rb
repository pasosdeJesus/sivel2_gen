# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Supracategoria, :type => :model do

    it "valido" do
      supracategoria = FactoryGirl.build(:sivel2_gen_supracategoria)
      expect(supracategoria).to be_valid
      supracategoria.destroy
    end

    it "no valido" do
      supracategoria = FactoryGirl.build(:sivel2_gen_supracategoria, nombre: '')
      expect(supracategoria).not_to be_valid
      supracategoria.destroy
    end

    it "existente" do
      supracategoria = Sivel2Gen::Supracategoria.where(id: 1).take
      expect(supracategoria.nombre).to eq("PERSECUCIÓN POLÍTICA")
    end

  end
end
