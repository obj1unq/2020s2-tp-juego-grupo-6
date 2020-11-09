import wollok.game.*
import paredes.*
import enemigos.*
import misiones.*
import nave.*

object player {

	var property vida = 100
	var property position = game.origin()
	var property image = "idle.png"

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

	method estaDentroDeLaPantalla(nuevaPosicion) {
		return nuevaPosicion.x().between(0, game.width() - 1) and nuevaPosicion.y().between(0, game.height() - 1)
	}

	method esAtacado(danio) {
		vida -= 10
		vida = vida.max(0)
		if (vida == 0) {
			// implementar dejar de moverse con las teclas si muere (quedarse quieto en el lugar)
			self.image("dead.png")
			self.perder()
		}
	}

	method atacar(tripulante) {
		tripulante.esAsesinado()
		nave.enemigosRestantes().remove(tripulante)
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

	method paredColisionada(nuevaPosicion) {
		const paredes = game.getObjectsIn(nuevaPosicion)
		return paredes.any({ pared => not pared.teDejaPasar() })
	}

	method teDejaPasar() {
		return true
	}

	method sabotear() {
		if (self.hayMisionCerca()) {
			self.getMisionCerca().serSaboteada()
		} else {
			self.error("No hay una mision")
		}
	}

	method hayMisionCerca() {
		return self.existeMisionArriba() or self.existeMisionAbajo() or self.existeMisionDerecha() or self.existeMisionIzquierda() or self.existeUnaMision()
	}

	method estoySobreUnaMision() {
		return game.uniqueCollider(self)
	}

	method getMisionCerca() {
		if (self.existeMisionArriba()) {
			return self.getMisionArriba()
		} else if (self.existeMisionAbajo()) {
			return self.getMisionAbajo()
		} else if (self.existeMisionDerecha()) {
			return self.getMisionDerecha()
		} else if (self.existeMisionIzquierda()) {
			return self.getMisionIzquierda()
		} else {
			return self.estoySobreUnaMision()
		}
	}

	method existeUnaMision() {
		return game.getObjectsIn(self.position()).any(self.dameLaMision())
	}

	method existeMisionArriba() {
		return game.getObjectsIn(self.posicionSuperior()).any(self.dameLaMision())
	}

	method existeMisionAbajo() {
		return game.getObjectsIn(self.posicionInferior()).any(self.dameLaMision())
	}

	method existeMisionDerecha() {
		return game.getObjectsIn(self.posicionALaDerecha()).any(self.dameLaMision())
	}

	method existeMisionIzquierda() {
		return game.getObjectsIn(self.posicionALaIzquierda()).any(self.dameLaMision())
	}

	method getMisionArriba() {
		return game.getObjectsIn(self.posicionSuperior()).find(self.dameLaMision())
	}

	method getMisionAbajo() {
		return game.getObjectsIn(self.posicionInferior()).find(self.dameLaMision())
	}

	method getMisionDerecha() {
		return game.getObjectsIn(self.posicionALaDerecha()).find(self.dameLaMision())
	}

	method getMisionIzquierda() {
		return game.getObjectsIn(self.posicionALaIzquierda()).find(self.dameLaMision())
	}

	method dameLaMision() {
		return { i => i.image() == "passwordCodeDefault.png" or i.image() == "cablesDefault.png" or i.image() == "escotilla.png" or i.image() == "MedBay.png" }
	}

	method posicionSuperior() {
		return self.position().up(1)
	}

	method posicionInferior() {
		return self.position().down(1)
	}

	method posicionALaDerecha() {
		return self.position().right(1)
	}

	method posicionALaIzquierda() {
		return self.position().left(1)
	}

	method saboteaOAsesina() {
		if (self.hayMisionCerca()) {
			self.sabotear()
		} else {
			self.atacar(self.tripulanteColosionado())
		}
	}

}

