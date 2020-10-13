import wollok.game.*



object player {
	
	var property vida = 100
	var property position = game.origin()
	
	method image() {
		return "idle.png"
	}
	
	
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
	}
	//cuando la vida es 0 debe perder
	
	
}
