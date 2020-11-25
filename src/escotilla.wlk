import nave.*
import wollok.game.*
import config.*
import player.*
import misiones.*


class Escotilla inherits Mision{

 	var property position = game.at(3, 5)
	
	override method image()= "escotilla.png"
	
	override method imagenSaboteada() {return "escotillaAbierta.png"}
	
 	override method initialize() {
 		super()
		self.image("escotilla.png")	
	}
	
	override method teDejaPasar() {return true}
	
	
	//validar tripulantes y  sabotajes 
	
	
	override method serSaboteada() {
		fueSaboteada = true
		if (nave.sinTripulantes() && nave.sinSabotajes()) {
			nave.nivelActual().pasarDeNivel()
			nave.removerMision(self)
			game.say(player, "Level up")
		} else {
			self.error("No cumplis los requisitos para pasar de Nivel")
		}
	}

}

