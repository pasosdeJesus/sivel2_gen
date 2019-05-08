# encoding: utf-8

class MejoraMarcoCinep716singplural < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      UPDATE sivel2_gen_categoria SET nombre='NEGACIÓN DE DERECHOS A PRISIONERO DE GUERRA' WHERE id='716';
      UPDATE sivel2_gen_categoria SET nombre='NEGACIÓN DE ATENCIÓN A PERSONA VULNERABLE' WHERE id='717';
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id, tipocat, fechacreacion)
        VALUES ('916', 'NEGACIÓN DE DERECHOS A PRISIONEROS DE GUERRA', '1', 'C', '2018-02-24') 
        ON CONFLICT (id) DO NOTHING; 
      INSERT INTO sivel2_gen_categoria (id, nombre, supracategoria_id, tipocat, fechacreacion)
        VALUES ('917', 'NEGACIÓN DE ATENCIÓN A PERSONAS VULNERABLES', '1', 'C', '2018-02-24')
        ON CONFLICT (id) DO NOTHING; 
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM sivel2_gen_categoria WHETE id IN ('916', '917');
      UPDATE sivel2_gen_categoria SET nombre='NEGACIÓN DE DERECHOS A PRISIONEROS DE GUERRA' WHERE id='716';
      UPDATE sivel2_gen_categoria SET nombre='NEGACIÓN DE ATENCIÓN A PERSONAS VULNERABLES' WHERE id='717';
    SQL
  end
end
