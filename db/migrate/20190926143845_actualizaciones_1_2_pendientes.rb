class Actualizaciones12Pendientes < ActiveRecord::Migration[6.0]

  def change
    execute <<-SQL
      ALTER TABLE sivel2_gen_antecedente ALTER COLUMN id
        SET DEFAULT nextval('sivel2_gen_antecedente_id_seq');
      ALTER TABLE sivel2_gen_pconsolidado ALTER COLUMN id
        SET DEFAULT nextval('sivel2_gen_pconsolidado_id_seq');
    SQL
  end

end
