module Basicos where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero


-- Ejercicio 1
obtenerTiempoViaje :: Number -> Number
obtenerTiempoViaje distancia = distancia * 1.5 / 100


-- Ejercicio 2
obtenerCostoHoras :: Number -> Number
obtenerCostoHoras horas = horasAMinutos horas * 200 + 5000

horasAMinutos :: Number -> Number
horasAMinutos horas = horas * 60


-- Ejercicio 3
obtenerCostoViaje :: Number -> Number
obtenerCostoViaje distancia = (obtenerCostoHoras . obtenerTiempoViaje) distancia


-- Ejercicio 4
longitud :: String -> Number
longitud string = length string


-- Ejercicio 5
par :: Number -> Bool
par numero = even numero


-- Ejercicio 6
impar :: Number -> Bool
impar = odd

imparV2 :: Number -> Bool
imparV2 numero = (negar . par) numero

imparV2V2 :: Number -> Bool
imparV2V2 numero = (.) negar par numero

imparV3 :: Number -> Bool
imparV3 numero = negar . par $ numero


-- Ejercicio 7
pesos :: (algo -> otroAlgo) -> algo -> otroAlgo
pesos funcion parametro = funcion parametro

negar :: Bool -> Bool
negar bool = not bool


-- Ejercicio 8
sumaSiempreDos :: Number -> Number
sumaSiempreDos nro = nro + 2

sumaSiempreDos2 :: Number -> Number
sumaSiempreDos2 nro = (+) nro 2

cinco :: Number
cinco = 5

sumarDos :: Number -> Number
sumarDos numero = numero + 2


-- Ejercicio 9
minimoEntreDosPalabras :: String -> String -> Number
minimoEntreDosPalabras palabra1 palabra2 = min (length palabra1) (length palabra2)


-- Ejercicio 10
palabraEmpiezaConA :: String -> Bool
palabraEmpiezaConA palabra = head palabra == 'A'


-- Ejercicio 11
composicion :: (b -> c) -> (a -> b) -> a -> c
composicion f g x = f (g x)


-- Ejercicio 12, 13 y 14
pesoPino :: Number -> Number
pesoPino altura = pesoBasePino altura + pesoTroncoPino altura

metrosACentimetros :: Number -> Number
metrosACentimetros metros = metros * 100

pesoBasePino :: Number -> Number
pesoBasePino altura = (metrosACentimetros . alturaBase) altura * 3

pesoTroncoPino :: Number -> Number
pesoTroncoPino altura = (metrosACentimetros . alturaTronco) altura * 2

alturaBase :: Number -> Number
alturaBase altura = min altura 3

alturaTronco :: Number -> Number
alturaTronco altura = max (altura - 3) 0