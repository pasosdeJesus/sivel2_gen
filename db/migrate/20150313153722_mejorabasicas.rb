class Mejorabasicas < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
    UPDATE sivel2_gen_filiacion SET nombre='CÍVICO POLÍTICA ELECTORAL' where nombre LIKE 'CIVICO%' AND id='8';
    UPDATE sivel2_gen_profesion SET nombre='TECNÓLOGO/A' where nombre='TECNOLOGO';
    UPDATE sivel2_gen_profesion SET nombre='ODONTÓLOGO/A' where nombre='ODONTOLOGO';
    UPDATE sivel2_gen_profesion SET nombre='SOCIÓLOGO/A' where nombre='SOCIOLOGO';
    UPDATE sivel2_gen_profesion SET nombre='ABOGADO/A' where nombre='ABOGADO';
    UPDATE sivel2_gen_profesion SET nombre='RELIGIOSO/A' where nombre='RELIGIOSO';
    UPDATE sivel2_gen_profesion SET nombre='AGRICULTOR/A' where nombre='AGRICULTOR';
    UPDATE sivel2_gen_profesion SET nombre='INVESTIGADOR/A SOCIAL' where nombre='INVESTIGADOR SOCIAL';
    UPDATE sivel2_gen_profesion SET nombre='ANTROPÓLOGO/A' where nombre='ANTROPOLOGO';
    UPDATE sivel2_gen_profesion SET nombre='CONTADOR PÚBLICO/A' where nombre='CONTADOR PUBLICO';
    UPDATE sivel2_gen_profesion SET nombre='TRABAJADOR/A SOCIAL' where nombre='TRABAJADOR SOCIAL';
    UPDATE sivel2_gen_profesion SET nombre='EDUCADOR/A' where nombre='EDUCADOR';
    UPDATE sivel2_gen_profesion SET nombre='ADMINISTRADOR PÚBLICO/A' where nombre='ADMINISTRADOR PUBLICO';
    UPDATE sivel2_gen_profesion SET nombre='MÉDICO/A' where nombre='MEDICO';
    UPDATE sivel2_gen_profesion SET nombre='ENFERMERO/A' where nombre='ENFERMERO (A)'; 
    UPDATE sivel2_gen_profesion SET nombre='DEFENSOR/A DE DDHH' where nombre='DEFENSOR DE DDHH'; 
    UPDATE sivel2_gen_profesion SET nombre='INGENIERO/A' where nombre='INGENIERO'; 
    SQL
  end
  def down
  end
end
