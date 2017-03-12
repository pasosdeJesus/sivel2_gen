# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Caso, :type => :model do

    it "valido" do
      caso = FactoryGirl.build(:sivel2_gen_caso)
      expect(caso).to be_valid
      caso.destroy
    end

    it "no valido" do
      caso = FactoryGirl.build(:sivel2_gen_caso, fecha: nil)
      expect(caso).not_to be_valid
      caso.destroy
    end

  end
end
