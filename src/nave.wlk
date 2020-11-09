object nave {
	var property enemigosRestantes = []
	var property sabotajesRestantes = []
	var property nivelActual = 1
	
	method agregarEnemigo(tripulante) {enemigosRestantes.add(tripulante)}
	
	method agregarSabojate(artefacto) {sabotajesRestantes.add(artefacto)}
	
	method sinTripulantes() {return enemigosRestantes.isEmpty()}
	
	method sinSabotajes() {return sabotajesRestantes.isEmpty()}
	
	//mas adelante cambiar el numero de ultimo nivel
	method esElUltimoNivel(){return nivelActual == 3}
	
	method pasarDeNivel() {nivelActual ++}
}
