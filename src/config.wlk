import wollok.game.*
import player.*
import paredes.*

object nivel1 {
	method iniciar() {
		game.addVisualIn(new Pared(), game.at(2,1))
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

	method configurarTeclas() {
		keyboard.left().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().left(1)) })
		keyboard.right().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().right(1)) })
		keyboard.up().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().up(1)) })
		keyboard.down().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().down(1)) })
		
		keyboard.a().onPressDo({ player.atacar(player.tripulanteColosionado()) })
	}
	
	method configurarColisiones() {
		game.onCollideDo( player, { algo => algo.teEncontro(player) })
	}
	method tiempoDeJuego(tiempo){
		game.schedule(1000 * tiempo, { player.perder() })
		game.say(player, "Tenés 1 minuto para sabotear la nave y matar a los tripulantes")
	}
	
	method musica(){
		const audio = game.sound("amongUsTrap.wav")
		audio.shouldLoop(true)
		game.schedule(500, { => audio.play() })
	}
}
