import config.*
import nave.*
import wollok.game.*
import player.*
import randomizer.*
import enemigos.*



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

	method teEncontro(player){}
	
	method imagenSaboteada()

   override method initialize() {
   		nave.agregarSabotaje(self)
   }
   
   
	
	method esMisionCercana(){
		return self.position().distance(player.position()) <= 1 
	}
	
	
	method esVecino(tripulante, posicion) {
		return tripulante.position().distance(posicion) < 2
	}
	
}

class PasswordCode inherits Mision {

	
	override method position() = game.at(11, 11)

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

	override method position() = game.at(1, 11)

	override method serSaboteada() {
		super()
		config.agregarTiempoDeJuego(20)
		
	}
	
	override method imagenSaboteada() {return "cablesSaboteados.png"}
	
	override method initialize() {
		super() self.image("cablesConectados.png")		
	}
}

class MedBay inherits Mision {

	var property position = game.at(0, 8)

	override method serSaboteada() {
		if (not self.fueSaboteada()) {
			player.vida(100)
			fueSaboteada = true
			nave.removerMision(self)
		} else {
			self.error("Ya fue utilizada")
		}
	}
	
	
	
	override method imagenSaboteada() {}
	
	override method initialize() {super() self.image("MedBay.png")}
	//no deberia ser super ya q la idea del juego es q no sea necesario
	//para pasar de nivel pero si le saco el super y el remove en
	// el method serSaboteada() no cura mas
	
	//preguntar al profe q hay q hacer 
	 
	override method esMisionCercana(){
		return self.position().distance(player.position()) == 0 
	}
}	
	
class Nafta inherits Mision{
		
	override method position() = game.at(1,11)
	
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
	
	override method position() = game.at(11,11)
	
	override method serSaboteada() {
		super()
		game.removeTickEvent("efectoEscudos")	
		
	}
	
	override method imagenSaboteada() {return "escudosSaboteados.png"}

	override method initialize() {
		super() 
		self.image("escudosDefault.png")
		game.onTick(5000, "efectoEscudos", { self.dibujarParedAleatoria()})
	}
	
	method dibujarParedAleatoria(){
		nivel2.dibujarPared(randomizer.emptyPosition(), 0, 0, 1)
		
	}
	
}

object botonMisterioso inherits Mision{
	
	override method position() = game.at(6,11)
	
	override method serSaboteada() {
			image = self.imagenSaboteada()
			game.say(self, "Atrapa a Pepita")
			fueSaboteada = true
			game.addVisual(pepita)
	}
	
	override method imagenSaboteada() {return "Jaula.png"}
	
	override method initialize() {
		super() 
		self.image("botonMisterioso.png")
		
		}
	
}
	 



