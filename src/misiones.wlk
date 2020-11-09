import config.*
import nave.*
import wollok.game.*
import player.*

class Mision {

	var property fueSaboteada = false

	method serSaboteada()

	method teDejaPasar() = true

	method teEncontro(player) {
	}

	override method initialize() {
		nave.agregarSabojate(self)
	}

}

class PasswordCode inherits Mision {

	var property image = "passwordCodeDefault.png"
	var property position = game.at(11, 11)

	override method serSaboteada() {
		image = "passwordRedCode.png"
		game.removeTickEvent("efectoNoSabotaje")
		fueSaboteada = true
		nave.sabotajesRestantes().remove(self)
	}

	override method initialize() {
		super()
		game.onTick(5000, "efectoNoSabotaje", { player.esAtacado(10)})
	}

}

class Cableado inherits Mision { //Revisar, no es tomado en cuenta para pasar de nivel

	var property image = "cablesDefault.png"
	var property position = game.at(1, 11)

	override method serSaboteada() {
		image = "cablesSaboteados.png"
		config.agregarTiempoDeJuego(20)
		fueSaboteada = true
		nave.sabotajesRestantes().remove(self)
	}

}

class MedBay inherits Mision {

	var property image = "MedBay.png"
	var property position = game.at(0, 8)

	override method serSaboteada() {
		if (not self.fueSaboteada()) {
			player.vida(100)
			fueSaboteada = true
		} else {
			self.error("Ya fue utilizada")
		}
	}

}

