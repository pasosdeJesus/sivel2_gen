# encoding: UTF-8
require 'rails_helper'

module Sivel2Gen
  RSpec.describe Categoria, :type => :model do

    it "valido" do
      categoria = FactoryGirl.build(:sivel2_gen_categoria)
      expect(categoria).to be_valid
      categoria.destroy
    end

    it "no valido" do
      categoria = FactoryGirl.build(:sivel2_gen_categoria, nombre: '')
      expect(categoria).not_to be_valid
      categoria.destroy
    end

    it "existente" do
      categoria = Sivel2Gen::Categoria.where(id: 10).take
      expect(categoria.nombre).to eq("EJECUCIÓN EXTRAJUDICIAL")
    end

  end
end
