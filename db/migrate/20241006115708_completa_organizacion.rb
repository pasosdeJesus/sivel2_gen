# frozen_string_literal: true

class CompletaOrganizacion < ActiveRecord::Migration[7.2]
  def crea_desplazados
    execute(<<-SQL)
      INSERT INTO sivel2_gen_organizacion(id, nombre, observaciones,#{" "}
        fechacreacion, created_at, updated_at)
        VALUES (19, 'DESPLAZADOS', '',
        '2020-10-04', '2020-10-04', '2020-10-04');
    SQL
  end

  def crea_paz
    execute(<<-SQL)
      INSERT INTO sivel2_gen_organizacion(id, nombre, observaciones,#{" "}
        fechacreacion, created_at, updated_at)
        VALUES (20, 'PAZ', '',
        '2020-10-04', '2020-10-04', '2020-10-04');
    SQL
  end

  def crea_comunal
    execute(<<-SQL)
      INSERT INTO sivel2_gen_organizacion(id, nombre, observaciones,#{" "}
        fechacreacion, created_at, updated_at)
        VALUES (21, 'COMUNAL', '',
        '2020-10-04', '2020-10-04', '2020-10-04');
    SQL
  end

  def renumera_organizacion(id_ant, id_nuevo)
    execute(<<-SQL)
        UPDATE sivel2_gen_victima
          SET organizacion_id='#{id_nuevo}' WHERE organizacion_id=#{id_ant};
        UPDATE sivel2_gen_otraorga_victima
          SET organizacion_id='#{id_nuevo}' WHERE organizacion_id=#{id_ant};
        UPDATE sivel2_gen_combatiente
          SET organizacion_id='#{id_nuevo}' WHERE organizacion_id=#{id_ant};
        UPDATE sivel2_gen_organizacion_victimacolectiva
          SET organizacion_id='#{id_nuevo}' WHERE organizacion_id=#{id_ant};
    SQL
  end

  def up
    if Sivel2Gen::Organizacion.where("TRIM(nombre) ILIKE 'DESPLAZADOS'").count == 1
      desp = Sivel2Gen::Organizacion.find_by("TRIM(nombre) ILIKE 'DESPLAZADOS'")
      desp.nombre += "cadena_loca¿"
      desp.save!
      crea_desplazados
      renumera_organizacion(desp.id, 19)
      desp.delete
    else
      crea_desplazados
    end

    if Sivel2Gen::Organizacion.where(id: 17).count == 0
      execute(<<-SQL)
        INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (17, 'VÍCTIMAS', '2013-07-05', NULL, '2013-07-05 00:00:00', '2013-07-05 00:00:00', NULL);
      SQL
    elsif Sivel2Gen::Organizacion.find(17).nombre != "VÍCTIMAS"
      puts "Problema, la organización 17 no es VÍCTIMAS"
      exit(1)
    end
    if Sivel2Gen::Organizacion.where(id: 18).count == 0
      execute(<<-SQL)
        INSERT INTO public.sivel2_gen_organizacion (id, nombre, fechacreacion, fechadeshabilitacion, created_at, updated_at, observaciones) VALUES (18, 'LGTB', '2020-07-05', NULL, '2020-07-05 00:00:00', '2020-07-05 00:00:00', NULL);
      SQL
    elsif Sivel2Gen::Organizacion.find(18).nombre != "LGTB"
      puts "Problema, la organización 18 no es LGTB"
      exit(1)
    end

    if Sivel2Gen::Organizacion.where("nombre ILIKE 'VICTIMAS'").count == 1
      vic = Sivel2Gen::Organizacion.find_by("nombre ILIKE 'VICTIMAS'")
      if vic.id == 17
        puts "Organización 17 debería ser VÍCTIMAS"
        exit(1)
      end
      vic.nombre += "cadena_loca¿"
      vic.save!
      renumera_organizacion(vic.id, 17)
      vic.delete
    end

    if Sivel2Gen::Organizacion.where("nombre ILIKE 'PAZ'").count == 1
      paz = Sivel2Gen::Organizacion.find_by("nombre ILIKE 'PAZ'")
      paz.nombre += "cadena_loca¿"
      paz.save!
      crea_paz
      renumera_organizacion(paz.id, 20)
      paz.delete
    else
      crea_paz
    end
    if Sivel2Gen::Organizacion.where("nombre ILIKE 'COMUNAL'").count == 1
      comunal = Sivel2Gen::Organizacion.find_by("nombre ILIKE 'COMUNAL'")
      comunal.nombre += "cadena_loca¿"
      comunal.save!
      crea_comunal
      renumera_organizacion(comunal.id, 21)
      comunal.delete
    else
      crea_comunal
    end
  end

  def down
    execute(<<-SQL)
      DELETE FROM sivel2_gen_organizacion WHERE id=18 AND nombre='LGTB';
      DELETE FROM sivel2_gen_organizacion WHERE id=19 AND nombre ilike 'DESPLAZADOS';
      DELETE FROM sivel2_gen_organizacion WHERE id=20 AND nombre='PAZ';
      DELETE FROM sivel2_gen_organizacion WHERE id=21 AND nombre='COMUNAL';
    SQL
  end
end
