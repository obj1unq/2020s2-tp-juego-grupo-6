import nave.*
import wollok.game.*
import config.*
import player.*
import misiones.*


class Escotilla inherits Mision{

 	var property position = game.at(3, 5)
	
	override method image()= "escotilla.png"
	
	override method imagenSaboteada() {return "escotillaAbierta.png"}
	
	//method teEncontro(jugador) {return self.teDejaPasar()}
	override method initialize() {
		super() 
		self.image("escotilla.png")	
	}
	
	override method teDejaPasar() {return true}
	
	
	//validar tripulantes y  sabotajes 
	
	
	override method serSaboteada() {
		nave.removerMision(self)
		if (nave.sinTripulantes() && nave.sinSabotajes() && not nave.esElUltimoNivel()) {
			nave.nivelActual().pasarDeNivel()
			game.say(player, "Level up")
		}  else if (nave.sinTripulantes() && nave.sinSabotajes() && nave.esElUltimoNivel()) {
			player.ganar()
		} else {
			self.error("No cumplis los requisitos para pasar de Nivel")
		}
	}

}

