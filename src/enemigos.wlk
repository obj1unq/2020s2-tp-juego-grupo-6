import wollok.game.*

class Tripulante {
	
	var property vida = 100
	var property image = "tripulanteAmarillo.png"
	var property position
	var muerto = false
	
	
	//randomizar los colores para mas adelante
	//ahora le puse un solo color para probarlo
	//factory de enemigos
	
	method murio() {return muerto}
	
	method teEncontro(player) {
		self.atacar(player)
	}
		
	method atacar(player){
		//averiguar si se puede poner una animacion
		player.esAtacado(10)
	}
	
	method esAsesinado(){
		self.image("deadAmarillo.png")
		vida = 0		
		muerto = true
	}
	
	
	
	method teDejaPasar(jugador) {return true}
	
	// que caminen por el nivel
	
	method estaDentroDeLaPantalla(nuevaPosicion) {
		return 	nuevaPosicion.x().between(0, game.width() - 1)
		and		nuevaPosicion.y().between(0, game.height() - 1)
	}
	
	method paredColisionada(nuevaPosicion) {
		const paredes = game.getObjectsIn(nuevaPosicion)
		return paredes.filter( {pared => not pared.teDejaPasar(self)} )
		
	}
	
	
	method caminar() {
		if (vida > 0)
		   if (self.paredColisionada(position.up(1)).isEmpty() and self.estaDentroDeLaPantalla(position.up(1)))
		   position = position.up(1)
      else if (self.paredColisionada(position.left(1)).isEmpty() and self.estaDentroDeLaPantalla(position.left(1)))
		   position = position.left(1)	
	  else if (self.paredColisionada(position.down(1)).isEmpty()and self.estaDentroDeLaPantalla(position.down(1)))
		   position = position.down(1)
      else if (self.paredColisionada(position.right(1)).isEmpty() and self.estaDentroDeLaPantalla(position.right(1)))
		   position = position.right(1)		
	}	
}
