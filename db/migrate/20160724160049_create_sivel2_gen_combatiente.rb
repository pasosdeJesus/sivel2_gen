class CreateSivel2GenCombatiente < ActiveRecord::Migration[5.0]
  def change
    create_table :sivel2_gen_combatiente do |t|
      t.string :nombre, limit: 500, null: false
      t.string :alias, limit: 500
      t.integer :edad
      t.string :sexo, limit: 1, null: false, default: 'S'
      t.integer :id_resagresion, null: false, default: 1
      t.integer :id_profesion, default: 22
      t.integer :id_rangoedad, default: 6
      t.integer :id_filiacion, default: 10
      t.integer :id_sectorsocial,  default: 15
      t.integer :id_organizacion,  default: 16
      t.integer :id_vinculoestado,  default: 38
      t.integer :id_caso
      t.integer :organizacionarmada, default: 35
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    add_foreign_key :sivel2_gen_combatiente, :sivel2_gen_filiacion, 
      column: :id_filiacion
    add_foreign_key :sivel2_gen_combatiente, :sivel2_gen_organizacion, 
      column: :id_organizacion
    add_foreign_key :sivel2_gen_combatiente, :sivel2_gen_profesion,
      column: :id_profesion
    add_foreign_key :sivel2_gen_combatiente, :sivel2_gen_rangoedad,
      column: :id_rangoedad
    add_foreign_key :sivel2_gen_combatiente, :sivel2_gen_resagresion,
      column: :id_resagresion
    add_foreign_key :sivel2_gen_combatiente, :sivel2_gen_sectorsocial,
      column: :id_sectorsocial
    add_foreign_key :sivel2_gen_combatiente, :sivel2_gen_vinculoestado,
      column: :id_vinculoestado
    add_foreign_key :sivel2_gen_combatiente, :sivel2_gen_presponsable,
      column: :organizacionarmada
  end
end
