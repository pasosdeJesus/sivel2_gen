# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Departamento, :type => :model do
    it "valido" do
      departamento = FactoryGirl.build(:sivel2_gen_departamento)
      expect(departamento).to be_valid
      departamento.destroy
    end

    it "no valido" do
      departamento = FactoryGirl.build(:sivel2_gen_departamento, nombre: '')
      expect(departamento).not_to be_valid
      departamento.destroy
    end

    it "existente" do
      departamento = Sivel2Gen::Departamento.where(id_pais: 862, id:1).take
      expect(departamento.nombre).to eq("DISTRITO CAPITAL")
    end
  end
end
