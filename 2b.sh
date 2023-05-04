#!/bin/bash

# Lee el archivo notas.txt y ordena con el comando sort a los alumnos por nota de mayor a menor
cat matriculas.txt | sort -r -k1 > alumnos.txt

# Esta linea de código utiliza awk para sumar todas las notas del archivo alumnos.txt y luego dividir la suma por el número de notas para obtener la media. La media se almacena en la variable $media.
media=$(awk '{sum+=$1} END {print sum/NR}' alumnos.txt)

# Cuenta el número de alumnos dentro del archivo alumnos.txt con el comando wc -1
num_alumnos=$(wc -l < alumnos.txt)

# Calcula la nota de corte en la primera condicion verifica que hay mas de 5 alumnos, si es mayor que 5, imprime la primera columna del quinto alumno
# Si la estructura if no se cumple usa el comando awk como en la anterior para imprimir la primera columna del ultimo alumno
if (( $num_alumnos > 5 )); then
    nota_corte=$(awk '{if(NR==5) print $1}' alumnos.txt)
else
    nota_corte=$(awk '{if(NR=='"$num_alumnos"') print $1}' alumnos.txt)
fi

# Si el primer campo de la línea (la nota) es mayor o igual a la variable nota, entonces imprime el segundo campo de la línea (el apellido)
# Este código utiliza awk para buscar en el archivo alumnos.txt los apellidos de los alumnos cuya nota es igual o superior a la nota de corte, que se almacena en la variable $nota_corte
echo "Nota de corte: $nota_corte"
echo "Alumnos que han superado la nota de corte:"

awk -v nota="$nota_corte" '{if($1 >= nota) print $2}' alumnos.txt

# Mostrar la media de todas las notas
echo "Media de todas las notas: $media"



