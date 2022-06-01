class PrAltasBajas < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_presponsable SET 
        nombre=INITCAP(nombre) WHERE 
        id NOT IN (8, 9 , 10, 11, 12, 13, 15, 16, 27, 28, 30, 31, 32);
      UPDATE sivel2_gen_presponsable SET
        nombre=REPLACE(nombre, ' De ', ' de ') 
        WHERE id IN (17, 18, 19, 20, 21, 22, 33);
      UPDATE sivel2_gen_presponsable SET
        nombre='Fuerza Pública' WHERE id='2';
      UPDATE sivel2_gen_presponsable SET
        nombre='Ejército' WHERE id='4';
      UPDATE sivel2_gen_presponsable SET
        nombre='Autodefensas de los Llanos Orientales' 
        WHERE id='19';
      UPDATE sivel2_gen_presponsable SET
        nombre='Autodefensas de Santander y Sur del Cesar' 
        WHERE id='20';
      UPDATE sivel2_gen_presponsable SET
        nombre='Autodefensas Campesinas del Magdalena Medio, ACMM' 
        WHERE id='23';
      UPDATE sivel2_gen_presponsable SET
        nombre='Información Contradictoria' WHERE id='34';
      UPDATE sivel2_gen_presponsable SET
        nombre='Fiscalía' WHERE id='38';
    SQL
  end

  def down
    execute <<-SQL
      UPDATE sivel2_gen_presponsable SET 
        nombre=UPPER(nombre);
    SQL
  end
end
