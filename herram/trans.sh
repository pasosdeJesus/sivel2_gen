sn=""
f=`find . -name "*rb"`;
rm -rf /tmp/tr
for i in $f; do
	echo -n $i
	n=`echo $i | sed -f herram/trans.sed`;
	echo " -> $n"
	b=`dirname $n`;
	mkdir -p /tmp/tr/$b
	rm -f /tmp/tr/$n
	sed -f herram/trans.sed $i > /tmp/tr/$n
	diff $i /tmp/tr/$n
	if (test "$?" != "0") then {
		if (test "$sn" != "S") then {
			echo "Remplaza? (s/n): "
			read sn
		} fi;
		if (test "$sn" = "s" -o "$sn" = "S") then {
			cp /tmp/tr/$n $i
		} fi;
	} fi;
done;
