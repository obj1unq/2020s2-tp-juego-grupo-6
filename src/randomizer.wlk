import wollok.game.*
import nave.*

object randomizer {
	
	const colores = ["tAmarillo.png", "tRojo.png",  "tNegro.png",  "tVerde.png", "tNaranja.png", "tBlanco.png","tCeleste.png","tMarron.png",
						"tRosa.png","tVioleta.png","tAzul.png"]
	var posicionColorActual = 0
	
	method position() {
		return 	game.at( 
					(0 .. game.width() - 1 ).anyOne(),
					(0..  game.height() - 1).anyOne()
		) 
	}
	
	method emptyPosition() {
		const position = self.position()
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPosition()
		}
	}
	
	method emptyPositionNoTosca() {
		const position = self.position()
		if((game.getObjectsIn(position).isEmpty()) and (not nave.accionesRestantes().any({accion => accion.esVecino(accion, position)}))) {
			return position	
		}
		else {
			return self.emptyPositionNoTosca()
		}
	}
	
	method esVecino(elemento, position) {
		return elemento.position().distance(position) < 2
	}
	
	method image() {
		
		return 	colores.get(posicionColorActual)
	}
	
	method color(){
		posicionColorActual = (posicionColorActual + 1) % colores.size()
	}
	
	method imageRandom(){
		self.color()
		return colores.get(posicionColorActual)
	}
}