# frozen_string_literal: true.
class UnificaDivisionBrigadaBatallon < ActiveRecord::Migration[7.0]
  def up
    cps_antigua = Sivel2Gen::CasoPresponsable.all
    add_column :sivel2_gen_caso_presponsable, :subdivision, :string
    cps_nuevas = Sivel2Gen::CasoPresponsable.all
    cps_nuevas.each do |cp|
      cp.update_column(:subdivision, "#{:division}. #{:brigada}. #{:batallon}")
    end
    remove_column :sivel2_gen_caso_presponsable, :division, :string
    remove_column :sivel2_gen_caso_presponsable, :brigada, :string
    remove_column :sivel2_gen_caso_presponsable, :batallon, :string
  end

  def down
    cps = Sivel2Gen::CasoPresponsable.all
    add_column :sivel2_gen_caso_presponsable, :division, :string
    add_column :sivel2_gen_caso_presponsable, :brigada, :string
    add_column :sivel2_gen_caso_presponsable, :batallon, :string
    cps_nueva = Sivel2Gen::CasoPresponsable.all
    cps_nueva.each do |cp|
      if cp.subdivision
        cp.update_column(:division, "#{:subdivision}".split(". ")[0])
        cp.update_column(:brigada, "#{:subdivision}".split(". ")[1])
        cp.update_column(:batallon, "#{:subdivision}".split(". ")[2])
      end
    end
    remove_column :sivel2_gen_caso_presponsable, :subdivision, :string
  end
end
