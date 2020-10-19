import wollok.game.*

object player {
	
	var property vida = 100
	var property position = game.center()
	var property image = "idle.png"
	
	//Movimientos
	method irASiSeMantieneEnLaPantalla(nuevaPosicion) {
		if (self.estaDentroDeLaPantalla(nuevaPosicion)) {
			self.irA(nuevaPosicion)
		}
	}
	
	method irA(nuevaPosicion) {
		// Precondiciones
		self.validarParaMoverse(nuevaPosicion)
		// Acción
		position = nuevaPosicion
		// Postcondiciones
		//self.checkearSiTerminoElJuego()
	}
	
	method validarParaMoverse(nuevaPosicion) {
		if (not self.estaDentroDeLaPantalla(nuevaPosicion)) {
			self.error("No me puedo salir de la pantalla")
		}
	}
	
	method estaDentroDeLaPantalla(nuevaPosicion) {
		return 	nuevaPosicion.x().between(0, game.width() - 1)
		and		nuevaPosicion.y().between(0, game.height() - 1)
	}
	
	method esAtacado(danio){
		vida -=10
		if (vida == 0){
			// implementar dejar de moverse con las teclas si muere (que se quede en el lugar)
			self.image("dead.png")
			self.perder()
		}
	}
	
	//cuando la vida es 0 debe perder
	
	method atacar(tripulante){
		tripulante.esAsesinado()
        //generadorTripulantes.removerTripulante(tripulante)
        
	}
	
	method perder() {
		game.say(self, "Derrota")
		game.schedule(3000, { game.stop() })
	}
	
}
