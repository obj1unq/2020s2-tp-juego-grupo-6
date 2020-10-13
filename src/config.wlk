import wollok.game.*
import player.*

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().left(1)) })
		keyboard.right().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().right(1)) })
		keyboard.up().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().up(1)) })
		keyboard.down().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().down(1)) })
		
	}

}
