import nave.*
import config.*
import player.*

class Escotilla {
	method image()= "escotilla.png"
	
	method teEncontro(jugador) {return self.teDejaPasar()}
	
	method teDejaPasar() {return true}
	
	method serSaboteada() {
		if (nave.sinTripulantes() && nave.sinSabotajes() && nave.nivelActual() == 1 ){
			nivel2.iniciar()
		}else{
			self.error("No cumplis los requisitos para pasar de Nivel")
		}
	
	}
	
}

