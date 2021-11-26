class OptimizaConteoDem2 < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE INDEX sivel2_gen_caso_anio_mes
        ON sivel2_gen_caso((((date_part('year'::text, (fecha)::timestamp without time zone))::text || '-'::text) || lpad((date_part('month'::text, (fecha)::timestamp without time zone))::text, 2, '0'::text)));
    SQL
  end

  def down
    execute <<-SQL
      DROP INDEX sivel2_gen_caso_anio_mes;
    SQL

  end
end
