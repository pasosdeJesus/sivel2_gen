class RenombraGrupoperSeq < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER SEQUENCE grupoper_seq RENAME TO sivel2_gen_grupoper_id_seq;
    SQL
  end
  def down
    execute <<-SQL
      ALTER SEQUENCE sivel2_gen_grupoper_id_seq RENAME TO grupoper_seq;
    SQL
  end
end
