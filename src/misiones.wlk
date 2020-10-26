import config.*

class Mision{
	    
	    	
		method serSaboteada()
		method teDejaPasar(jugador) = true	
		method teEncontro(player) {}
						
}



object passwordCode inherits Mision {	
	var property image = "passwordCodeDefault.png"
	var property fueSaboteada = false
	
	
	//ver si se puede cambiar el tamaño desde aca
	// la imagen tiene que quedar atras del jugador y enemigo
	
	
	//reduce el tiempo de juego si esta arreglada y podes perder
	
//	method sabotear(jugador){
		//deja de restar tiempo
//		jugador.sabotaje()
//	}
	
	
	
	override method serSaboteada(){
	 	image = "passwordRedCode.png"
	 	config.agregarTiempoDeJuego()
	 	fueSaboteada = true	
	 	}
	 	
	 	
} 
	
object cableado inherits Mision {
	var property fueSaboteada = false
	var property image = "cablesDefault.png"
	
		override method serSaboteada(){
	 	image = "cablesSaboteados.png"
	 	config.agregarTiempoDeJuego()
	 	fueSaboteada = true
	}	
	
}
	



