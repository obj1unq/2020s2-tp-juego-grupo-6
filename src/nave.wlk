import config.*

object nave {
	var property enemigosRestantes = []
	var property sabotajesRestantes = []
	var property nivelActual = null
	
	method agregarEnemigo(tripulante) {enemigosRestantes.add(tripulante)}
	
	method agregarSabojate(artefacto) {sabotajesRestantes.add(artefacto)}
	
	method sinTripulantes() {return enemigosRestantes.isEmpty()}
	
	method sinSabotajes() {return sabotajesRestantes.isEmpty()}
	
	//mas adelante cambiar el numero de ultimo nivel
	method esElUltimoNivel(){return nivelActual == nivel3}
	
	
	
}
