class Fechacreacion < ActiveRecord::Migration[4.1]

  TABLASBASICAS = [:actividadarea, #ayudaestado, 
    :departamento, :municipio, #:actividadoficio, :ayudasjr, 
    :categoria, #:escolaridad, :estadocivil, 
    :etiqueta, :iglesia, #:maternidad, 
    :presponsable, :profesion,  :regionsjr, #:rolfamilia, 
    :tsitio
  ]

  def change
    TABLASBASICAS.each do |t|
      execute <<-SQL
        ALTER TABLE #{t} ALTER COLUMN fechacreacion 
            SET DEFAULT CURRENT_DATE;
SQL
    end
  end
end
