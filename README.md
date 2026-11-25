# Ejercicios de Haskell
(Hasta el 14 son de la clase)
## Ejercicio 1: Tiempo de viaje

Una combi tarda 1.5 horas en recorrer 100 km.

Dada una distancia, obtener el tiempo del viaje.

---

## Ejercicio 2: Costo por tiempo

El costo de un viaje es:
- $5000 base
- $200 por minuto

Dada una cantidad de horas, obtener el costo de un viaje.

---

## Ejercicio 3: Costo por distancia

Teniendo en cuenta que:
- La combi tarda 1.5 horas cada 100 km
- El costo es $5000 base + $200 por minuto

Obtener el costo de un viaje dada una distancia.

---

## Ejercicio 4: Longitud de un string

Dado un String, obtener su longitud.

---

## Ejercicio 5: Número par

Dado un número, indicar si es par.

---

## Ejercicio 6: Número impar

Dado un número, indicar si es impar.

---

## Ejercicio 7: Aplicar función

Definir una función que:
- reciba una función
- reciba un valor

y aplique la función al valor.

---

## Ejercicio 8: Sumar dos

Definir una función que sume 2 a un número.

---

## Ejercicio 9: Palabra más corta

Dadas dos palabras, devolver la longitud de la palabra más corta.

---

## Ejercicio 10: Empieza con A

Dada una palabra, indicar si empieza con la letra 'A'.

---

## Ejercicio 11: Composición de funciones

Definir la función de composición:

(f . g)(x) = f(g(x))

---

## Ejercicio 12: Peso de un pino

En una plantación de pinos:

- Cada árbol tiene una altura en metros
- El peso se calcula así:
  - 3 kg por cada centímetro hasta 3 metros
  - 2 kg por cada centímetro por encima de 3 metros

Definir la función `pesoPino`, que recibe la altura y devuelve el peso.

---

## Ejercicio 13: Peso útil

Una fábrica de muebles acepta árboles que pesen entre:

- 400 kg y 1000 kg

Definir la función `esPesoUtil`, que indique si un peso es útil.

---

## Ejercicio 14: Pino útil

Definir la función `sirvePino`, que:
- recibe la altura de un pino
- indica si sirve para la fábrica

---

## Ejercicio "League of Haskell"
[Enunciado](./assets/Ejercicio-LeagueOfHaskell.pdf)

---

## Parcial Funcional "Tierra de Barbaros"
[Enunciado](./assets/Parcial-Funcional-Tierra-de-Barbaros.pdf)

---


## Parcial Funcional (tomado 01/06/26) "Héroes de Leyenda"
[Enunciado](./assets/Parcial-Funcional-Héroes-de-Leyenda.pdf)

---

# Ejercicios de Prolog

## Ejercicio 1: Progenitores y abuelos

Dada una base de conocimientos con `progenitor(Progenitor, Hijo)`, definir el predicado `abuelo/2` que relacione a un abuelo o abuela con su nieto o nieta.

---

## Ejercicio 2: Hermanos

Definir el predicado `hermano/2` que relacione a dos personas distintas que comparten al menos un progenitor.

---

## Ejercicio 3: Tíos

Definir el predicado `tio/2` que relacione a una persona con su sobrino o sobrina (es decir, es hermano o hermana de alguno de sus progenitores).

---

## Ejercicio 4: Tiempo de viaje

Sabiendo los tramos disponibles `tramo(Origen, Destino, DistanciaKm)` y que una combi tarda 1.5 horas en recorrer 100 km:

Definir el predicado inversible `tiempoViaje/3` que relacione un origen, un destino y el tiempo del viaje en horas.

---

## Ejercicio 5: Costo de viaje

El costo de un viaje es:
- $5000 base
- $200 por minuto

Definir el predicado inversible `costoViaje/3` que relacione un origen, un destino y el costo total del viaje.

---

## Ejercicio 6: Viaje económico

Definir el predicado inversible `viajeEconomico/2` que relacione un origen y un destino cuyo costo de viaje sea menor a $15000.

---

## Ejercicio 7: Materias sin aprobar

Dada una base de conocimientos con `estudiante/1`, `materia/1` y `aprobo(Estudiante, Materia, Nota)`:

Definir el predicado inversible `debeMateria/2` que relacione a un estudiante con las materias que todavía no aprobó.

---

## Ejercicio 8: Estudiante al día

Definir el predicado inversible `estaAlDia/1` que se cumpla para un estudiante si aprobó todas las materias existentes.

---

## Ejercicio 9: Promoción

Definir el predicado inversible `promocionoTodo/1` que se cumpla si un estudiante aprobó todas las materias y en todas obtuvo una nota mayor o igual a 8.

---

## Ejercicio 10: Peso de un pino

En una plantación de pinos representada mediante `pino(Id, AlturaMetros)`:
- El peso se calcula así:
  - 3 kg por cada centímetro hasta 3 metros
  - 2 kg por cada centímetro por encima de 3 metros

Definir el predicado inversible `pesoPino/2` que relacione cada pino con su peso.

---

## Ejercicio 11: Pino útil

Una fábrica de muebles acepta árboles que pesen entre:
- 400 kg y 1000 kg

Definir los predicados `esPesoUtil/1` y `sirvePino/1` (inversible) que indiquen si un peso es útil y si un pino sirve para la fábrica.

---

## Ejercicio 12: Peso total útil

Definir el predicado `pesoTotalUtil/1` que relacione el peso total resultante de sumar los pesos de todos los pinos que sirven para la fábrica.

---

## Parcial Lógico "Guerrero Ninja Argento"
[Enunciado](..assets/Parcial-Logico-Guerrero.pdf)

# Ejercicios de Wollok

## Parcial Objetos "Intensamente"
[Enunciado](./assets/Parcial-Objetos-Intensamente.pdf)