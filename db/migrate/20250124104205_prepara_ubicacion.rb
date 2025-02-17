# frozen_string_literal: true

class PreparaUbicacion < ActiveRecord::Migration[7.2]
  def up
    execute(<<-SQL)
      UPDATE msip_ubicacion SET sitio=NULL WHERE upper(trim(sitio)) in ('SIN INFORMACION', '');
      UPDATE msip_ubicacion SET lugar=NULL WHERE upper(trim(lugar)) in ('SIN INFORMACION', '');
      UPDATE msip_ubicacion SET lugar=sitio WHERE lugar IS NULL and sitio IS NOT NULL;
      UPDATE msip_ubicacion SET sitio=NULL WHERE sitio IS NOT NULL AND sitio=lugar;
    SQL
  end

  def down
  end
end
