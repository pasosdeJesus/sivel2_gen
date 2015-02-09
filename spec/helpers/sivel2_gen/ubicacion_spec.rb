# encoding: UTF-8
require 'rails_helper'
require 'sivel2_gen/ubicacion_helper'

module Sivel2Gen
  RSpec.configure do |c|
    c.include UbicacionHelper
  end

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

      it "nombre con sólo país" do
        expect(formato_ubicacion(ubicacion)).to eq("VENEZUELA")
      end

      context "con departamento" do
        let(:d) { Departamento.where(id_pais: 862, id: 1).take }
        before(:each) do
          ubicacion.departamento = d
        end
        it "nombre" do
          expect(formato_ubicacion(ubicacion)).to eq("VENEZUELA / DISTRITO CAPITAL")
        end

        context "con municipio" do
          let (:m) { Municipio.where(id_pais: 862, 
                                     id_departamento: 1, id: 1).take
          }
          before(:each) do
            ubicacion.municipio = m
          end
          it "nombre" do
            expect(formato_ubicacion(ubicacion)).to eq(
              "VENEZUELA / DISTRITO CAPITAL / BOLIVARIANO LIBERTADOR"
            )
          end

          context "con clase" do
            let (:c) { Clase.where(id_pais: 862, 
                                   id_departamento: 1, id_municipio: 1).take
            }
            before(:each) do
              ubicacion.clase = c
            end
            it "no incluye clase" do
              expect(formato_ubicacion(ubicacion, false)).to eq(
                "VENEZUELA / DISTRITO CAPITAL / BOLIVARIANO LIBERTADOR"
              )
            end
            it "incluye clase" do
              expect(formato_ubicacion(ubicacion)).to eq(
                "VENEZUELA / DISTRITO CAPITAL / BOLIVARIANO LIBERTADOR / CARACAS"
              )
            end
          end
        end
      end
    end

  end
end
