import nave.*
import wollok.game.*
import config.*
import player.*

class Escotilla {



	method image()= "escotilla.png"
	
	method teEncontro(jugador) {return self.teDejaPasar()}
	
	method teDejaPasar() {return true}
	
	
	//validar tripulantes y  sabotajes 
	
	
	method serSaboteada() {
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

