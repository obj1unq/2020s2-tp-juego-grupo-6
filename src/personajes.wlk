import wollok.game.*
import enemigos.*
import player.*
 
 
class Personajes {
		
	method paredColisionada(nuevaPosicion) {
			const paredes = game.getObjectsIn(nuevaPosicion)
			return paredes.any({ pared => not pared.teDejaPasar() })
	}
	
	method atacar(jugador)

	method teDejaPasar() {return true}
	
	method estaDentroDeLaPantalla(nuevaPosicion) {
		return nuevaPosicion.x().between(0, game.width() - 1) and nuevaPosicion.y().between(0, game.height() - 1)
	}
	
}
	
 