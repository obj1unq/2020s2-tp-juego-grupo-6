import wollok.game.*
import player.*
import paredes.*
import misiones.*
import enemigos.*

object nivel1 {
	method iniciar() {
		config.agregarParedes()
		const tripulante1 = new Tripulante(position = game.at(8,9))
		game.addVisual(tripulante1)
		game.onTick(1000, "Enemigo se mueve", {=> tripulante1.caminar() })
		const tripulante2 = new Tripulante(position = game.at(0,10))
		game.addVisual(tripulante2)
		game.onTick(1000, "Enemigo se mueve", {=> tripulante2.caminar() })
		const tripulante3 = new Tripulante(position = game.at(10,0))
		game.addVisual(tripulante3)
		game.onTick(1000, "Enemigo se mueve", {=> tripulante3.caminar() })
		//config.musica()					
	    config.configurarTeclas()

    	config.configurarColisiones()
    	config.tiempoDeJuego(60)

	}
	
	
}

object config {
	var property tiempoDeJuego = 1000
		
	method configurarTeclas() { //rompe encapsulamiento
		keyboard.left().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().left(1)) })
		keyboard.right().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().right(1)) })
		keyboard.up().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().up(1)) })
		keyboard.down().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().down(1)) })
		
		keyboard.a().onPressDo({player.atacar(player.tripulanteColosionado()) })
		keyboard.s().onPressDo({player.sabotear()})
	}
	
	method configurarColisiones() {
		game.onCollideDo( player, { algo => algo.teEncontro(player) })
	}
	method tiempoDeJuego(tiempo){
		game.schedule(tiempoDeJuego * tiempo, { player.perder() })
		game.say(player, "Tenés 1 minuto para sabotear la nave y matar a los tripulantes")
	}
	
	method musica(){
		const audio = game.sound("amongUsTrap.wav")
		audio.shouldLoop(true)
		game.schedule(500, { => audio.play() })
	}
	
	method agregarTiempoDeJuego(){
		tiempoDeJuego += 500
	}
	
	method agregarParedes() {
		game.addVisualIn(new Pared(), game.at(1,0))
		game.addVisualIn(new Pared(), game.at(2,0))
		game.addVisualIn(new Pared(), game.at(1,2))
		game.addVisualIn(new Pared(), game.at(2,2))
		game.addVisualIn(new Pared(), game.at(3,0))
		game.addVisualIn(new Pared(), game.at(4,0))
		game.addVisualIn(new Pared(), game.at(5,0))
		game.addVisualIn(new Pared(), game.at(6,0))
		game.addVisualIn(new Pared(), game.at(3,2))
		game.addVisualIn(new Pared(), game.at(4,2))
		game.addVisualIn(new Pared(), game.at(5,2))
		game.addVisualIn(new Pared(), game.at(6,2))
		game.addVisualIn(new Pared(), game.at(7,0))
		game.addVisualIn(new Pared(), game.at(8,0))
		game.addVisualIn(new Pared(), game.at(6,3))
		game.addVisualIn(new Pared(), game.at(6,4))	
		game.addVisualIn(new Pared(), game.at(6,6))
		game.addVisualIn(new Pared(), game.at(6,8))
		game.addVisualIn(new Pared(), game.at(6,9))
		game.addVisualIn(new Pared(), game.at(8,1))
		
		game.addVisualIn(new Pared(), game.at(8,3))
		game.addVisualIn(new Pared(), game.at(8,4))
		game.addVisualIn(new Pared(), game.at(8,5))
		game.addVisualIn(new Pared(), game.at(8,6))
		game.addVisualIn(new Pared(), game.at(8,7))
		game.addVisualIn(new Pared(), game.at(8,8))
		game.addVisualIn(new Pared(), game.at(8,9))
		game.addVisualIn(new Pared(), game.at(6,10))
		game.addVisualIn(new Pared(), game.at(6,11))
		game.addVisualIn(new Pared(), game.at(5,6))
		game.addVisualIn(new Pared(), game.at(4,6))
		game.addVisualIn(new Pared(), game.at(3,6))
		game.addVisualIn(new Pared(), game.at(2,6))
		game.addVisualIn(new Pared(), game.at(1,6))
		game.addVisualIn(new Pared(), game.at(5,8))
		game.addVisualIn(new Pared(), game.at(4,8))
		game.addVisualIn(new Pared(), game.at(2,8))
		game.addVisualIn(new Pared(), game.at(1,8))
		game.addVisualIn(new Pared(), game.at(4,9))
		game.addVisualIn(new Pared(), game.at(4,10))
		game.addVisualIn(new Pared(), game.at(2,9))
		game.addVisualIn(new Pared(), game.at(2,10))
		game.addVisualIn(new Pared(), game.at(7,4))
		game.addVisualIn(new Pared(), game.at(8,4))
		
		game.addVisualIn(new Pared(), game.at(10,4))
		game.addVisualIn(new Pared(), game.at(7,6))
		game.addVisualIn(new Pared(), game.at(8,6))
		game.addVisualIn(new Pared(), game.at(9,6))
		game.addVisualIn(new Pared(), game.at(10,6))
		game.addVisualIn(new Pared(), game.at(11,6))
	}
	

}
