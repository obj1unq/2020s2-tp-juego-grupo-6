import config.*



object passwordCode {
	
	var property saboteada = false
	
	var property image = "passwordCode.png"
	
	
	//ver si se puede cambiar el tamaño desde aca
	// la imagen tiene que quedar atras del jugador y enemigo
	
	
	//reduce el tiempo de juego si esta arreglada y podes perder
	
	method sabotear(jugador){
		//deja de restar tiempo
		jugador.sabotaje()
	}
	
	
	
	method teEncontro(jugador) {}
	
	method teDejaPasar(jugador) {return true}
	
	
	method serSaboteada(){
	 	image = "passwordRedCode.png"
	 	config.agregarTiempoDeJuego()
	}		
}


