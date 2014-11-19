# encoding: UTF-8
require 'rails_helper'
module Sivel2Gen
  RSpec.describe Actividad, :type => :model do

    it "valido" do
      actividad = FactoryGirl.build(:sivel2_gen_actividad)
      expect(actividad).to be_valid
      actividad.destroy
    end

    it "no valido" do
      actividad = FactoryGirl.build(:sivel2_gen_actividad, oficina: nil)
      expect(actividad).not_to be_valid
      actividad.destroy
    end

  end
end
