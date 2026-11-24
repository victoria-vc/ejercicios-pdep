import wollok.*


class Persona {
    var property nivelFelicidad = 1000
    var property emocionDominante
    const property recuerdosDelDia = []
    const property pensamientosCentrales = #{}
    const property memoriaALargoPlazo = []

    method vivirEvento(){
        const recuerdo = new Recuerdo {
            descripcion = descripcion,
            fecha = new Date(),
            emocion = emocionDominante
        }
        recuerdosdelDia.add(recuerdo)
    }

    method agregarPensamientoCentral(recuerdo){
        pensamientosCentrales.add(recuerdo)
    }

    method bajarFelicidad(porcentaje){
        const nuevoNivel = nivelFelicidad * (1 - porcentaje / 100)
        if (nuevoNivel < 1) {
            throw new DomainException(message = "La felicidad no puede ser menor a 1")
        } 
        nivelFelicidad = nuevoNivel
    }

    method recuerdoRecientes() {
        return recuerdosDelDia.reverse.take(5)
    }

    method todosLosPensamientosCentrales()
        return pensamientosCentrales

    method pensamientosCentralesDificilesDeExplicar() {
        return self.pensamientosCentrales().filter({ recuerdo => recuerdo.esDificilDeExplicar() })
}

    method niega(recuerdo){
        return emocionDominante.niega(recuerdo)
    }



}

class Recuerdo {
    const property fecha
    const property descripcion
    const property emocion

    method asentarsePara(persona){
        emocion.asentarRecuerdo(self, persona)
    }

    method esDificilDeExplicar() {
        return descripcion.words.size() > 10
    }

    method esAlegre() {
        return emocion.esAlegre()
    }

    method contiene(palabra) = descripcion.contains(palabra)
}

object alegria {
    method asentarRecuerdo(recuerdo, persona){
        if(persona.nivelFelicidad() > 500){
            persona.agregarPensamientoCentral(recuerdo)
        }

        method niega(recuerdo) = not recuerdo.esAlegre()
    }

    method esAlegre() = true
} 

object tristeza {
    method asentarRecuerdo(recuerdo, persona){
        persona.agregarPensamientoCentral(recuerdo)
        persona.bajarFelicidad(10)
    }

    method esAlegre() = false

    method niega(recuerdo) = recuerdo.esAlegre()

}

class EmocionNeutra {
    method asentarRecuerdo(recuerdo, persona){}
    method esAlegre() = false
    method niega(recuerdo) = false
}

object disgusto inherits EmocionNeutra {}
object furia inherits EmocionNeutra {}
object temor inherits EmocionNeutra {}

const riley = new Persona(emocionDominante = tristeza,
                fechaNacimiento = new Date(day = 19, month = 1, year = 2004))

object asentamiento {
    method ejecutarEn(persona) {
        persona.asentarRecuerdos(persona.recuerdosDelDia())
    }
}

class AsentamientoSelectivo {
    const palabraClave

    method ejecutarEn(persona) {
        const filtrados = persona.recuerdosDelDia.filter() ({ r => r.contiene(palabraClave)})
        persona.asentarRecuerdos(filtrados)
    }
}

object profundizacion {
    method ejecutarEn(persona) {
        const aProfundizar = persona.recuerdosDelDia().filter({r => not
        persona.esPensamientoCentral(r) and not persona.niega(r)
        })
        persona.enviarAMemoriaALargoPlazo(aProfundizar)
    }
}




