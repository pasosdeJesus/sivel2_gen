# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Tdocumento, :type => :model do

    it "valido" do
      tdocumento = FactoryGirl.build(:sivel2_gen_tdocumento)
      expect(tdocumento).to be_valid
      tdocumento.destroy
    end

    it "no valido" do
      tdocumento = FactoryGirl.build(:sivel2_gen_tdocumento, nombre: '')
      expect(tdocumento).not_to be_valid
      tdocumento.destroy
    end

    it "existente" do
      tdocumento = Sivel2Gen::Tdocumento.where(id: 7).take
      expect(tdocumento.nombre).to eq("OTRO")
    end

  end

end
