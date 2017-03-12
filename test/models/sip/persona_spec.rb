# encoding: UTF-8
require 'rails_helper'

module Sip
  RSpec.describe Persona, :type => :model do
    it "valido" do
      persona = FactoryGirl.build(:sip_persona)
      expect(persona).to be_valid
      persona.destroy
    end

    it "no valido" do
      persona = FactoryGirl.build(:sip_persona, nombres: '')
      expect(persona).not_to be_valid
      persona.destroy
    end

    it "no valido por documento errado" do
      persona = FactoryGirl.build(:sip_persona, tdocumento_id: 1, 
                                  numerodocumento: 'a')
      expect(persona).not_to be_valid
      persona.destroy
    end

    it "no valido por año errado" do
      persona = FactoryGirl.build(:sip_persona, anionac: 1)
      expect(persona).not_to be_valid
      persona.destroy
    end
    it "no valido por mes errado" do
      persona = FactoryGirl.build(:sip_persona, mesnac: 0)
      expect(persona).not_to be_valid
      persona.destroy
    end
    it "no valido por mes errado" do
      persona = FactoryGirl.build(:sip_persona, mesnac: 13)
      expect(persona).not_to be_valid
      persona.destroy
    end
    it "no valido por dia errado" do
      persona = FactoryGirl.build(:sip_persona, dianac: 0)
      expect(persona).not_to be_valid
      persona.destroy
    end
    it "no valido por dia errado" do
      persona = FactoryGirl.build(:sip_persona, dianac: 32)
      expect(persona).not_to be_valid
      persona.destroy
    end
    it "no valido por dia errado" do
      persona = FactoryGirl.build(:sip_persona, mesnac: 4, dianac: 31)
      expect(persona).not_to be_valid
      persona.destroy
    end
    it "no valido por dia errado" do
      persona = FactoryGirl.build(:sip_persona, mesnac: 2, dianac: 30)
      expect(persona).not_to be_valid
      persona.destroy
    end
    it "valido con documento no numérico" do
      persona = FactoryGirl.build(:sip_persona, tdocumento_id: 6, 
                                  numerodocumento: 'T-100')
      expect(persona).to be_valid
      persona.destroy
    end

    it "valido sin documento" do
      persona = FactoryGirl.build(:sip_persona, tdocumento_id: nil, 
                                  numerodocumento: nil)
      expect(persona).to be_valid
      persona.destroy
    end



  end
end
