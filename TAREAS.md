* Datos iniciales de tablas básicas: 
 Confilctos: sectorsocial, contexto, profesion

* Verificar si aun hay error cuando se agrega un acto con victima NN y después se quiere autocompletar la víctima.

Las tablas básicas que tengan relaciones has_many, no pueden borrarse 
cuando hay objetos dependientes, puede ser mejor:

1. Si la tabla basica es la principal y a esa se asocian los de otra en
   el formulario de edición de la tabla, (por ejemplo proyectofinanciero 
   tiene muchos proyectos mediante proyecto_proyectofinanciero), antes de 
   borrar el registro de la tabla básica borrar los que se relacionan
   en la tabla combinada.

2. Si la tabla básica es referenciada por otra, no borrar sino presentar
   avisos de error.  Por ejemplo si se quiere borrar un registro de 
   proyectofinanciero y hay actividades que lo tengan es mejor avisar.

Lo segundo se hace por defecto en msip/controllers/admin/basicas_controller.rb
Pero lo primero requiere intervención clase a clase que lo requiera,
ver por ejemplo en motor sivel2_sjr 
app/controllers/sivel2_sjr/ayudasjr_controller.rb

IDEAS

* Validar categorias por ejemplo así:
- Supracategoria A implica Presunto resposanble es del polo estatal
- Mutuamente exclusivas A10 con , A20, A30, B40,...
- Mutuamente exclusivas A20 con A10..D701

* Poner cotejación en espanol en campos nombre, observaciones de tablas
  básicas y en otras con textos en español, ver en 
  db/migrate/20151020203421_agrega_cotejacion.rb

* Eliminar tabla fotra pues ahora se incluyó todo en caso_fotra
* Eliminar campos relacionados con fuentes de anexo_caso pues se pasaron a
  caso_fuenteprensa y caso_fotra
