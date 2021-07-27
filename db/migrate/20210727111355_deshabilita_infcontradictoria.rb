class DeshabilitaInfcontradictoria < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_presponsable SET fechadeshabilitacion='2021-07-27'
        WHERE id=34 AND (nombre='INFORMACION CONTRADICTORIA' OR
          nombre='INFORMACIÓN CONTRADICTORIA');
    SQL
  end
  def down
    execute <<-SQL
      UPDATE sivel2_gen_presponsable SET fechadeshabilitacion=NULL
        WHERE id=34 AND (nombre='INFORMACION CONTRADICTORIA' OR
          nombre='INFORMACIÓN CONTRADICTORIA');
    SQL
  end
end
