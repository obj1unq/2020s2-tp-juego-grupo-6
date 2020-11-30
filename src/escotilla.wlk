import nave.*
import wollok.game.*
import config.*
import player.*
import misiones.*


class Escotilla inherits Mision{

 	var property position 
	
	override method image()= "escotilla.png"
	
	override method imagenSaboteada() {return "escotillaAbierta.png"}
	
 	override method initialize() {
 		super()
 		fueSaboteada = true
		self.image("escotilla.png")	
	}
	
	override method teDejaPasar() {return true}
	
	override method esVecino(elemento, posicion){
		return elemento.position().distance(player.position()) == 0 
	}
	
	
	override method serRealizada() {
		image = self.imagenSaboteada()
		self.validarAcciones()
		nave.nivelActual().pasarDeNivel()
		game.say(player, "Level up")
		
	}
	
	method validarAcciones(){
		if (not nave.sinAccionesRestantes()){
			self.error("Te faltan cumplir objetivos")
		}
	}
	
}

