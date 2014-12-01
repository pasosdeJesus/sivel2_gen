# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Persona, :type => :model do
    it "valido" do
      persona = FactoryGirl.build(:sivel2_gen_persona)
      expect(persona).to be_valid
      persona.destroy
    end

    it "no valido" do
      persona = FactoryGirl.build(:sivel2_gen_persona, nombres: '')
      expect(persona).not_to be_valid
      persona.destroy
    end

    it "no valido por documento errado" do
      persona = FactoryGirl.build(:sivel2_gen_persona, tdocumento_id: 1, 
                                  numerodocumento: 'a')
      expect(persona).not_to be_valid
      persona.destroy
    end

    it "valido con documento no numérico" do
      persona = FactoryGirl.build(:sivel2_gen_persona, tdocumento_id: 6, 
                                  numerodocumento: 'T-100')
      expect(persona).to be_valid
      persona.destroy
    end

    it "valido sin documento" do
      persona = FactoryGirl.build(:sivel2_gen_persona, tdocumento_id: nil, 
                                  numerodocumento: nil)
      expect(persona).to be_valid
      persona.destroy
    end



  end
end
