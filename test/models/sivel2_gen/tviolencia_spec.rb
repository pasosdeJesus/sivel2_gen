# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Tviolencia, :type => :model do

    it "valido" do
      tviolencia = FactoryGirl.build(:sivel2_gen_tviolencia)
      expect(tviolencia).to be_valid
      tviolencia.destroy
    end

    it "no valido" do
      tviolencia = FactoryGirl.build(:sivel2_gen_tviolencia, nombre: '')
      expect(tviolencia).not_to be_valid
      tviolencia.destroy
    end

    it "existente" do
      tviolencia = Sivel2Gen::Tviolencia.where(id: 'A').take
      expect(tviolencia.nombre).to eq("VIOLACIONES A LOS DERECHOS HUMANOS")
    end

  end
end
