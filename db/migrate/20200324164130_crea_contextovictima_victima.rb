class CreaContextovictimaVictima < ActiveRecord::Migration[6.0]
  def change
    create_table :sivel2_gen_contextovictima_victima, id: false do |t|
      t.integer :contextovictima_id
      t.integer :victima_id
      t.index :contextovictima_id
      t.index :victima_id
    end
    add_foreign_key :sivel2_gen_contextovictima_victima, 
      :sivel2_gen_contextovictima, column: :contextovictima_id
    add_foreign_key :sivel2_gen_contextovictima_victima, 
      :sivel2_gen_victima, column: :victima_id
  end
end
