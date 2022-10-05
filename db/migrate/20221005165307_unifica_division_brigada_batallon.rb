class UnificaDivisionBrigadaBatallon < ActiveRecord::Migration[7.0]
  def up
    cps_antigua = Sivel2Gen::CasoPresponsable.all
    subdivisiones = cps_antigua.map{ |cp| "#{cp.division}.#{cp.brigada}.#{cp.batallon}"}
    remove_column :sivel2_gen_caso_presponsable, :division, :string
    remove_column :sivel2_gen_caso_presponsable, :brigada, :string
    remove_column :sivel2_gen_caso_presponsable, :batallon, :string
    add_column :sivel2_gen_caso_presponsable, :subdivision, :string
    cps_nuevas = Sivel2Gen::CasoPresponsable.all
    cps_nuevas.each_with_index do |cp, index|
      cp.update_column(:subdivision, subdivisiones[index])
    end
  end

  def down
    cps_antigua = Sivel2Gen::CasoPresponsable.all
    subdivisiones = cps_antigua.map{|cp| cp.subdivision.nil? ? nil : cp.subdivision.split(".") }

    add_column :sivel2_gen_caso_presponsable, :division, :string
    add_column :sivel2_gen_caso_presponsable, :brigada, :string
    add_column :sivel2_gen_caso_presponsable, :batallon, :string
    remove_column :sivel2_gen_caso_presponsable, :subdivision, :string
    cps_nueva = Sivel2Gen::CasoPresponsable.all
    cps_nueva.each_with_index do |cp, index|
      cp.update_column(:division, subdivisiones[index].nil? ? nil : subdivisiones[index][0])
      cp.update_column(:brigada, subdivisiones[index].nil? ? nil : subdivisiones[index][1])
      cp.update_column(:batallon, subdivisiones[index].nil? ? nil : subdivisiones[index][2])
    end
  end
end
