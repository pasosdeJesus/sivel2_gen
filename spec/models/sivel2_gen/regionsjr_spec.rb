# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Regionsjr, :type => :model do

    it "valido" do
      regionsjr = FactoryGirl.build(:sip_oficina)
      expect(regionsjr).to be_valid
      regionsjr.destroy
    end

    it "no valido" do
      regionsjr = FactoryGirl.build(:sip_oficina, nombre: '')
      expect(regionsjr).not_to be_valid
      regionsjr.destroy
    end

    it "existente" do
      regionsjr = Sip::Oficina.where(id: 1).take
      expect(regionsjr.nombre).to eq("SIN INFORMACIÓN")
    end

  end
end
