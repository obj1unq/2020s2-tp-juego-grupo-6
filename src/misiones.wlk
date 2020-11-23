import config.*
import nave.*
import wollok.game.*
import player.*



class Mision {

	var property fueSaboteada = false
	var property image
	
	method position()

	method serSaboteada() {
		image = self.imagenSaboteada()
		fueSaboteada = true
		nave.removerMision(self)
	}

	method teDejaPasar() = true

	method teEncontro(player){
	}
	
	method imagenSaboteada()

   override method initialize() {nave.agregarSabotaje(self)}
	
	method esMisionCercana(){
		return self.position().distance(player.position()) <= 1 
	}
	
	
	method esVecino(tripulante, posicion) {
		return tripulante.position().distance(posicion) < 2
	}
	
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
		self.image("passwordCode.png")
		game.onTick(5000, "efectoNoSabotaje", { player.esAtacado()})
	}

}

class Cableado inherits Mision {  

	var property position = game.at(1, 11)

	override method serSaboteada() {
		super()
		config.agregarTiempoDeJuego(20)
		
	}
	
	override method imagenSaboteada() {return "cablesSaboteados.png"}
	
	override method initialize() {super() self.image("cablesConectados.png")		
	}
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
	
	override method esMisionCercana(){
		return self.position().distance(player.position()) == 0 
	}
}	
	
class Nafta inherits Mision{
		
	var property position = game.at(1,11)
	
	override method serSaboteada() {
		super()
		game.removeTickEvent("efectoNoSabotaje")	
	}
	
	override method imagenSaboteada() {return "naftaSaboteada.png"}

	override method initialize() {
		super() 
		self.image("naftaDefault.png")
		game.onTick(5000, "efectoNoSabotaje", { player.esAtacado()})
	}
	
}

class Escudos inherits Mision{
	
	var property position = game.at(11,11)
	
	override method serSaboteada() {
		super()
		game.removeTickEvent("efectoNoSabotaje")	
		
	}
	
	override method imagenSaboteada() {return "escudosSaboteados.png"}

	override method initialize() {
		super() 
		self.image("escudosDefault.png")
		game.onTick(5000, "efectoNoSabotaje", { player.esAtacado()})
	}
}
	 



