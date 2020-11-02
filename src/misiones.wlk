import config.*
import nave.*

class Mision {

	method serSaboteada()

	method teDejaPasar() = true

	method teEncontro(player) {
	}
	
	override method initialize() {
		nave.agregarSabojate(self)
	}

}

object passwordCode inherits Mision {

	var property image = "passwordCodeDefault.png"
	var property fueSaboteada = false


	//	method sabotear(jugador){
	// deja de restar tiempo
	//		jugador.sabotaje()
	//	}
	
	override method serSaboteada() {
		image = "passwordRedCode.png"
		config.agregarTiempoDeJuego(30)
		fueSaboteada = true
		nave.sabotajesRestantes().remove(self)
	}

}

object cableado inherits Mision {

	var property fueSaboteada = false
	var property image = "cablesDefault.png"

	override method serSaboteada() {
		image = "cablesSaboteados.png"
		config.agregarTiempoDeJuego(20)
		fueSaboteada = true
		nave.sabotajesRestantes().remove(self)
	}
	
	

}

