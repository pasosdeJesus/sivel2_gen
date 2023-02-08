class EtniaPorOmision < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      DROP VIEW IF EXISTS cben2;
      DROP VIEW IF EXISTS cben1;
      UPDATE sivel2_gen_victima SET id_etnia=1 WHERE id_etnia IS NULL;
    SQL
    change_column :sivel2_gen_victima, :id_etnia, :integer, null: false
  end

  def down
    change_column :sivel2_gen_victima, :id_etnia, :integer, null: true
  end
end
