# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Maternidad, :type => :model do

    it "valido" do
      maternidad = FactoryGirl.build(:sivel2_gen_maternidad)
      expect(maternidad).to be_valid
      maternidad.destroy
    end

    it "no valido" do
      maternidad = FactoryGirl.build(:sivel2_gen_maternidad, nombre: '')
      expect(maternidad).not_to be_valid
      maternidad.destroy
    end

    it "existente" do
      maternidad = Maternidad.where(id: 0).take
      expect(maternidad.nombre).to eq("NO APLICA")
    end

  end
end
