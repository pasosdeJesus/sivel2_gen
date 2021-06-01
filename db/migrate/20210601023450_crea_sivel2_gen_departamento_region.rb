class CreaSivel2GenDepartamentoRegion < ActiveRecord::Migration[6.1]
  def change
    create_table  :sivel2_gen_departamento_region, :id => false do |t|
      t.integer :departamento_id
      t.integer :region_id
    end
  end
end
