# encoding: UTF-8
require 'rails_helper'

module Sip
  # Como nuestras pruebas a modelos se hacen en una base de datos
  # que tiene muchos datos básicos (e.g información geográfica), 
  # no usamo database_clenaer, sino que las pruebas que crean elementos 
  # de datos básicos
  # son responsables de borrarlos
  RSpec.describe Pais, :type => :model do
    it "nuevo valido" do
      pais = FactoryGirl.build(:sip_pais)
      expect(pais).to be_valid
      pais.destroy
    end

    it "nuevo no valido" do
      pais = FactoryGirl.build(:sip_pais, nombre: '')
      expect(pais).not_to be_valid
      pais.destroy
    end

    it "existente" do
      pais = Sip::Pais.find(862) # Venezuela
      expect(pais.nombre).to eq("VENEZUELA")
    end
  end
end
