import wollok.game.*
import paredes.*
import enemigos.*
import misiones.*

object player {
	
	var property vida = 100
	var property position = game.origin()
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
		if (self.paredColisionada(nuevaPosicion).isEmpty())
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
			// implementar dejar de moverse con las teclas si muere (quedarse quieto en el lugar)
			self.image("dead.png")
			self.perder()
		}
	}
		
	method atacar(tripulante){
		self.image("killAlien.png")
		tripulante.esAsesinado()
		self.image("idle.png")
        //generadorTripulantes.removerTripulante(tripulante)
	}
	
	method tripulanteColosionado() {
		const tripulantes = game.colliders(self)
		if (tripulantes.isEmpty()) {
			self.error("no hay un tripulante")
		}
		return tripulantes.head()
	}
	
	method perder() {
		game.say(self, "Derrota")
		self.finalizarJuego()
	}
	
	method ganar() {
		//si mate a todos los tripulantes y sabotee la nave
		game.say(self, "Victoria")
		self.finalizarJuego()
	}
	
	method finalizarJuego() {
		game.schedule(3000, { game.stop() })
	}
	
	method sabotaje() {}
	
	method paredColisionada(nuevaPosicion) {
		const paredes = game.getObjectsIn(nuevaPosicion)
		return paredes.filter( {pared => not pared.teDejaPasar(self)} )
		
	}
	
	method sabotear(){
		if (self.hayMisionCerca()) {
			self.getMisionCerca().serSaboteada()
		} else {
			self.error("no hay mision cerca")
		}
	}
	
	method hayMisionCerca(){
		return  self.existeMisionArriba() or
				self.existeMisionAbajo() or 
				self.existeMisionDerecha() or
				self.existeMisionIzquierda()
		}

	method getMisionCerca(){
		if (self.existeMisionArriba()){
				return self.getMisionArriba()
			} else if (self.existeMisionAbajo()){
				return self.getMisionAbajo()
			} else if (self.existeMisionDerecha()){
				return self.getMisionDerecha()
			} else {
				return self.getMisionIzquierda()
			}
		
	}
	
	method getMisionArriba(){
		return game.getObjectsIn(self.position().up(1)).find({ i => i.image() == "passwordCodeDefault.png" or  i.image() == "cablesDefault.png"})

	}

	method getMisionAbajo(){
		return game.getObjectsIn(self.position().down(1)).find({ i => i.image() == "passwordCodeDefault.png" or  i.image() == "cablesDefault.png"})

	}
	
	method getMisionDerecha(){
		return game.getObjectsIn(self.position().right(1)).find({ i => i.image() == "passwordCodeDefault.png" or  i.image() == "cablesDefault.png"})

	}
	
	method getMisionIzquierda(){
		return game.getObjectsIn(self.position().left(1)).find({ i => i.image() == "passwordCodeDefault.png" or  i.image() == "cablesDefault.png"})

	}
	
	
	
		
	method existeMisionArriba(){
		return game.getObjectsIn(self.position().up(1)).any({ i => i.image() == "passwordCodeDefault.png" or  i.image() == "cablesDefault.png"})
	} 
	
	method existeMisionAbajo(){
		return game.getObjectsIn(self.position().down(1)).any({ i => i.image() == "passwordCodeDefault.png" or  i.image() == "cablesDefault.png"})
	} 
	
	method existeMisionDerecha(){
		return game.getObjectsIn(self.position().right(1)).any({ i => i.image() == "passwordCodeDefault.png" or  i.image() == "cablesDefault.png"})
	} 
	
	method existeMisionIzquierda(){
		return game.getObjectsIn(self.position().left(1)).any({ i => i.image() == "passwordCodeDefault.png" or  i.image() == "cablesDefault.png"})
	} 
	

	
}







