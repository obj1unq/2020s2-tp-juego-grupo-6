import wollok.game.*
import player.*
import paredes.*
import misiones.*
import enemigos.*
import nave.*
import escotilla.*
import randomizer.*
import vida.*

object nivel1 {
	
	
	method dibujarPared(posicionInicial, direccionX, direccionY, cantidadAMover) {
		cantidadAMover.times({indice => game.addVisualIn(new Pared(),game.at(posicionInicial.x() + direccionX*indice, posicionInicial.y() + direccionY*indice))})  
	}  
	
	method dibujarParedInvisible(posicionInicial, direccionX, direccionY, cantidadAMover) {
		cantidadAMover.times({indice => game.addVisualIn(new ParedInvisible(),game.at(posicionInicial.x() + direccionX*indice, posicionInicial.y() + direccionY*indice))})  
	}  

	method iniciar() {
		game.boardGround("fondonivel1.jpg")
		
		config.configurarTeclas()

		//DIBUJAR PAREDES
		self.dibujarPared(game.at(0,5), 0, 1, 1)
		self.dibujarPared(game.at(1,2), 0, 1, 1)	
		self.dibujarPared(game.at(1,4), 0, 1, 2)
		self.dibujarPared(game.at(1,7), 0, 1, 1)
		self.dibujarPared(game.at(2,2), 0, 1, 1)
		self.dibujarPared(game.at(2,4), 0, 1, 1)
		self.dibujarPared(game.at(2,7), 0, 1, 2)
		self.dibujarPared(game.at(3,1), 0, 1, 3)
		self.dibujarPared(game.at(3,6), 0, 1, 1)
		self.dibujarPared(game.at(4,3), 0, 1, 4)
		self.dibujarPared(game.at(4,8), 0, 1, 1)
		self.dibujarPared(game.at(5,2), 0, 1, 1)
		self.dibujarPared(game.at(5,5), 0, 1, 1)
		self.dibujarPared(game.at(5,9), 0, 1, 1)
		self.dibujarPared(game.at(6,1), 0, 1, 2)
		self.dibujarPared(game.at(6,5), 0, 1, 3)
		self.dibujarPared(game.at(7,3), 0, 1, 1)
		self.dibujarPared(game.at(7,6), 0, 1, 3)
		self.dibujarPared(game.at(8,0), 0, 1, 2)
		self.dibujarPared(game.at(8,3), 0, 1, 1)
		self.dibujarPared(game.at(9,1), 0, 1, 1)
		self.dibujarPared(game.at(9,3), 0, 1, 5)
		
		//Paredes invisibles (pared en la imagen del fondo del nivel)
		
		self.dibujarParedInvisible(game.at(0,11),1,0,11)
		self.dibujarParedInvisible(game.at(0,11),0,0,1)
	
		//Misiones
		game.addVisual(passwordCode)
		game.addVisual(cableado)
		game.addVisualIn(new Escotilla(), game.at(3,5))
		
		game.addVisual(medBay)
		
		
		generadorTripulantes.nuevoTripulante(3)
		
		config.musica()					
		config.configurarColisiones()
		config.tiempoDeJuego(60)		
	}

}

object config {
	var property tiempoDeJuego = 1000
	
	//TECLAS
	method configurarTeclas() { // rompe encapsulamiento
		keyboard.left().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().left(1))})
		keyboard.right().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().right(1))})
		keyboard.up().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().up(1))})
		keyboard.down().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().down(1))})
		keyboard.a().onPressDo({player.saboteaOAsesina()})
		
	}

	method configurarColisiones() {
		game.onCollideDo(player, { algo => algo.teEncontro(player)})
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
   		return new Tripulante(position = randomizer.emptyPosition(),
   								image = randomizer.imageRandom()
   		)
   }
  
}
   
 object generadorTripulantes{ 
	
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

object nivel2{
	
	method iniciar() {
		game.clear()
		game.boardGround("fondonivel2.jpg") //no esta cambiando la foto cuando pasas de nivel arreglar eso
		config.configurarTeclas()
		//Barra de Vida
		game.addVisual(barraVida)
		//Player
		game.addVisual(player)
		config.configurarColisiones()
		generadorTripulantes.nuevoTripulante(5)					
		config.configurarColisiones()
		config.tiempoDeJuego(60)
	}
}

object nivel3{
	
	method iniciar() {
		game.clear()
		game.boardGround("fondonivel1.jpg")
		config.configurarTeclas()
		//Barra de Vida
		game.addVisual(barraVida)
		//Player
		game.addVisual(player)
		config.configurarColisiones()
		generadorTripulantes.nuevoTripulante(10)					
		config.configurarColisiones()
		config.tiempoDeJuego(60)
	}	
}