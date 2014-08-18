class RefPais < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE departamento ADD COLUMN id_pais INTEGER REFERENCES pais;
      UPDATE departamento SET id_pais='170';
      ALTER TABLE departamento DROP CONSTRAINT departamento_pkey CASCADE;
      ALTER TABLE departamento ADD CONSTRAINT departamento_pkey 
        PRIMARY KEY(id, id_pais);
    SQL
    execute <<-SQL
      ALTER TABLE municipio ADD COLUMN id_pais INTEGER REFERENCES pais;
      UPDATE municipio SET id_pais='170';
    SQL
    # La siguiente y otras eliminaciones de llaves foraneas tuvieron
    # que eliminarse pues rails dice que no las encuentra --aunque
    # pueden hacerse desde psql (????).  Será que rails ve la
    # base sin llaves foraneas?
#    execute <<-SQL
#      ALTER TABLE municipio 
#        DROP CONSTRAINT "municipio_id_departamento_fkey" CASCADE;
#    SQL
    execute <<-SQL
      ALTER TABLE municipio ADD CONSTRAINT municipio_id_departamento_fkey 
        FOREIGN KEY(id_departamento, id_pais)
        REFERENCES departamento(id, id_pais);
      ALTER TABLE municipio DROP CONSTRAINT municipio_pkey CASCADE;
      ALTER TABLE municipio ADD CONSTRAINT municipio_pkey 
        PRIMARY KEY(id, id_departamento, id_pais);
    SQL
    execute <<-SQL
      ALTER TABLE clase ADD COLUMN id_pais INTEGER REFERENCES pais;
      UPDATE clase SET id_pais='170';
      --ALTER TABLE clase DROP CONSTRAINT clase_id_departamento_fkey CASCADE;
      ALTER TABLE clase ADD CONSTRAINT clase_id_departamento_fkey 
        FOREIGN KEY(id_departamento, id_pais)
        REFERENCES departamento(id, id_pais);
      --ALTER TABLE clase DROP CONSTRAINT clase_id_municipio_fkey CASCADE;
      ALTER TABLE clase ADD CONSTRAINT clase_id_municipio_fkey 
        FOREIGN KEY(id_municipio, id_departamento, id_pais)
        REFERENCES municipio(id, id_departamento, id_pais);
      ALTER TABLE clase DROP CONSTRAINT clase_pkey CASCADE;
      ALTER TABLE clase ADD CONSTRAINT clase_pkey 
        PRIMARY KEY(id, id_municipio, id_departamento, id_pais);
    SQL
    execute <<-SQL
      ALTER TABLE ubicacion ADD COLUMN id_pais INTEGER REFERENCES pais;
      UPDATE ubicacion SET id_pais='170';
      --ALTER TABLE ubicacion DROP CONSTRAINT ubicacion_id_departamento_fkey CASCADE;
      ALTER TABLE ubicacion ADD CONSTRAINT ubicacion_id_departamento_fkey 
        FOREIGN KEY(id_departamento, id_pais)
        REFERENCES departamento(id, id_pais);
      --ALTER TABLE ubicacion DROP CONSTRAINT ubicacion_id_municipio_fkey CASCADE;
      ALTER TABLE ubicacion ADD CONSTRAINT ubicacion_id_municipio_fkey 
        FOREIGN KEY(id_municipio, id_departamento, id_pais)
        REFERENCES municipio(id, id_departamento, id_pais);
      --ALTER TABLE ubicacion DROP CONSTRAINT ubicacion_id_clase_fkey CASCADE;
      ALTER TABLE ubicacion ADD CONSTRAINT ubicacion_id_clase_fkey 
        FOREIGN KEY(id_clase, id_municipio, id_departamento, id_pais)
        REFERENCES clase(id, id_municipio, id_departamento, id_pais);
    SQL
    execute <<-SQL
      ALTER TABLE persona ADD COLUMN id_pais INTEGER REFERENCES pais;
      UPDATE persona SET id_pais='170';
      --ALTER TABLE persona DROP CONSTRAINT persona_id_departamento_fkey CASCADE;
      ALTER TABLE persona ADD CONSTRAINT persona_id_departamento_fkey 
        FOREIGN KEY(id_departamento, id_pais)
        REFERENCES departamento(id, id_pais);
      --ALTER TABLE persona DROP CONSTRAINT persona_id_municipio_fkey CASCADE;
      ALTER TABLE persona ADD CONSTRAINT persona_id_municipio_fkey 
        FOREIGN KEY(id_municipio, id_departamento, id_pais)
        REFERENCES municipio(id, id_departamento, id_pais);
      --ALTER TABLE persona DROP CONSTRAINT persona_id_clase_fkey CASCADE;
      ALTER TABLE persona ADD CONSTRAINT persona_id_clase_fkey 
        FOREIGN KEY(id_clase, id_municipio, id_departamento, id_pais)
        REFERENCES clase(id, id_municipio, id_departamento, id_pais);
    SQL
  end
  def down
    raise ActiveRecord::IrreversibleMigration;
  end
end
