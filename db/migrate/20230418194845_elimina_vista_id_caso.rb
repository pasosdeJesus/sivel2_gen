class EliminaVistaIdCaso < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      DROP VIEW IF EXISTS public.sivel2_gen_iniciador;
      DROP VIEW IF EXISTS public.cvt1;
      DROP VIEW IF EXISTS public.iniciador;
      DROP VIEW IF EXISTS public.nobelicas;
      DROP VIEW IF EXISTS public.primerusuario;
      DROP MATERIALIZED VIEW IF EXISTS public.sivel2_gen_consexpcaso;
    SQL
  end
  def down
  end
end
