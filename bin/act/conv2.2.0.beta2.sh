#!/bin/sh
# Convierte de sivel2_gen 2.2.0.beta1 a 2.2.0.beta2

for i in `git ls-tree -r main --name-only`; do
  excluye=0
  if (test "$i" == "-") then {
    excluye=1;
  } else {
    for j in db/migrate node_modules db/structure.sql bin/act; do 
      echo $i | grep "$j" > /dev/null 2>&1
      if (test "$?" = "0") then {
        excluye=1;
      } fi;
    done;
  } fi;
  if (test "$excluye" == "1") then {
    echo "Excluyendo de conversión $i";
  } else {
    n=$i
    antn="";

    for j in id_anexo:anexo_id id_antecedente:antecedente_id id_caso:caso_id\
      id_caso_presponsable:caso_presponsable_id id_categoria:categoria_id\
      id_combatiente:combatiente_id id_contexto:contexto_id\
      id_etiqueta:etiqueta_id id_etnia:etnia_id id_filiacion:filiacion_id\
      id_fotra:fotra_id id_frontera:frontera_id id_grupoper:grupoper_id\
      id_iglesia:iglesia_id id_intervalo:intervalo_id\
      id_organizacion:organizacion_id id_p_responsable:presponsable_id\
      id_pconsolidado:pconsolidado_id id_persona:persona_id\
      id_presponsable:presponsable_id id_profesion:profesion_id\
      id_rangoedad:rangoedad_id id_region:region_id\
      id_resagresion:resagresion_id id_sectorsocial:sectorsocial_id\
      id_tviolencia:tviolencia_id id_usuario:usuario_id id_victima:victima_id\
      id_vinculoestado:vinculoestado_id; do
      antes=`echo $j | sed -e 's/:.*//g'`;
      despues=`echo $j | sed -e 's/.*://g'`;
      grep "$antes" $n > /dev/null;
      if (test "$?" = "0") then {
        if (test "$antn" != "$n") then {
          echo "";
          echo -n "Remplazando en $n: ";
          antn=$n
        } fi;
        echo -n " $antes"
        sed -i -e "s/$antes/$despues/g" $n;
      } fi;
    done;
  } fi;
done;
echo "";
