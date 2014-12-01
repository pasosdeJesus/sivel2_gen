# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Anexoactividad, :type => :model do
    context "valido" do
      let(:actividad) { FactoryGirl.build(:sivel2_gen_actividad) }
      let(:anexoactividad) { 
        FactoryGirl.build(:sivel2_gen_anexoactividad, actividad: actividad) 
      }
      after(:each) do
        anexoactividad.destroy
        actividad.destroy
      end

      it "simple" do
        anexoactividad.adjunto = File.new(Rails.root + 'db/seeds.rb')
        expect(anexoactividad).to be_valid
      end
    end

    it "no valido 1" do
      anexoactividad = FactoryGirl.build(:sivel2_gen_anexoactividad)
      expect(anexoactividad).not_to be_valid
      anexoactividad.destroy
    end

    it "no valido 2" do
      actividad = FactoryGirl.build(:sivel2_gen_actividad)
      anexoactividad = FactoryGirl.build(:sivel2_gen_anexoactividad, 
                                         actividad: actividad, 
                                         descripcion: nil) 
      expect(anexoactividad).not_to be_valid
      anexoactividad.destroy
      actividad.destroy
    end
  end
end
