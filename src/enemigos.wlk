import wollok.game.*

class Tripulante {

	var property vida = 100
	var property image = "tripulanteAmarillo.png"
	var property position
    const property direcciones = [arriba, abajo, izquierda, derecha]

	// randomizar los colores para mas adelante
	// ahora le puse un solo color para probarlo
	// factory de enemigos
	method muerto() {
		return vida == 0
	}
	
	method moverseRandom() {return direcciones.anyOne()}

	method teEncontro(player) {
		self.atacar(player)
	}

	method atacar(player) {
		// averiguar si se puede poner una animacion
		player.esAtacado(10)
	}


	
	method esAsesinado(){
		self.image("deadAmarillo.png")
		vida = 0		
		

	}

	method teDejaPasar(jugador) {
		return true
	}

	// que caminen por el nivel
	method estaDentroDeLaPantalla(nuevaPosicion) {
		return nuevaPosicion.x().between(0, game.width() - 1) and nuevaPosicion.y().between(0, game.height() - 1)
	}

	method paredColisionada(nuevaPosicion) {
		const paredes = game.getObjectsIn(nuevaPosicion)
		return paredes.any({ pared => not pared.teDejaPasar(self) })
	}

	method caminar(direccion) {
		if (vida > 0) {
			const proximaPosicion = direccion.siguiente(self.position())
			if (self.estaDentroDeLaPantalla(proximaPosicion) and not self.paredColisionada(proximaPosicion)) {
				self.position(proximaPosicion)
			}
		}
	}

}

object arriba {

	method siguiente(posicion) {
		return posicion.up(1)
	}
}

object abajo {
	method siguiente(posicion) {
		return posicion.down(1)
	}
}

object izquierda {
	method siguiente(posicion) {
		return posicion.left(1)
	}
}

object derecha {
	method siguiente(posicion) {
		return posicion.right(1)
	}
}
