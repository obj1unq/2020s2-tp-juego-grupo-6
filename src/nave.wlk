import config.*

object nave {
	
	var property accionesRestantes = [] //lista de enemigos y sabotajes restantes
	
	var property nivelActual = null

	
	method agregarAccion(accion) {accionesRestantes.add(accion)}

   
  	method sinAccionesRestantes(){ return accionesRestantes.any({accion => not accion.faltaRealizar()})}
	
	
	method atacarAlColisionar(){
			accionesRestantes.forEach({accion => accion.atacarCuandoColisiona()})
		}
		
}
