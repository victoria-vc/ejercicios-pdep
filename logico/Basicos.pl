% Base de conocimientos: Relaciones Familiares
progenitor(homero, bart).
progenitor(homero, lisa).
progenitor(homero, maggie).
progenitor(marge, bart).
progenitor(marge, lisa).
progenitor(marge, maggie).
progenitor(abe, homero).
progenitor(mona, homero).
progenitor(jacqueline, marge).
progenitor(clancy, marge).
progenitor(abe, herb).


% Ejercicio 1
abuelo(Abuelo, Nieto) :-
    progenitor(Abuelo, Padre),
    progenitor(Padre, Nieto).


% Ejercicio 2
hermano(Persona1, Persona2) :-
    progenitor(Progenitor, Persona1),
    progenitor(Progenitor, Persona2),
    Persona1 \= Persona2.


% Ejercicio 3
tio(Tio, Sobrino) :-
    hermano(Tio, Progenitor),
    progenitor(Progenitor, Sobrino).

% Base de conocimientos: Viajes y Tarifas
% tramo(Origen, Destino, DistanciaKm).
tramo(retiro, pilar, 55).
tramo(retiro, lujan, 70).
tramo(retiro, marDelPlata, 400).
tramo(pilar, salto, 130).


% Ejercicio 4
tiempoViaje(Origen, Destino, TiempoHoras) :-
    tramo(Origen, Destino, Distancia),
    TiempoHoras is Distancia * 1.5 / 100.


% Ejercicio 5
costoViaje(Origen, Destino, Costo) :-
    tiempoViaje(Origen, Destino, Horas),
    horasAMinutos(Horas, Minutos),
    Costo is Minutos * 200 + 5000.

horasAMinutos(Horas, Minutos) :-
    Minutos is Horas * 60.


% Ejercicio 6
viajeEconomico(Origen, Destino) :-
    costoViaje(Origen, Destino, Costo),
    Costo < 15000.


% Base de conocimientos: Cursada y Aprobación
estudiante(victoria).
estudiante(juan).
estudiante(sofia).

materia(paradigmas).
materia(sintaxis).
materia(sistemasOperativos).

aprobo(victoria, paradigmas, 9).
aprobo(victoria, sintaxis, 8).
aprobo(victoria, sistemasOperativos, 10).
aprobo(juan, paradigmas, 6).
aprobo(juan, sintaxis, 7).
aprobo(sofia, paradigmas, 9).


% Ejercicio 7
debeMateria(Estudiante, Materia) :-
    estudiante(Estudiante),
    materia(Materia),
    not(aprobo(Estudiante, Materia, _)).


% Ejercicio 8
estaAlDia(Estudiante) :-
    estudiante(Estudiante),
    forall(materia(Materia), aprobo(Estudiante, Materia, _)).


% Ejercicio 9
promocionoTodo(Estudiante) :-
    estaAlDia(Estudiante),
    forall(aprobo(Estudiante, _, Nota), Nota >= 8).



% Base de conocimientos: Plantación de Pinos
% pino(Id, AlturaMetros).
pino(pino1, 2).
pino(pino2, 3).
pino(pino3, 4).
pino(pino4, 5).


% Ejercicio 10, 11 y 12
pesoPino(Pino, Peso) :-
    pino(Pino, Altura),
    pesoBasePino(Altura, PesoBase),
    pesoTroncoPino(Altura, PesoTronco),
    Peso is PesoBase + PesoTronco.

metrosACentimetros(Metros, Centimetros) :-
    Centimetros is Metros * 100.

pesoBasePino(Altura, PesoBase) :-
    AlturaBase is min(Altura, 3),
    metrosACentimetros(AlturaBase, CmBase),
    PesoBase is CmBase * 3.

pesoTroncoPino(Altura, PesoTronco) :-
    AlturaTronco is max(Altura - 3, 0),
    metrosACentimetros(AlturaTronco, CmTronco),
    PesoTronco is CmTronco * 2.

esPesoUtil(Peso) :-
    Peso >= 400,
    Peso =< 1000.

sirvePino(Pino) :-
    pesoPino(Pino, Peso),
    esPesoUtil(Peso).

pesoTotalUtil(PesoTotal) :-
    findall(Peso, (sirvePino(Pino), pesoPino(Pino, Peso)), Pesos),
    sum_list(Pesos, PesoTotal).