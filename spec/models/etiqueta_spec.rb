# encoding: UTF-8
require 'rails_helper'

RSpec.describe Etiqueta, :type => :model do
  it "valido" do
    etiqueta = FactoryGirl.build(:etiqueta)
    expect(etiqueta).to be_valid
    etiqueta.destroy
  end

  it "no valido" do
    etiqueta = FactoryGirl.build(:etiqueta, nombre: '')
    expect(etiqueta).not_to be_valid
    etiqueta.destroy
  end

  it "existente" do
    etiqueta = Etiqueta.find(3)
    expect(etiqueta.nombre).to eq("IMPORTA_RELATO")
  end

end
