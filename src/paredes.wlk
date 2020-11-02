class Pared {
	method image()= "m-001.jpg"
	method teEncontro(jugador) {return self.teDejaPasar()}
	method teDejaPasar() {return false}
}

class ParedInvisible inherits Pared{
	override method image()= "vacia.png"
}