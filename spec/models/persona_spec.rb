# encoding: UTF-8
require 'rails_helper'

RSpec.describe Persona, :type => :model do
  it "valido" do
		persona = FactoryGirl.build(:persona)
		expect(persona).to be_valid
		persona.destroy
	end

  it "no valido" do
		persona = FactoryGirl.build(:persona, nombres: '')
		expect(persona).not_to be_valid
		persona.destroy
	end
end
