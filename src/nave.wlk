import config.*

object nave {
	var property enemigosRestantes = []
	var property sabotajesRestantes = []
	var property nivelActual = null
	
	method agregarEnemigo(tripulante) {enemigosRestantes.add(tripulante)}
	
	method agregarSabotaje(artefacto) {sabotajesRestantes.add(artefacto)}
	
	method sinTripulantes() {return enemigosRestantes.isEmpty()}
	
	method sinSabotajes() {return sabotajesRestantes.size() == 1}
	
	//mas adelante cambiar el numero de ultimo nivel
	method esElUltimoNivel(){return nivelActual == nivel3}
	
	method removerTripulante(tripulante){
		enemigosRestantes.remove(tripulante)
	}	
	
	method removerMision(mision){
	 	sabotajesRestantes.remove(mision)
	}

}
