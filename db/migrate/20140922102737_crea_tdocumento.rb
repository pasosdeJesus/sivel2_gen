class CreaTdocumento < ActiveRecord::Migration[4.1]
  def up
    create_table :tdocumento do |t|
      t.string :nombre, limit: 500, null: false
      t.string :sigla, limit:100 
      t.string :formatoregex, limit: 500
      t.date :fechacreacion, null: false
      t.date :fechadeshabilitacion

      t.timestamps
    end
    execute <<-SQL
    INSERT INTO tdocumento(nombre,sigla,formatoregex,fechacreacion) 
        VALUES ('CÉDULA DE CIUDADANÍA', 'CC', '[0-9]*', '2014-09-21');
    INSERT INTO tdocumento(nombre,sigla,formatoregex,fechacreacion) 
        VALUES ('CÉDULA DE IDENTIDAD', 'CI', '[0-9]*', '2014-09-21');
    INSERT INTO tdocumento(nombre,sigla,formatoregex,fechacreacion) 
        VALUES ('CÉDULA DE RESIDENTE', 'CR', '[0-9]*', '2014-09-21');
    INSERT INTO tdocumento(nombre,sigla,formatoregex,fechacreacion) 
        VALUES ('CÉDULA DE TRANSEUNTE', 'CT', '[0-9]*', '2014-09-21');
    INSERT INTO tdocumento(nombre,sigla,formatoregex,fechacreacion) 
        VALUES ('CONTRASEÑA', 'CT', '[0-9]*', '2014-09-21');
    INSERT INTO tdocumento(nombre,sigla,formatoregex,fechacreacion) 
        VALUES ('DOCUMENTO PROVISIONAL', 'DP', '[A-Z]-[-0-9]*', '2014-09-21');
    INSERT INTO tdocumento(nombre,sigla,formatoregex,fechacreacion) 
        VALUES ('OTRO', 'OT', '', '2014-09-21');
    INSERT INTO tdocumento(nombre,sigla,formatoregex,fechacreacion) 
        VALUES ('PARTIDA DE NACIMIENTO', 'PN', '[0-9]*', '2014-09-21');
    INSERT INTO tdocumento(nombre,sigla,formatoregex,fechacreacion) 
        VALUES ('PASAPORTE', 'P', '[0-9]*', '2014-09-21');
    INSERT INTO tdocumento(nombre,sigla,formatoregex,fechacreacion) 
        VALUES ('REGISTRO CIVIL', 'RC', '[0-9]*', '2014-09-21');
    INSERT INTO tdocumento(nombre,sigla,formatoregex,fechacreacion) 
        VALUES ('SIN DOCUMENTO', 'SD', '[0-9]*', '2014-09-21');
    INSERT INTO tdocumento(nombre,sigla,formatoregex,fechacreacion) 
        VALUES ('TARJETA DE IDENTIDAD', 'TI', '[0-9]*', '2014-09-21');
    SQL
  end

  def down
    drop_table :tdocumento
  end
end
