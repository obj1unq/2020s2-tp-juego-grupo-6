import config.*

class Mision{
				
		method serSaboteada()
		
			
	
}



object passwordCode inherits Mision {
	
//	var property saboteada = false
	
	var property image = "passwordCodeDefault.png"
	
	
	//ver si se puede cambiar el tamaño desde aca
	// la imagen tiene que quedar atras del jugador y enemigo
	
	
	//reduce el tiempo de juego si esta arreglada y podes perder
	
//	method sabotear(jugador){
		//deja de restar tiempo
//		jugador.sabotaje()
//	}
	
	//method teEncontro(jugador) {}
	
	//method teDejaPasar(jugador) {return true}
	
	
	override method serSaboteada(){
	 	image = "passwordRedCode.png"
	 	config.agregarTiempoDeJuego()
	}		

} 
	
object cableado inherits Mision {
	
	var property image = "cablesDefault.png"
	
		override method serSaboteada(){
	 	image = "cablesSaboteados.png"
	 	config.agregarTiempoDeJuego()
	}	
}
	



