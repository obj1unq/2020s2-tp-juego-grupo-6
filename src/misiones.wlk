import config.*
import nave.*
import wollok.game.*
import player.*

class Mision {

	method serSaboteada()

	method teDejaPasar() = true

	method teEncontro(player) {}
	
	override method initialize() {
		nave.agregarSabojate(self)
	}

}

object passwordCode inherits Mision {

	var property image = "passwordCodeDefault.png"
	var property fueSaboteada = false


	override method serSaboteada() {
		image = "passwordRedCode.png"
		game.removeTickEvent("efectoNoSabotaje")
		fueSaboteada = true
		nave.sabotajesRestantes().remove(self)
	}
	
	override method initialize(){
		super() 
		game.onTick(5000, "efectoNoSabotaje",{ player.esAtacado(10) })
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

