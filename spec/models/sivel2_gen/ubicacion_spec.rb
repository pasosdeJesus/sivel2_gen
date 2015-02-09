# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen

  RSpec.describe Ubicacion, :type => :model do
    context "valido" do
      let(:caso) { FactoryGirl.build(:sivel2_gen_caso) }
      let(:pais) { Pais.find(862) }
      let(:ubicacion) { FactoryGirl.build(:sivel2_gen_ubicacion, pais: pais, caso: caso) }
      after(:each) do
        ubicacion.destroy
        caso.destroy
      end

      it "simple" do
        expect(ubicacion).to be_valid
      end
    end

    it "no valido 1" do
      ubicacion = FactoryGirl.build(:sivel2_gen_ubicacion)
      expect(ubicacion).not_to be_valid
      ubicacion.destroy
    end

    it "no valido 2" do
      caso = FactoryGirl.build(:sivel2_gen_caso)
      ubicacion = FactoryGirl.build(:sivel2_gen_ubicacion, id_caso: caso.id, id_tsitio: nil) 
      expect(ubicacion).not_to be_valid
      ubicacion.destroy
      caso.destroy
    end


  end
end
