import wollok.game.*
import enemigos.*
import player.*
 
 
class Personajes {
		
		method paredColisionada(nuevaPosicion) {
			const paredes = game.getObjectsIn(nuevaPosicion)
			return paredes.any({ pared => not pared.teDejaPasar() })
	}
	
		method atacar(jugador)

		method teDejaPasar() {
			return true
	}
}
	
 