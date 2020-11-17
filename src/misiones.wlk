import config.*
import nave.*
import wollok.game.*
import player.*

class Mision {

	var property fueSaboteada = false
	var property image

	method serSaboteada() {
		image = self.imagenSaboteada()
		fueSaboteada = true
		nave.sabotajesRestantes().remove(self)
	}

	method teDejaPasar() = true

	method teEncontro(player) {}
	
	method imagenSaboteada()

	override method initialize() {nave.agregarSabojate(self)}
}

class PasswordCode inherits Mision {

	
	var property position = game.at(11, 11)

	override method serSaboteada() {
		super()
		game.removeTickEvent("efectoNoSabotaje")
		
		
	}
	
	override method imagenSaboteada() {return "passwordRedCode.png"}

	override method initialize() {
		super()
		self.image("passwordCodeDefault.png")
		game.onTick(5000, "efectoNoSabotaje", { player.esAtacado()})
	}

}

class Cableado inherits Mision { //Revisar, no es tomado en cuenta para pasar de nivel

	var property position = game.at(1, 11)

	override method serSaboteada() {
		super()
		config.agregarTiempoDeJuego(20)
		
	}
	
	override method imagenSaboteada() {return "cablesSaboteados.png"}
	
	override method initialize() {super() self.image("cablesDefault.png")}
}

class MedBay inherits Mision {

	var property position = game.at(0, 8)

	override method serSaboteada() {
		if (not self.fueSaboteada()) {
			player.vida(100)
			fueSaboteada = true
		} else {
			self.error("Ya fue utilizada")
		}
	}
	
	override method imagenSaboteada() {}
	
	override method initialize() {super() self.image("MedBay.png")}

}

