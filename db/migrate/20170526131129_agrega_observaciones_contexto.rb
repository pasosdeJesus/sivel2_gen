class AgregaObservacionesContexto < ActiveRecord::Migration[5.0]
  def up
    add_column :sivel2_gen_contexto, :observaciones, :string, limit: 5000 
    execute <<-SQL
      ALTER SEQUENCE IF EXISTS contexto_seq RENAME TO sivel2_gen_contexto_id_seq;
    SQL
  end
  def down
    remove_column :sivel2_gen_contexto, :observaciones
  end
end
