#!/bin/bash
q="";
while read x;
	do
		if [[ -z "$q" ]]
			then
				q=$x;
		else
			echo "INSERT INTO \"sistemaCS_usuario\" (uid, name, password) VALUES ('$q', '$x', '');";
			q="";
		fi;
done < $1;

