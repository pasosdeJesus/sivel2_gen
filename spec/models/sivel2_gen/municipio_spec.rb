# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Municipio, :type => :model do
    it "valido" do
      municipio = FactoryGirl.build(:sivel2_gen_municipio)
      expect(municipio).to be_valid
      municipio.destroy
    end

    it "no valido" do
      municipio = FactoryGirl.build(:sivel2_gen_municipio, nombre: '')
      expect(municipio).not_to be_valid
      municipio.destroy
    end

    it "existente" do
      municipio = Sivel2Gen::Municipio.where(id_pais: 862, id_departamento:1, id:1).take
      expect(municipio.nombre).to eq("BOLIVARIANO LIBERTADOR")
    end

  end
end
