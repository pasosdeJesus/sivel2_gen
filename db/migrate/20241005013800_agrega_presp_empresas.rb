# frozen_string_literal: true

class AgregaPrespEmpresas < ActiveRecord::Migration[7.2]
  def crea_empresas
    execute(<<-SQL)
      INSERT INTO sivel2_gen_presponsable (id, nombre, observaciones,#{" "}
        papa_id, fechacreacion, created_at, updated_at)
        VALUES (41, 'Empresas', '',
        NULL, '2024-10-04', '2024-10-04', '2024-10-04');
    SQL
  end

  def up
    if Sivel2Gen::Presponsable.where("nombre ILIKE 'Empresas'").count == 1
      acemp = Sivel2Gen::Presponsable.find_by("nombre ILIKE 'Empresas'")
      acemp.nombre += "cadena_loca¿"
      acemp.save!
      crea_empresas
      execute(<<-SQL)
        UPDATE sivel2_gen_presponsable SET papa_id='41'#{" "}
          WHERE papa_id=#{acemp.id};
        UPDATE sivel2_gen_victimacolectiva SET organizacionarmada='41'#{" "}
          WHERE organizacionarmada=#{acemp.id};
        UPDATE sivel2_gen_caso_presponsable SET presponsable_id='41'#{" "}
          WHERE presponsable_id=#{acemp.id};
        UPDATE sivel2_gen_victima SET organizacionarmada='41'#{" "}
          WHERE organizacionarmada=#{acemp.id};
        UPDATE sivel2_gen_acto SET presponsable_id='41'#{" "}
          WHERE presponsable_id=#{acemp.id};
        UPDATE sivel2_gen_actocolectivo SET presponsable_id='41'#{" "}
          WHERE presponsable_id=#{acemp.id};
        UPDATE sivel2_gen_combatiente SET organizacionarmada='41'#{" "}
          WHERE organizacionarmada=#{acemp.id};
      SQL
      acemp.delete
    else
      crea_empresas
    end
  end

  def down
    execute << -SQL
    DELETE(FROM(sivel2_gen_presponsable(WHERE(41))))
    SQL
  end
end
