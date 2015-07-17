# encoding: UTF-8
require 'rails_helper'

module Sip
  RSpec.describe Etiqueta, :type => :model do
    it "valido" do
      etiqueta = FactoryGirl.build(:sip_etiqueta)
      expect(etiqueta).to be_valid
      etiqueta.destroy
    end

    it "no valido" do
      etiqueta = FactoryGirl.build(:sip_etiqueta, nombre: '')
      expect(etiqueta).not_to be_valid
      etiqueta.destroy
    end

    it "existente" do
      etiqueta = Sip::Etiqueta.find(3)
      expect(etiqueta.nombre).to eq("IMPORTA_RELATO")
    end
  end
end
