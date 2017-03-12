# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Frontera, :type => :model do

    it "valido" do
      frontera = FactoryGirl.build(:sivel2_gen_frontera)
      expect(frontera).to be_valid
      frontera.destroy
    end

    it "no valido" do
      frontera = FactoryGirl.build(:sivel2_gen_frontera, nombre: '')
      expect(frontera).not_to be_valid
      frontera.destroy
    end

    it "existente" do
      frontera = Sivel2Gen::Frontera.where(id: 1).take
      expect(frontera.nombre).to eq("Ecuador")
    end

  end
end
