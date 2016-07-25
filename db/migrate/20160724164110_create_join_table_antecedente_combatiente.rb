class CreateJoinTableAntecedenteCombatiente < ActiveRecord::Migration[5.0]
  def change
    create_table :sivel2_gen_antecedente_combatiente, id: false do |t|
      t.integer :id_antecedente
      t.integer :id_combatiente
      t.index :id_antecedente
      t.index :id_combatiente
    end
    add_foreign_key :sivel2_gen_antecedente_combatiente, 
      :sivel2_gen_antecedente, column: :id_antecedente
    add_foreign_key :sivel2_gen_antecedente_combatiente, 
      :sivel2_gen_combatiente, column: :id_combatiente
  end
end
