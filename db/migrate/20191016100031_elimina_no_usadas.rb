class EliminaNoUsadas < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      DROP VIEW IF EXISTS cpaact;
      DROP VIEW IF EXISTS homonimia;
      DROP VIEW IF EXISTS priact;
      DROP VIEW IF EXISTS rangos_errados;
      DROP VIEW IF EXISTS y;
      DROP TABLE IF EXISTS actualizacionbase;
      DROP TABLE IF EXISTS caso_usuario_tmp;
      DROP TABLE IF EXISTS muncoor;
      DROP TABLE IF EXISTS obsoleto_funcionario CASCADE;
      DROP TABLE IF EXISTS victimao;
      DROP TABLE IF EXISTS categoria_personal;
      DROP TABLE IF EXISTS departamento_region;
      DROP TABLE IF EXISTS descripcion_frontera;
      DROP TABLE IF EXISTS homonimosim;
      DROP TABLE IF EXISTS p_responsable_agrede_persona;
    SQL
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
