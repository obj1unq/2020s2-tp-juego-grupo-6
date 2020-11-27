import wollok.game.*
import paredes.*
import enemigos.*
import misiones.*
import nave.*
import personajes.*
import direcciones.*


object player inherits Personajes{

	var property vida = 100
	var property position = game.origin()
	var property image = "idle.png"
	const property direcciones = [arriba, abajo, izquierda, derecha]
	

	// Movimientos
	method irASiSeMantieneEnLaPantalla(nuevaPosicion) {
		if (self.estaDentroDeLaPantalla(nuevaPosicion)) {
			self.irA(nuevaPosicion)
		}
	}

	method irA(nuevaPosicion) {
		// Precondiciones
		self.validarParaMoverse(nuevaPosicion)
			// Acción
		if (not self.paredColisionada(nuevaPosicion)) position = nuevaPosicion
	// Postcondiciones
	// self.checkearSiTerminoElJuego()
	}

	method validarParaMoverse(nuevaPosicion) {
		if (not self.estaDentroDeLaPantalla(nuevaPosicion)) {
			self.error("No me puedo salir de la pantalla")
		}
	}


	override method esAtacado() {
		vida -= 10
		vida = vida.max(0)
		if (vida == 0) {
			// implementar dejar de moverse con las teclas si muere (quedarse quieto en el lugar)
			self.image("dead.png")
			self.perder()
		}
	}

	override method atacar(tripulante) {
		tripulante.esAtacado()
		nave.removerTripulante(tripulante)
	}

	method tripulanteColosionado() {
		const tripulantes = nave.enemigosRestantes().filter({ tripulante => self.esVecino(tripulante, self.position()) })
		if (tripulantes.isEmpty()) {
			self.error("No hay un tripulante")
		}
		return tripulantes.head()
	}

	method esVecino(tripulante, posicion) {
		return tripulante.position().distance(posicion) < 2
	}

	method perder() {
		if (self.vida() == 0) game.say(self, "Derrota")
		self.finalizarJuego()
	}

	method ganar() {
		game.say(self, "Victoria")
		self.finalizarJuego()
	}

	method finalizarJuego() {
		game.schedule(3000, { game.stop()})
	}
	
	method realizarAccion() {
		if (self.hayMisionCerca()) {
			self.sabotear()
		} else {
			self.atacar(self.tripulanteColosionado())
		} 
	}

	method sabotear() {
		self.getMisionCercana().serSaboteada()
		
	}
 
	method hayMisionCerca(){
		return nave.sabotajesRestantes().any({mision=> mision.esMisionCercana()})
	}
	
	method getMisionCercana(){
		return nave.sabotajesRestantes().filter({mision=> mision.esMisionCercana()}).anyOne()
	}
	
	
}