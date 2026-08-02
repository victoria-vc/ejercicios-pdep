module Library where
import PdePreludat

-- 1) Modelado del héroe
data Heroe = Heroe {
  epiteto :: Epiteto,
  reconocimiento :: Reconocimiento,
  artefactos :: [Artefacto],
  tareas :: [Tarea]
}

type Epiteto = String
type Reconocimiento = Number

data Artefacto = Artefacto {
  nombreArtefacto :: String,
  rareza :: Number
}

type Tarea = Heroe -> Heroe

-- 2) Un héroe pasa a la historia
paseALaHistoria :: Heroe -> Heroe
paseALaHistoria heroe
  | reconocimientoMayorA 1000 heroe = cambiarEpiteto "El Mitico" heroe
  | reconocimientoMayorA 500 heroe = cambiarEpiteto "El magnifico" . agregarArtefacto lanzaDelOlimpo $ heroe
  | reconocimientoMayorA 100 heroe = cambiarEpiteto "Hoplita" . agregarArtefacto xiphos $ heroe
  | otherwise = heroe

reconocimientoMayorA :: Reconocimiento -> Heroe -> Bool
reconocimientoMayorA limite = (>limite) . reconocimiento

cambiarEpiteto :: Epiteto -> Heroe -> Heroe
cambiarEpiteto nuevoEpiteto heroe = heroe { epiteto = nuevoEpiteto }

agregarArtefacto :: Artefacto -> Heroe -> Heroe
agregarArtefacto nuevoArtefacto heroe = heroe { artefactos = nuevoArtefacto : artefactos heroe }

lanzaDelOlimpo :: Artefacto
lanzaDelOlimpo = Artefacto "Lanza del Olimpo" 100

xiphos :: Artefacto
xiphos = Artefacto "Xiphos" 50

-- 3) Tareas que realizan los héroes

encontrarUnArtefacto :: Artefacto -> Tarea
encontrarUnArtefacto artefacto = agregarArtefacto artefacto . aumentarReconocimiento (rareza artefacto)

aumentarReconocimiento :: Number -> Heroe -> Heroe
aumentarReconocimiento cantidad heroe = heroe { reconocimiento = (+ cantidad) . reconocimiento $ heroe }

escalarElOlimpo :: Tarea
escalarElOlimpo = agregarArtefacto relampagoDeZeus . aumentarReconocimiento 500 . deshecharArtefactosComunes . afectarArtefactos (*3)

deshecharArtefactosComunes :: Heroe -> Heroe
deshecharArtefactosComunes heroe = heroe { artefactos = filter artefactoComun (artefactos heroe) }

artefactoComun :: Artefacto -> Bool
artefactoComun  = (< 1000) . rareza

afectarArtefactos :: (Number -> Number) -> Heroe -> Heroe
afectarArtefactos f heroe = heroe { artefactos = map (afectarArtefacto f) (artefactos heroe) }

afectarArtefacto :: (Number -> Number) -> Artefacto -> Artefacto
afectarArtefacto f artefacto = artefacto { rareza = f.rareza $ artefacto }

relampagoDeZeus :: Artefacto
relampagoDeZeus = Artefacto "Relámpago de Zeus" 500

ayudarACruzarLaCalle :: Number -> Tarea
ayudarACruzarLaCalle cuadras = cambiarEpiteto (epitetoGroso cuadras)

epitetoGroso :: Number -> Epiteto
epitetoGroso cuadras = "Gros" ++ replicate cuadras 'o'

data Bestia = Bestia {
  nombreBestia :: String,
  debilidad :: Heroe -> Bool
}

matarUnaBestia :: Bestia -> Tarea
matarUnaBestia bestia heroe
  | debilidad bestia heroe = cambiarEpiteto (epitetoDeAsesinoDe bestia) heroe
  | otherwise = huye heroe

epitetoDeAsesinoDe :: Bestia -> Epiteto
epitetoDeAsesinoDe bestia = "El asesino de " ++ nombreBestia bestia

huye :: Heroe -> Heroe
huye = cambiarEpiteto "El Cobarde" . perderPrimerArtefacto

perderPrimerArtefacto :: Heroe -> Heroe
perderPrimerArtefacto heroe = heroe { artefactos = tail . artefactos $ heroe }

-- 4) Modelado de Heracles + 5) tarea "matar al León de Nemea"
heracles = Heroe "Guardian del Olimpo" 700 [pistola, relampagoDeZeus] [matarUnaBestia leonDeNemea]

pistola = Artefacto "Pistola" 1000

leonDeNemea = Bestia "León de Nemea" debilidadLeonNemea

debilidadLeonNemea :: Heroe -> Bool
debilidadLeonNemea = epitetoLargo

epitetoLargo :: Heroe -> Bool
epitetoLargo = (>20).length.epiteto

-- 6) Un héroe realiza una tarea
realizarTarea :: Tarea -> Heroe -> Heroe
realizarTarea tarea = agregarTarea tarea .  tarea

agregarTarea :: Tarea -> Heroe -> Heroe
agregarTarea tarea heroe = heroe { tareas = tarea : tareas heroe }

-- 7) Dos héroes presumen
presumir :: Heroe -> Heroe -> (Heroe,Heroe)
presumir heroe1 heroe2
  | tienenDistintoReconocimiento heroe1 heroe2 = ordenarHeroesPorReconocimiento heroe1 heroe2
  | tienenDistintaRareza heroe1 heroe2 = ordenarHeroesPorRarezaTotal heroe1 heroe2
  | otherwise = presumir (realizarTareas (tareas heroe2) heroe1) (realizarTareas (tareas heroe1) heroe2)

tienenDistintoReconocimiento :: Heroe -> Heroe -> Bool
tienenDistintoReconocimiento heroe1 heroe2 = reconocimiento heroe1 /= reconocimiento heroe2

ordenarHeroesPorReconocimiento :: Heroe -> Heroe -> (Heroe, Heroe)
ordenarHeroesPorReconocimiento heroe1 heroe2
  | reconocimientoMayorA (reconocimiento heroe2) heroe1 = (heroe1, heroe2)
  | otherwise = (heroe2, heroe1)

tienenDistintaRareza :: Heroe -> Heroe -> Bool
tienenDistintaRareza heroe1 heroe2 = rarezaTotal heroe1 /= rarezaTotal heroe2

rarezaTotal :: Heroe -> Number
rarezaTotal = sum . map rareza . artefactos

ordenarHeroesPorRarezaTotal :: Heroe -> Heroe -> (Heroe, Heroe)
ordenarHeroesPorRarezaTotal heroe1 heroe2
  | rarezaTotal heroe1 > rarezaTotal heroe2 = (heroe1, heroe2)
  | otherwise = (heroe2, heroe1)

realizarTareas :: [Tarea] -> Heroe -> Heroe
realizarTareas tareas heroe = foldr realizarTarea heroe tareas

-- 8) Dos heroes con mismo reconocimiento y ningun artefacto van a presumir eternamente,
--      debido a que no hay forma de que uno supere al otro en reconocimiento o rareza.
--      Y Presumir se convierte en un ciclo infinito en el que nunca nada cambia y se comparan
--      los mismos dos Heroes eternamente.

-- 9) Un héroe realiza una labor
type Labor = [Tarea]

realizarLabor :: Labor -> Heroe -> Heroe
realizarLabor = realizarTareas

-- 10) No, debido a que para realizar una labor, se necesitan realizar todas
--      las tareas de la misma obligatoriamente