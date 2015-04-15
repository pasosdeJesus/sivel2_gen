# encoding: UTF-8
require 'rails_helper'

module Sip
  RSpec.describe Municipio, :type => :model do
    it "valido" do
      municipio = FactoryGirl.build(:sip_municipio)
      expect(municipio).to be_valid
      municipio.destroy
    end

    it "no valido" do
      municipio = FactoryGirl.build(:sip_municipio, nombre: '')
      expect(municipio).not_to be_valid
      municipio.destroy
    end

    it "existente" do
      municipio = Sip::Municipio.where(id:25).take
      expect(municipio.nombre).to eq("BOLIVARIANO LIBERTADOR")
    end

  end
end
