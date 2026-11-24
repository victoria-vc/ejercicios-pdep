module ParcialTDB where
import PdePreludat

import Data.Char (toUpper, isUpper)

-------------------------------------------------
-- MODELO
-------------------------------------------------

type Nombre = String
type Habilidad = String
type Fuerza = Number
type Objeto = Barbaro -> Barbaro

data Barbaro = UnBarbaro
  { nombre      :: Nombre
  , fuerza      :: Fuerza
  , habilidades :: [Habilidad]
  , objetos :: [Objeto]
  } deriving (Show)


sumarFuerza :: Fuerza -> Barbaro -> Barbaro
sumarFuerza unaFuerza barbaro = barbaro{
  fuerza = (+unaFuerza).fuerza $ barbaro}

modificarFuerza :: (Fuerza -> Fuerza) -> Barbaro -> Barbaro
modificarFuerza modificador barbaro = barbaro{
  fuerza = modificador.fuerza $ barbaro}

fuerzaEspada :: Number -> Number
fuerzaEspada peso = 2 * peso

espada :: Number -> Objeto
espada peso = 
    modificarFuerza (+fuerzaEspada peso)

cerveza :: Objeto
cerveza = sumarFuerza (-15)

amuletosMisticos :: Habilidad -> Objeto
amuletosMisticos = añadirHabilidad

varitasDefectuosas :: Objeto
varitasDefectuosas = eliminarObjetos . añadirHabilidad "hacer magia"

añadirHabilidad :: Habilidad -> Barbaro -> Barbaro
añadirHabilidad unaHabilidad barbaro 
  | tieneHabilidad unaHabilidad barbaro = barbaro
  | otherwise = barbaro{habilidades = unaHabilidad: habilidades barbaro}

eliminarObjetos :: Barbaro -> Barbaro
eliminarObjetos barbaro = barbaro{objetos = []}

ardilla :: Objeto
ardilla = id 

cuerda :: Objeto -> Objeto -> Objeto
cuerda obj1 obj2 = obj1 . obj2 

megafono :: Objeto 
megafono barbaro = barbaro{habilidades = 
  toArray.map toUpper.concat.habilidades $ barbaro}

toArray :: a -> [a]
toArray a = [a]
dave = UnBarbaro "Dave" 100 ["tejer","escribirPoesia"] []

megafonoBarbarico :: Objeto
megafonoBarbarico = cuerda megafono ardilla

type Aventura = [Evento]
type Evento = Barbaro -> Bool

invasionDeSuciosDuendes = 
  tieneHabilidad "Escribir Poesía Atroz"

tieneHabilidad :: Habilidad -> Barbaro -> Bool
tieneHabilidad unaHabilidad = elem unaHabilidad . habilidades

cremalleraDelTiempo :: Evento
cremalleraDelTiempo barbaro = elem (nombre barbaro) barbarosSinPulgares 

cremalleraDelTiempo' :: Evento
cremalleraDelTiempo' (UnBarbaro "Faffy" _ _ _) = True
cremalleraDelTiempo' (UnBarbaro "Astro" _ _ _) = True
cremalleraDelTiempo' _ = False

ritualDeFechorias :: Evento
ritualDeFechorias barbaro = any (sobreviveEvento barbaro) fechorias

fechorias :: [Evento]
fechorias = [saqueo, gritoDeGuerra, caligrafia]

saqueo :: Evento
saqueo barbaro = tieneHabilidad "robar" barbaro && tieneMasDeNFuerza 80 barbaro

tieneMasDeNFuerza :: Fuerza -> Barbaro -> Bool
tieneMasDeNFuerza n = (>= n) . fuerza

gritoDeGuerra :: Evento
gritoDeGuerra barbaro = (>=poderDeGrito barbaro).poderDeObjetos $ barbaro

poderDeObjetos :: Barbaro -> Number
poderDeObjetos = (*4).length.objetos

caligrafia :: Evento 
caligrafia barbaro = habilidadesVocalosa barbaro && habilidadesComienzanConMayuscula barbaro

habilidadesVocalosa :: Barbaro -> Bool
habilidadesVocalosa barbaro = all esHabilidadVocalosa (habilidades barbaro)

esHabilidadVocalosa :: Habilidad -> Bool
esHabilidadVocalosa = (>3).length.filter esVocal

esVocal :: Char -> Bool
esVocal c = elem c vocales

vocales = "aeiouAEIOU"

habilidadesComienzanConMayuscula :: Barbaro -> Bool
habilidadesComienzanConMayuscula barbaro = all comienzaConMayuscula (habilidades barbaro)

comienzaConMayuscula :: Habilidad -> Bool
comienzaConMayuscula habilidad = esUpper (head habilidad)

esUpper :: Char -> Bool
esUpper c = elem c ['A'..'Z']

esUpper' ::Char -> Bool
esUpper' c = (== c) . toUpper $ c

poderDeGrito :: Barbaro -> Number
poderDeGrito = length.concat.habilidades

barbarosSinPulgares = ["Faffy", "Astro"]

sobrevivientes :: [Barbaro] -> Aventura -> [Barbaro]
sobrevivientes barbaros aventura = filter (sobreviveAventura aventura) barbaros

sobreviveAventura :: Aventura -> Barbaro -> Bool
sobreviveAventura aventura barbaro  = all (sobreviveEvento barbaro) aventura

sobreviveEvento :: Barbaro -> Evento -> Bool
sobreviveEvento barbaro evento = evento barbaro