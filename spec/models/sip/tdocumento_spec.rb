# encoding: UTF-8
require 'rails_helper'

module Sip
  RSpec.describe Tdocumento, :type => :model do

    it "valido" do
      tdocumento = FactoryGirl.build(:sip_tdocumento)
      expect(tdocumento).to be_valid
      tdocumento.destroy
    end

    it "no valido" do
      tdocumento = FactoryGirl.build(:sip_tdocumento, nombre: '')
      expect(tdocumento).not_to be_valid
      tdocumento.destroy
    end

    it "existente" do
      tdocumento = Sip::Tdocumento.where(id: 7).take
      expect(tdocumento.nombre).to eq("OTRO")
    end

  end

end
