class RenombraAntecedenteSeq < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      ALTER SEQUENCE antecedente_seq RENAME TO sivel2_gen_antecedente_id_seq;
    SQL
  end
  def down
    execute <<-SQL
      ALTER SEQUENCE sivel2_gen_antecedente_id_seq RENAME TO antecedente_seq;
    SQL
  end
end
