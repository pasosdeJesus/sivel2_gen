class ObservadorParteCasos < ActiveRecord::Migration[6.0]
  def change
    create_table :sivel2_gen_observador_filtrodepartamento, id: false do |t|
      t.integer :usuario_id
      t.integer :departamento_id
      t.index :usuario_id, name: :sivel2_gen_obs_fildep_u_idx
      t.index :departamento_id, name: :sivel2_gen_obs_fildep_d_idx
    end
    add_foreign_key :sivel2_gen_observador_filtrodepartamento,
      :usuario, column: :usuario_id, 
      name: :sivel2_gen_observador_filtrodepartamento_u_idx
    add_foreign_key :sivel2_gen_observador_filtrodepartamento,
      :sip_departamento, column: :departamento_id,
      name: :sivel2_gen_observador_filtrodepartamento_d_idx
    add_column :usuario, :observadorffechaini, :date
    add_column :usuario, :observadorffechafin, :date
  end
end
