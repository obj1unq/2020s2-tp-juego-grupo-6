import wollok.game.*
import player.*
import paredes.*
import misiones.*
import enemigos.*
import nave.*
import escotilla.*
import randomizer.*
import vida.*
import mainMenu.*

class Nivel {
	
	
	method dibujarPared(posicionInicial, direccionX, direccionY, cantidadAMover) {
		cantidadAMover.times({ indice => game.addVisualIn(new Pared(), game.at(posicionInicial.x() + direccionX * indice, posicionInicial.y() + direccionY * indice))})
	}

	method dibujarParedInvisible(posicionInicial, direccionX, direccionY, cantidadAMover) {
		cantidadAMover.times({ indice => game.addVisualIn(new ParedInvisible(), game.at(posicionInicial.x() + direccionX * indice, posicionInicial.y() + direccionY * indice))})
	}
	
	method iniciar() {
		game.clear()
		self.ponerFondo()
		config.configurarTeclas()
		nave.nivelActual(self)
		game.addVisual(new MedBay())
		game.addVisual(new Escotilla())
		game.addVisual(player)	
		config.configurarColisiones()
		game.addVisual(barraVida)
		config.tiempoDeJuego(60)
		config.musica()
		self.dibujarParedInvisible(game.at(0, 11), 1, 0, 11)
		self.dibujarParedInvisible(game.at(0, 11), 0, 0, 1)
	}
	
	method ponerFondo()
	
	method siguienteNivel()
	
	method pasarDeNivel() {self.siguienteNivel().iniciar()
	}
	
}

object nivel1 inherits Nivel {
	
	override method ponerFondo(){
		game.addVisual(new BoardGround (image = "fondoLvl1.png"))
	}
	
	override method iniciar() {
				
		super()
		
		game.addVisual(new PasswordCode())
		game.addVisual(new Cableado())			
			
		
		
		// DIBUJAR PAREDES
		
		self.dibujarPared(game.at(0, 5), 1, 0, 2)
		self.dibujarPared(game.at(0, 6), 0, 0, 1)
		self.dibujarPared(game.at(1, 6), 0, 0, 1)
		self.dibujarPared(game.at(0, 8), 1, 0, 2)
		self.dibujarPared(game.at(0, 3), 1, 0, 6)
		self.dibujarPared(game.at(2, 9), 0, 0, 1)
		self.dibujarPared(game.at(3, 7), 0, 0, 1)
		self.dibujarPared(game.at(4, 3), 0, 1, 4)
		self.dibujarPared(game.at(3, 1), 0, 1, 3)
		self.dibujarPared(game.at(6, 2), 0, 0, 1)
		self.dibujarPared(game.at(2, 9), 0, 0, 1)
		self.dibujarPared(game.at(7, 2), 1, 0, 2)
		self.dibujarPared(game.at(8, 1), 0, 0, 1)
		self.dibujarPared(game.at(6, 4), 1, 0, 3)
		self.dibujarPared(game.at(9, 4), 0, 1, 5)
		self.dibujarPared(game.at(4, 6), 1, 0, 2)
		self.dibujarPared(game.at(6, 6), 0, 1, 2)
		self.dibujarPared(game.at(7, 7), 0, 1, 2)
		self.dibujarPared(game.at(3, 10), 1, 0, 2)
				
		
		// Misiones
		generadorTripulantes.nuevoTripulante(3)
		
		}
	
		override method siguienteNivel() {return nivel2}
	
}

object nivel2 inherits Nivel {
 	

	override method iniciar() {
		
		
		super()
		
		game.addVisual(new Nafta())
		game.addVisual(new Escudos())
		self.dibujarPared(game.at(0, 5), 0, 1, 1)
		self.dibujarPared(game.at(1, 2), 0, 1, 1)
		self.dibujarPared(game.at(1, 4), 0, 1, 2)
		self.dibujarPared(game.at(1, 7), 0, 1, 1)
		self.dibujarPared(game.at(2, 2), 0, 1, 1)
		self.dibujarPared(game.at(2, 4), 0, 1, 1)
		self.dibujarPared(game.at(2, 7), 0, 1, 2)
		self.dibujarPared(game.at(3, 1), 0, 1, 3)
		self.dibujarPared(game.at(3, 6), 0, 1, 1)
		self.dibujarPared(game.at(4, 3), 0, 1, 4)
		self.dibujarPared(game.at(4, 8), 0, 1, 1)
		self.dibujarPared(game.at(5, 2), 0, 1, 1)
		self.dibujarPared(game.at(5, 5), 0, 1, 1)
		self.dibujarPared(game.at(5, 9), 0, 1, 1)
		self.dibujarPared(game.at(6, 1), 0, 1, 2)
		self.dibujarPared(game.at(6, 5), 0, 1, 3)
		self.dibujarPared(game.at(7, 3), 0, 1, 1)
		self.dibujarPared(game.at(7, 6), 0, 1, 3)
		self.dibujarPared(game.at(8, 0), 0, 1, 2)
		self.dibujarPared(game.at(8, 3), 0, 1, 1)
		self.dibujarPared(game.at(9, 1), 0, 1, 1)
		self.dibujarPared(game.at(9, 3), 0, 1, 5) // Cambiar la posicion de las paredes segun el fondo nuevo agregado
		
		
		generadorTripulantes.nuevoTripulante(7)
	}
	
	override method siguienteNivel() {return nivel3DeCreditos}
	
	override method ponerFondo(){
		game.addVisual(new BoardGround (image = "fondoLvl2.png"))
	}
	
}

object nivel3DeCreditos {

	method iniciar() {
		game.clear()
		self.ponerFondo()
	}
	
	
	method ponerFondo(){
		game.addVisual(new BoardGround (image = "creditos.png"))
	}

}

object config {

	var property tiempoDeJuego = 1000

	// TECLAS
	method configurarTeclas() { // rompe encapsulamiento
		keyboard.left().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().left(1))})
		keyboard.right().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().right(1))})
		keyboard.up().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().up(1))})
		keyboard.down().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().down(1))})
		keyboard.a().onPressDo({ player.realizarAccion()}) // accion para sabotear o matar o pasar al siguiente nivel
	}

	method configurarColisiones() {
		game.onTick(200, "Atacar enemigo", {=> nave.ataqueDeEnemigoAlColisionar()})
}




	method tiempoDeJuego(tiempo) {
		game.schedule(tiempoDeJuego * tiempo, { player.perder()})
		game.say(player, "Tenés 1 minuto para sabotear la nave y matar a los tripulantes")
	}

	method musica() {
		const audio = game.sound("amongUsTrap.wav")
		audio.shouldLoop(true)
		game.schedule(500, { => audio.play()})
	}

	method agregarTiempoDeJuego(tiempo) {
		tiempoDeJuego += tiempo
	}

}

object tripulantesFactory {

	method spawnearTripulante() {
		return new Tripulante(position = randomizer.emptyPosition(), image = randomizer.imageRandom())
	}

}

object generadorTripulantes {

	const tripulantesGenerados = []

	method nuevoTripulante(maximo) {
		maximo.times{ i =>
			const nuevoTripulante = tripulantesFactory.spawnearTripulante()
			game.addVisual(nuevoTripulante)
			tripulantesGenerados.add(nuevoTripulante)
			nave.agregarEnemigo(nuevoTripulante)
			game.onTick(1000, "Enemigo se mueve", {=> nuevoTripulante.caminar(nuevoTripulante.moverseRandom())})
		}
	}

}

