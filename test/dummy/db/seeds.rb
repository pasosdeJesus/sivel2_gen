
conexion = ActiveRecord::Base.connection();

Msip::carga_semillas_sql(conexion, 'msip', :datos)
Msip::carga_semillas_sql(conexion, '../..', :cambios)
Msip::carga_semillas_sql(conexion, '../..', :datos)

# usuario sivel2 con clave sivel2
conexion.execute("INSERT INTO public.usuario 
  (nusuario, nombre, email, encrypted_password, password, 
  fechacreacion, created_at, updated_at, rol) 
  VALUES ('sivel2', 'sivel2', 'sivel2@localhost', 
  '$2a$10$V2zgaN1ED44UyLy0ubey/.1erdjHYJusmPZnXLyIaHUpJKIATC1nG', 
  '', '2014-08-26', '2014-08-26', '2014-08-26', 1);")

