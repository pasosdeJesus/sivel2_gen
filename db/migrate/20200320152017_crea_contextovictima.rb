class CreaContextovictima < ActiveRecord::Migration[6.0]
  def up
    create_table :sivel2_gen_contextovictima do |t|
      t.string :nombre, limit: 100, null: false
      t.string :observaciones, limit: 5000
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false
    end
    execute <<-SQL
    INSERT INTO sivel2_gen_contextovictima (id, nombre, 
      fechacreacion, created_at, updated_at) VALUES (1, 
      'FALSO POSITIVO', '2020-03-26', '2020-03-26', '2020-03-26');
    SQL
  end

  def down
    drop_table :sivel2_gen_contextovictima
  end
end
