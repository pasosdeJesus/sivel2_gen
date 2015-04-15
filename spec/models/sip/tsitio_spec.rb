# encoding: UTF-8
require 'rails_helper'

module Sip
  RSpec.describe Tsitio, :type => :model do

    it "valido" do
      tsitio = FactoryGirl.build(:sip_tsitio)
      expect(tsitio).to be_valid
      tsitio.destroy
    end

    it "no valido" do
      tsitio = FactoryGirl.build(:sip_tsitio, nombre: '')
      expect(tsitio).not_to be_valid
      tsitio.destroy
    end

    it "existente" do
      tsitio = Sip::Tsitio.where(id: 2).take
      expect(tsitio.nombre).to eq("URBANO")
    end

  end
end
