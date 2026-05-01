module Spec where
import PdePreludat
import Basicos
import EjercicioLOH
import ParcialTDB
import Test.Hspec


{- correrTests :: IO ()
correrTests = hspec $ do
  describe "Test de ejemplo" $ do
    it "El pdepreludat se instaló correctamente" $ do
      doble 1 `shouldBe` 2  -}

-------------------------------- Ejercicio League of Haskell --------------------------------

{- campeonNuevo :: Campeon
campeonNuevo = UnCampeon 0 8 TOP ["Ruptura", "Grito salvaje", "Clavos vorpalinos", "Festín"]

correrTests :: IO ()
correrTests = hspec $ do
  describe "Campeon" $ do
    describe "estaEnEarly" $ do
      it "cuando recibe un campeon con nivel 6 deberia dar false" $ do
        estaEnEarly (setNivel 6 chogat) `shouldBe` False
      it "cuando recibe un campeon con nivel 5 deberia dar true" $ do
        estaEnEarly (subirNivel jinx) `shouldBe` True
    describe "estaRoto" $ do
      it "cuando recibe un personaje con antiguedad 0 deberia dar true" $ do
        estaRoto campeonNuevo `shouldBe` True
  describe "Equipo" $ do
    describe "puedeGanar" $ do
      it "cuando recibe un equipo con un TOP devuelve True" $ do
        puedeGanar [chogat] `shouldBe` True -}

-------------------------------- Ejercicio League of Haskell --------------------------------


---------------------------- Parcial Funcional Tierra de Barbaros ---------------------------

correrTests :: IO ()
correrTests = hspec $ do
  describe "Barbaro" $ do
    describe "ardilla" $ do
      it "cuando recibe un barbaro me devuelve el mismo barbaro" $ do
        (nombre (ardilla dave)) `shouldBe` (nombre dave) 

---------------------------- Parcial Funcional Tierra de Barbaros ---------------------------