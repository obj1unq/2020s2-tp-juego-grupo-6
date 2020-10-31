object nave {
	var property enemigosRestantes = []
	var property sabotajesRestantes = []
	
	method agregarEnemigo(tripulante) {enemigosRestantes.add(tripulante)}
	method agregarSabojate(artefacto) {sabotajesRestantes.add(artefacto)}
	method sinTripulantes() {return enemigosRestantes.isEmpty()}
	
}
