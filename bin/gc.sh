
#!/bin/sh
# Revisa errore comunes, ejecuta pruebas de regresión y del sistema y envia a github 

function cableado {
	for n in $*; do 
		echo "Revisando $n"
		grep "^ *gem *.${n}.*, *path:" Gemfile > /dev/null 2> /dev/null
		if (test "$?" = "0") then {
			echo "Gemfile incluye un ${n} cableado al sistema de archivos"
			exit 1;
		} fi;
	done
}

d=`grep "gem.*pasosdeJesus" Gemfile | sed -e "s/.*gem ['\"]//g;s/['\"].*//g"`
#cableado $d

grep "^ *gem *.debugger*" Gemfile > /dev/null 2> /dev/null
if (test "$?" = "0") then {
	echo "Gemfile incluye debugger"
	exit 1;
} fi;
grep "^ *gem *.byebug*" Gemfile > /dev/null 2> /dev/null
if (test "$?" = "0") then {
	echo "Gemfile incluye byebug que rbx de travis-ci no quiere"
	exit 1;
} fi;

if (test "$SINAC" != "1") then {
	NOKOGIRI_USE_SYSTEM_LIBRARIES=1 MAKE=gmake make=gmake QMAKE=qmake4 bundle update
	if (test "$?" != "0") then {
		exit 1;
	} fi;
	(cd test/dummy; CXX=c++ yarn upgrade)
	if (test "$?" != "0") then {
		exit 1;
	} fi;
} fi;

if (test "$SININS" != "1") then {
	NOKOGIRI_USE_SYSTEM_LIBRARIES=1 MAKE=gmake make=gmake QMAKE=qmake4 bundle install
	if (test "$?" != "0") then {
		exit 1;
	} fi;
} fi;

if (test "$SINMIG" != "1") then {
	(cd test/dummy; bin/rails db:migrate sip:indices db:schema:dump)
	if (test "$?" != "0") then {
		exit 1;
	} fi;
} fi;

(cd test/dummy; RAILS_ENV=test bin/rails db:drop db:create db:setup db:migrate sip:indices; echo "####BASE DE PRUEBA RE-CREADA"; )
if (test "$?" != "0") then {
	echo "No puede preparse base de prueba";
	exit 1;
} fi;

RAILS_ENV=test CONFIG_HOSTS=www.example.com bin/rails test
if (test "$?" != "0") then {
	echo "No pasaron pruebas de regresion";
	exit 1;
} fi;

for i in test/integration/*rb; do 
	CONFIG_HOSTS=www.example.com bin/rails test $i; 
	if (test "$?" != "0") then {
		echo "No paso prueba de intregacion $i";
		exit 1;
	} fi;
done;

(cd test/dummy; RAILS_ENV=test bin/rails db:schema:dump)

b=`git branch | grep "^*" | sed -e  "s/^* //g"`
git status -s
if (test "$MENSCONS" = "") then {
	MENSCONS="Actualiza"
} fi;
git commit -m "$MENSCONS" -a
git push origin ${b}
if (test "$?" != "0") then {
	echo "No pudo subirse el cambio a github";
	exit 1;
} fi;

