import wollok.game.*
import player.*
import paredes.*
import misiones.*

object nivel1 {
	method iniciar() {
		//game.addVisualIn(new Pared(), game.at(2,1))
		game.addVisualIn(new Pared(), game.at(2,2))
		game.addVisualIn(new Pared(), game.at(3,2))
		game.addVisualIn(new Pared(), game.at(3,3))
		config.musica()
	
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
}
