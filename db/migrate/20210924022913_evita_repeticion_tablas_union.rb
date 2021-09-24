class EvitaRepeticionTablasUnion < ActiveRecord::Migration[6.1]

  LTD = [
    ['antecedente', 'caso', 'id_', 'id_'], 
    ['antecedente', 'combatiente', 'id_', 'id_' ],
    ['antecedente', 'victima', 'id_', 'id_']
    ['antecedente', 'victimacolectiva', 'id_', '_id']
    ['caso', 'contexto', 'id_', 'id_'], 
    ['caso', 'region', 'id_', 'id_'], 
    ['caso', 'respuestafor', '_id', '_id'], 
    ['contextovictima', 'victima', '_id', '_id'], 
    ['etnia', 'victimacolectiva', '_id', '_id'],
    ['filiacion', 'victimacolectiva', 'id_', '_id'],
    ['organizacion', 'victimacolectiva', 'id_', '_id'],
    ['profesion', 'victimacolectiva', 'id_', '_id'],
    ['rangoedad', 'victimacolectiva', 'id_', '_id'],
    ['sectorsocial', 'victimacolectiva', 'id_', '_id'],
    ['victimacolectiva', 'vinculoestado', '_id', 'id_']
  ]

  def up
    # Pone llave primaria compuesta
    LTD.each do |td|
      t = "sivel2_gen_#{td[0]}_#{td[1]}"
      tt = "#{td[0]}_#{td[1]}"
      c1= (td[2] == 'id_') ? "id_#{td[0]}" : "#{td[0]}_id"
      c2= (td[3] == 'id_') ? "id_#{td[1]}" : "#{td[1]}_id"
      execute <<-EOF
        CREATE TABLE public.#{tt} (
          #{c1} integer NOT NULL REFERENCES sivel2_gen_#{t[0]},
          #{c2} integer NOT NULL REFERENCES sivel2_gen_#{t[1]},
          CONSTRAINT "#{t}_pkey1" PRIMARY KEY (#{c1}, #{c2})
        );
        INSERT INTO #{tt} (SELECT  DISTINCT #{c1}, #{c2} FROM #{t});
        DROP TABLE #{t};
        ALTER TABLE #{tt} RENAME TO #{t};
      EOF
    end
  end

  def down
    # Devuelve a situación si llave primaria compuesta (pero ignora marcas de
    # tiempo de algunas tablas que tenían inutilmente)
    LTD.each do |td|
      t = "sivel2_gen_#{td[0]}_#{td[1]}"
      c1= (td[2] == 'id_') ? "id_#{td[0]}" : "#{td[0]}_id"
      c2= (td[3] == 'id_') ? "id_#{td[1]}" : "#{td[1]}_id"
      execute <<-EOF
        ALTER TABLE #{t} DROP CONSTRAINT "#{t}_pkey1";
      EOF
    end
  end

end
