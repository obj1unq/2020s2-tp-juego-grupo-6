import wollok.game.*
import personajes.*


class Tripulante inherits Personajes{

	var property vida = 100
	var property image
	var property position
	const property direcciones = [ arriba, abajo, izquierda, derecha ]

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
		player.esAtacado(10)
	}

	method esAsesinado() {
		self.colorMuerto()
		vida = 0
	}

	method colorMuerto() {
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

