import wollok.game.*


class Pared {
	method image()= "m-001.jpg"
	method teEncontro(jugador) {return self.teDejaPasar()}
	method teDejaPasar() {return false}
	
	method removeVisual(pared){
		game.removeVisual(pared)
	}
}

class ParedInvisible inherits Pared{
	override method image()= "vacia.png"
}