import wollok.game.*
import player.*

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
}
