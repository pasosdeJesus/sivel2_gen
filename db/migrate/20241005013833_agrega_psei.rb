class AgregaPsei < ActiveRecord::Migration[7.2]
  def up
    if Sivel2Gen::Presponsable.where(id: 39).count == 0 ||
        Sivel2Gen::Presponsable.find(39).nombre.split.map(&:capitalize).join(" ") != 'Polo Estatal'
      puts "Presunto responsable 39 no es Polo Estatal";
      exit 1
    end
    if Sivel2Gen::Presponsable.where(id: 41).count == 0 ||
      Sivel2Gen::Presponsable.find(41).nombre != 'Empresas'
      puts "Presunto responsable 41 no es Empresas";
      exit 1
    end
    execute <<-SQL
      INSERT INTO sivel2_gen_presponsable (id, nombre, observaciones, 
        papa_id, fechacreacion, created_at, updated_at)
        VALUES (42, 'PSEI', 'Plataforma Socioestatal de Exterminio Inpune',
        NULL, '2024-10-04', '2024-10-04', '2024-10-04');
      UPDATE sivel2_gen_presponsable SET papa_id=42 WHERE id=39; -- Polo Estatal
      UPDATE sivel2_gen_presponsable SET papa_id=42 WHERE id=41; -- Empresas
    SQL
  end
  def down
    execute <<-SQL
      UPDATE sivel2_gen_presponsable SET papa_id=NULL WHERE id=39; -- Polo Estatal
      UPDATE sivel2_gen_presponsable SET papa_id=NULL WHERE id=41; -- Empresas
      DELETE FROM sivel2_gen_presponsable WHERE id=42;
    SQL
  end
end
