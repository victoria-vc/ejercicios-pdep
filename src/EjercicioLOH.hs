
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-} 
{-# HLINT ignore "Eta reduce" #-}

module EjercicioLOH where
import PdePreludat

data Campeon = UnCampeon {
    antiguedad :: Antiguedad,
    nivel :: Nivel,
    posicion :: Posicion,
    habilidades :: Habilidades
} deriving (Show,Eq)

data Posicion = JG | TOP | ADC | SUPP | MID deriving (Show,Eq)

type Antiguedad = Number
type Nivel = Number
type Habilidades = [Habilidad]
type Habilidad = String

chogat :: Campeon
chogat = UnCampeon 16 8 TOP ["Ruptura", "Grito salvaje", "Clavos vorpalinos", "Festín"]

jinx :: Campeon 
jinx = UnCampeon 12 4 ADC ["¡Cambio de armas!", "¡Chispas!", "¡Mascafuegos!", "¡¡Supermegacohete requetemortal!!"]

estaRoto :: Campeon -> Bool
estaRoto campeon = antiguedad campeon == 0

estaRoto' :: Campeon -> Bool
estaRoto' = (==0) . antiguedad

modificarNivel :: (Nivel -> Nivel ) -> Campeon -> Campeon
modificarNivel modificador campeon = campeon{nivel = modificador . nivel $ campeon}

setNivel :: Nivel -> Campeon -> Campeon
setNivel unNivel campeon = campeon{nivel = unNivel}

subirNivel :: Campeon -> Campeon
subirNivel campeon = modificarNivel (+1) campeon

type Equipo = [Campeon]

estaPreparado :: Equipo -> Bool
estaPreparado equipo = ((==5).length) equipo

habilidadesDisponibles :: Campeon -> Habilidades
habilidadesDisponibles campeon
    | estaEnEarly campeon = habilidadesEarly campeon  
    | otherwise = habilidades campeon

estaEnEarly :: Campeon -> Bool
estaEnEarly campeon = (<6) . nivel $ campeon 


habilidadesEarly :: Campeon -> Habilidades
habilidadesEarly campeon = (take 3 . habilidades) campeon

puedeCarrear :: Campeon -> Bool
puedeCarrear campeon = estaRoto campeon || esRolCarry campeon

esRolCarry :: Campeon -> Bool
esRolCarry campeon = elem (posicion campeon) rolesCarry

esRolCarry' :: Campeon -> Bool
esRolCarry' campeon = perteneceARoles rolesCarry . posicion $ campeon

esRolCarry'' :: Campeon -> Bool
esRolCarry'' campeon = flip elem rolesCarry . posicion $ campeon

perteneceARoles :: [Posicion] -> Posicion -> Bool
perteneceARoles roles rol = elem rol roles

rolesCarry :: [Posicion]
rolesCarry = [MID, TOP, ADC]

-- Decimos que un equipo puede ganar la partida, 
-- si al menos uno del mismo puede carrear la misma.

puedeGanar :: Equipo -> Bool
puedeGanar equipo = any puedeCarrear equipo 

esInvencible :: Equipo -> Bool
esInvencible equipo = all estaRoto equipo

estanAptosTF :: Equipo -> Equipo 
estanAptosTF equipo = filter (not.estaEnEarly) equipo 

hacerBaron :: Equipo -> Equipo
hacerBaron equipo = map subirNivel equipo

type Daño = Number
dañoNivel :: Campeon -> Daño
dañoNivel campeon = ((*3). nivel) campeon

dañoHabilidades :: Campeon -> Daño
dañoHabilidades campeon = sum . map length . habilidades $ campeon

dañoHabilidades' :: Campeon -> Daño
dañoHabilidades' campeon =  length . concat . habilidades $ campeon

dañoPorPosicion :: Campeon -> Daño
dañoPorPosicion (UnCampeon _ _ TOP _ ) = 10
dañoPorPosicion (UnCampeon _ _ MID _ ) = 15
dañoPorPosicion (UnCampeon _ _ ADC _ ) = 20
dañoPorPosicion (UnCampeon _ _ JG _ ) = 8
dañoPorPosicion (UnCampeon _ _ SUPP _ ) = 1

type CalculadorDaño = Campeon -> Daño
haceMasDaño :: CalculadorDaño ->  Campeon -> Campeon -> Campeon
haceMasDaño criterio campeonA campeonB
    | criterio campeonA > criterio campeonB = campeonA
    | otherwise = campeonB