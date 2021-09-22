
class Renombravista < ActiveRecord::Migration[5.0]

  def up
    execute <<-SQL
      UPDATE heb412_gen_plantillahcm SET vista='Caso' where vista='Listado de casos';
    SQL
  end

  def down
    execute <<-SQL
      UPDATE heb412_gen_plantillahcm SET vista='Listado de casos' where vista='Caso';
    SQL

  end
end
