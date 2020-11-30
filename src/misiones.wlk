import config.*
import nave.*
import wollok.game.*
import player.*
import randomizer.*
import enemigos.*
import paredes.*



class Mision {

	var property fueSaboteada = false
	var property image
	
	method position() 

	method serRealizada() {
		image = self.imagenSaboteada()
		fueSaboteada = true

	}

	method teDejaPasar() = true

	method teEncontro(player){}
	
	method imagenSaboteada()

	
	method esVecino(elemento, posicion) {
		return elemento.position().distance(posicion) < 2
	}
   
    override method initialize() {
   		nave.agregarAccion(self)
   }
   
	
	method fueHecha(){
		return fueSaboteada
	}
	
	method atacarCuandoColisiona() {
		//no hace nada pero lo necesita saber porque todas las acciones de la nave necesitan saber este mensaje(pero solo lo utiliza los tripulantes)
	}
	
}

class PasswordCode inherits Mision {

	
	override method position() = game.at(11, 11)

	override method serRealizada() {
		if(not self.fueHecha()){
		super()
		game.removeTickEvent("efectoNoSabotaje")	
	}
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

	override method serRealizada() {
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

	override method serRealizada() {
		if (not self.fueHecha()) {
			player.vida(100)
			fueSaboteada = true
		} else {
			self.error("Ya fue utilizada")
		}
	}
	
	
	override method imagenSaboteada() {}
	
	override method initialize() {super() self.image("MedBay.png")}
	 
	override method esVecino(elemento, posicion){
		return elemento.position() == player.position()
	}
}	
	
class Nafta inherits Mision{
		
	override method position() = game.at(1,11)
	
	override method serRealizada() {
		if(not self.fueHecha()){
		super()
		game.removeTickEvent("efectoNoSabotaje")	
		
		}
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
	
	override method serRealizada() {
		if(not self.fueHecha()){
		super()
		game.removeTickEvent("efectoEscudos")	
		nivel2.borrarParedesToscas()
		
		}
		
	}
	
	override method imagenSaboteada() {return "escudosSaboteados.png"}

	override method initialize() {
		super() 
		self.image("escudosDefault.png")
		game.onTick(5000, "efectoEscudos", { self.dibujarParedAleatoria()})
	}
	
	method dibujarParedAleatoria(){	
		nivel2.dibujarPared(randomizer.emptyPositionNoTosca(), 0, 0, 1, new Pared())
		
	}
	
}

object botonMisterioso inherits Mision{
	
	override method position() = game.at(6,11)
	
	override method serRealizada() {
		 if(not self.fueHecha()){
			image = self.imagenSaboteada()
			game.say(self, "Atrapa a Pepita")
			fueSaboteada = true
			pepita.position(game.at(8,10))
			game.addVisual(pepita)
			nave.agregarAccion(pepita)
			pepita.moverse()
	}
}
	override method imagenSaboteada() {return "Jaula.png"}
	
	override method initialize() {
		super() 
		self.image("botonMisterioso.png")
		
	}
}

	 



