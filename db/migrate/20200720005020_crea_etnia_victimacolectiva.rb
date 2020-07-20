class CreaEtniaVictimacolectiva < ActiveRecord::Migration[6.0]
  def change
    create_table :sivel2_gen_etnia_victimacolectiva, id: false do |t|
      t.integer :etnia_id
      t.integer :victimacolectiva_id
      t.index :etnia_id
      t.index :victimacolectiva_id
    end
      add_foreign_key :sivel2_gen_etnia_victimacolectiva, 
        :sivel2_gen_etnia, column: :etnia_id
      add_foreign_key :sivel2_gen_etnia_victimacolectiva, 
        :sivel2_gen_victimacolectiva, column: :victimacolectiva_id
  end
end
