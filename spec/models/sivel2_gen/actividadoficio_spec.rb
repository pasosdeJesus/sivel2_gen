# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Actividadoficio, :type => :model do

    it "valido" do
      actividadoficio = FactoryGirl.build(:sivel2_gen_actividadoficio)
      expect(actividadoficio).to be_valid
      actividadoficio.destroy
    end

    it "no valido" do
      actividadoficio = FactoryGirl.build(:sivel2_gen_actividadoficio, nombre: '')
      expect(actividadoficio).not_to be_valid
      actividadoficio.destroy
    end

    #it "existente" do
    #	actividadoficio = Actividadoficio.where(id: 1).take
    #	expect(actividadoficio.nombre).to eq("SIN INFORMACIÓN")
    #end

  end
end
