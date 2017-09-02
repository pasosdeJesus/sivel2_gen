class EliminaChequeo < ActiveRecord::Migration[4.0]
  def change
        execute <<-SQL
      ALTER TABLE acto DROP CONSTRAINT IF EXISTS acto_id_persona_fkey1;
      --ALTER TABLE actosjr DROP CONSTRAINT IF EXISTS actosjr_id_caso_fkey1;
      --ALTER TABLE respuesta DROP CONSTRAINT IF EXISTS respuesta_id_caso_fkey1
SQL
  end
end
