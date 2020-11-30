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
import direcciones.*

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
		self.ponerEscotilla()
		game.addVisual(player)	
		config.configurarColisiones()
		game.addVisual(barraVida)
		config.tiempoDeJuego(60)
		
		self.dibujarParedInvisible(game.at(0, 11), 1, 0, 11)
		self.dibujarParedInvisible(game.at(0, 11), 0, 0, 1)
	}
	
	method ponerFondo()
	
	method siguienteNivel()
	
	method pasarDeNivel() {self.siguienteNivel().iniciar()
	}
	
	method ponerEscotilla(){}
	
}

object nivel1 inherits Nivel {
	
	override method ponerFondo(){
		game.addVisual(new BoardGround (image = "fondoLvl1.png"))
	}
	
	override method ponerEscotilla(){
			game.addVisual(new Escotilla(position = game.at(3, 5), image = "escotilla.png"))		
		}		
		
	override method iniciar() {
				
		super()
		config.musica()
		game.addVisual(new Time())
		
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
		generadorTripulantes.nuevoTripulante(5)
		
		}
	
		override method siguienteNivel() {return nivel2}
	
}

object nivel2 inherits Nivel {
 	var property paredes = []

	override method ponerEscotilla(){
			game.addVisual(new Escotilla(position = game.at(5, 5), image = "escotilla.png"))		
		}
		
	override method iniciar() {
		
		super()
		
		game.addVisual(new Time())
		game.addVisual(botonMisterioso)
		player.position(game.origin())
		game.addVisual(new Nafta())
		game.addVisual(new Escudos())
		generadorTripulantes.nuevoTripulante(7)
		
		
		self.dibujarParedInvisible(game.at(-1, 2), 1, 0, 3)
		self.dibujarParedInvisible(game.at(0, 5), 0, 0, 1)
		self.dibujarParedInvisible(game.at(1, 5), 1, 0, 2)
		self.dibujarParedInvisible(game.at(3, 5), 0, 1, 6)
		self.dibujarParedInvisible(game.at(6, 2), 0, 0, 1)
		self.dibujarParedInvisible(game.at(8, 2), 1, 0, 3)
		
		//parte de arriba
		self.dibujarParedInvisible(game.at(0, 11), 1, 0, 11)
		self.dibujarParedInvisible(game.at(0, 11), 0, 0, 1)
		
	}
	
	
	override method siguienteNivel() {return nivel3DeCreditos}
	
	override method ponerFondo(){
		game.addVisual(new BoardGround (image = "fondoLvl2.png"))
	}
	
	method borrarParedesToscas(){
		paredes.forEach({pared => pared.removeVisual(pared)})
		
	}
	
	method dibujarPared(posicionInicial, direccionX, direccionY, cantidadAMover, pared){
		cantidadAMover.times({ indice => game.addVisualIn(pared, game.at(posicionInicial.x() + direccionX * indice, posicionInicial.y() + direccionY * indice))})
		paredes.add(pared)	
	}
	
}

object nivel3DeCreditos {

	method iniciar() {
		game.clear()
		self.ponerFondo()
		game.addVisual(player)
		player.position(game.origin())
		config.configurarTeclas()
		game.onTick(15000, "Ganar", {=>player.ganar()})
	}
	
	
	method ponerFondo(){
		game.addVisual(new BoardGround (image = "creditosAmunqUs.png"))
	}

}

object config {

	var property tiempoDeJuego = 1000

	// TECLAS
	method configurarTeclas() { 
		keyboard.left().onPressDo({ player.irASiSeMantieneEnLaPantalla(izquierda)}) 
		keyboard.right().onPressDo({ player.irASiSeMantieneEnLaPantalla(derecha)})
		keyboard.up().onPressDo({ player.irASiSeMantieneEnLaPantalla(arriba)})
		keyboard.down().onPressDo({ player.irASiSeMantieneEnLaPantalla(abajo)})
		keyboard.a().onPressDo({ player.realizarAccion()}) // accion para sabotear o matar o pasar al siguiente nivel
	}

	method configurarColisiones() {
		game.onTick(200, "Atacar enemigo", {=> nave.atacarAlColisionar()})
}

	method tiempoDeJuego(tiempo) {
		game.schedule( tiempoDeJuego * tiempo, { player.perder() } )
		game.say(player, "Tenés 1 minuto para sabotear la nave y matar a los tripulantes")
	}

	method agregarTiempoDeJuego(tiempo) {
		tiempoDeJuego += tiempo
	}
	
	method musica() {
		const audio = game.sound("amongUsTrap.wav")
		audio.shouldLoop(true)
		game.schedule(500, { => audio.play()})
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
			nave.agregarAccion(nuevoTripulante)
			game.onTick(500, "Enemigo se mueve", {=> nuevoTripulante.caminar(nuevoTripulante.moverseRandom())})
		}
	}

}

class Time{
	var property time = 0
	var property position = game.at(13,-1) //afuera del tablero para que quede mas estetico	
	method image()= "vacia.png"
	
	
	override method initialize(){
		game.onTick(1000, "contar tiempo", { time+= 1 } )
		game.onTick(2000, "decir tiempo", { self.decirTiempo() } )
	}
	
	method decirTiempo(){
		game.say(self, self.time().toString() )
	}
	
	method teDejaPasar() {return true}
	
}

