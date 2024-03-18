class AgregaCategorias202402 < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      INSERT INTO public.sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, created_at, updated_at, observaciones, supracategoria_id) VALUES 
      (115, 'COLECTIVO DETENIDO', '2024-03-05', NULL, NULL, NULL, 'C', '2024-03-05', '2024-02-05', NULL, 1);
      INSERT INTO public.sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, created_at, updated_at, observaciones, supracategoria_id) VALUES 
      (125, 'COLECTIVO DETENIDO', '2024-03-05', NULL, NULL, NULL, 'C', '2024-03-05', '2024-02-05', NULL, 5);
      INSERT INTO public.sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, created_at, updated_at, observaciones, supracategoria_id) VALUES 
      (135, 'COLECTIVO DETENIDO', '2024-03-05', NULL, NULL, NULL, 'C', '2024-03-05', '2024-02-05', NULL, 8);
      INSERT INTO public.sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, created_at, updated_at, observaciones, supracategoria_id) VALUES 
      (403, 'CONFINAMIENTO COMO REPRESALIA O CASTIGO COLECTIVO', '2024-03-05', NULL, NULL, NULL, 'C', '2024-03-05', '2024-02-05', NULL, 2);
      INSERT INTO public.sivel2_gen_categoria (id, nombre, fechacreacion, fechadeshabilitacion, pconsolidado_id, contadaen, tipocat, created_at, updated_at, observaciones, supracategoria_id) VALUES 
      (503, 'CONFINAMIENTO COMO REPRESALIA O CASTIGO COLECTIVO', '2024-03-05', NULL, NULL, NULL, 'C', '2024-03-05', '2024-02-05', NULL, 6);
    SQL
  end
  def down
    execute <<-SQL
      DELETE FROM sivel2_gen_categoria WHERE id IN (115,125,135,403,503);
    SQL
  end
end
