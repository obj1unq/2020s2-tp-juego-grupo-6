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
	method irASiSeMantieneEnLaPantalla(direccion) {
		const nuevaPosicion = direccion.siguiente(self.position())
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


	 method esAtacado() {
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
	}

	method tripulanteColosionado() {
		const tripulantes = nave.accionesRestantes().filter({ elemento => self.esVecino(elemento, self.position()) })
		if (tripulantes.isEmpty()) {
			self.error("No hay accion a realizar")
		}
		return tripulantes.head()
	}

	method esVecino(elemento, posicion) {
		return elemento.position().distance(posicion) < 2
	}

	method perder() {
		game.say(self, "Derrota")
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
		if (self.hayAccionCerca()) {
			self.accionar()
		} else {
			self.error("No hay accion a realizar")
		} 
	}

	method accionar() {
		self.getAccionCercana().serRealizada()
		
	}
 
	method hayAccionCerca(){
		return nave.accionesRestantes().any({elemento=> elemento.esVecino(elemento, self.position())})
	}
	
	method getAccionCercana(){
		return nave.accionesRestantes().filter({elemento=> elemento.esVecino(elemento, self.position())}).anyOne()
	}
	
	
}