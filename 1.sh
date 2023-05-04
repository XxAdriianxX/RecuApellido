#!/bin/bash

viajes=$1

# Esta linea de codigo verifica si la variable $viajes esta vacia con el comando -z.
if [[ -z "$viajes" ]]; then
    echo "Debes especificar el número de viajes"
    exit 1
fi
# Esta linea de codigo verifica que el numero de viajes introducido no es menor que 1 en caso de ser menor que 1 nos saldria el mensaje por pantalla.
if (( $viajes < 1 )); then
    echo "El número de viajes debe ser mayor que cero"
    exit 1
fi

# En esta linea de codigo es donde se ejecuta la condicion y elije que tipo de abono es mejor dependiendo de los viajes.
if (( $viajes == 1 )); then
    echo "La mejor tarifa es de 5€ por viaje"
elif (( $viajes < 6 )); then
    echo "La mejor tarifa es de 9€ + 1€ por viaje"
else
    echo "La mejor tarifa es de 18€ pago fijo"
fi






