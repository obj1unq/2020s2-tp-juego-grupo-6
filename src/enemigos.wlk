import wollok.game.*
import personajes.*
import direcciones.*
import player.*
import nave.*
import misiones.*


class Tripulante inherits Personajes{

	var property vida = 100
	var property image
	var property position
	const property direcciones = [arriba, abajo, izquierda, derecha]
	// Tener el color como atributo y image como metodo.
 
	method muerto() {
		return vida == 0
	}

	method moverseRandom() {
		return direcciones.anyOne()
	}

	method teEncontro(player) {
		if (self.vida() > 0) {
			self.atacar(player)
		}
	}

	override method atacar(player) {
		// averiguar si se puede poner una animacion
		player.esAtacado()
	}

	method serRealizada() {
		self.colorMuerto()
		vida = 0
	}

	method colorMuerto() { //Hacer metodo que modele imagen.
		if (self.image() == "tripulanteAmarillo.png") {
			self.image("deadAmarillo.png")
		} else if (self.image() == "tRojo.png") {
			self.image("deadRojo.png")
		} else if (self.image() == "tNegro.png") {
			self.image("deadNegro.png")
		} else if (self.image() == "tVerde.png") {
			self.image("deadVerde.png")
		} else if (self.image() == "tNaranja.png") {
			self.image("deadNaranja.png")
		}
	}


	// que caminen por el nivel


	method caminar(direccion) {
		if (vida > 0) {
			const proximaPosicion = direccion.siguiente(self.position())
			if (self.estaDentroDeLaPantalla(proximaPosicion) and not self.paredColisionada(proximaPosicion)) {
				self.position(proximaPosicion)
			}
		}
	}
	
	method atacarCuandoColisiona(){
		if ((self.position().distance(player.position()) == 0) and (not self.muerto())){
			player.esAtacado()
	}
  }
  
  	method fueHecha(){
  		return self.muerto()
  }
	
	method esVecino(elemento, posicion) {
		return elemento.position().distance(posicion) < 2
	}
}

object pepita inherits Tripulante{
	var property fueCapturada = false
	
	override method image(){
		return "pepita.png"
	}
	
	override method fueHecha(){
		return fueCapturada
	}
	
	override method atacar(player) {}
	
	override method serRealizada(){
		fueCapturada = true
	    game.removeVisual(self)
		game.say(player, "Te atrape!")
	}
	
	method moverse() {game.onTick(200, "pepitaSeMueve", {self.caminar(self.moverseRandom())})}
	
	
}

