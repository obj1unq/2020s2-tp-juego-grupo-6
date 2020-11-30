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
	
 
	method muerto() {
		return vida == 0
	}

	method moverseRandom() {
		return direcciones.anyOne()
	}

	method teEncontro(player) {
		if (self.estaVivo()) {
			self.atacar(player)
		}
	}
	
	method estaVivo(){
		return self.vida() > 0
	}

	override method atacar(player) {
		player.esAtacado()
	}

	method serRealizada() {
		if(self.estaVivo())
		self.colorMuerto()
		vida = 0
	}

	method colorMuerto() { 
		self.image("dead" + self.image())
		
	}


	method caminar(direccion) {
		if (self.estaVivo()) {
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

