import nave.*
import config.*

class Escotilla {
	method image()= "escotilla.png"
	
	method teEncontro(jugador) {return self.teDejaPasar()}
	
	method teDejaPasar() {return true}
	
	method esAsesinado() {
		if (nave.sinTripulantes() && nave.sinSabotajes()){
			nivel2.iniciar()
		}
	
	}
	
}
