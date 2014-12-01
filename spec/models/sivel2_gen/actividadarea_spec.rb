# encoding: UTF-8
require 'rails_helper'
module Sivel2Gen
  RSpec.describe Actividadarea, :type => :model do

    it "valido" do
      actividadarea = FactoryGirl.build(:sivel2_gen_actividadarea)
      expect(actividadarea).to be_valid
      actividadarea.destroy
    end

    it "no valido" do
      actividadarea = FactoryGirl.build(:sivel2_gen_actividadarea, nombre: '')
      expect(actividadarea).not_to be_valid
      actividadarea.destroy
    end

    it "existente" do
      actividadarea = Sivel2Gen::Actividadarea.where(id: 1).take
      expect(actividadarea.nombre).to eq("PSICOSOCIAL")
    end
  end
end
