import wollok.game.*

class Tripulante {
	
	var property vida = 100
	var property image = "tripulanteAmarillo.png"
	
	//randomizar los colores para mas adelante
	//ahora le puse un solo color para probarlo
	//factory de enemigos
	
	method teEncontro(player) {
		self.atacar(player)
	}
		
	method atacar(player){
		//averiguar si se puede poner una animacion
		player.esAtacado(10)
	}
	
	method esAsesinado(){
		self.image("dead.png")
		vida = 0		
	}
	
	// que caminen por el nivel
	
	method teDejaPasar(jugador) {return true}
	
}
