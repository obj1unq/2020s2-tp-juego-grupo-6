import wollok.game.*
import player.*

object barraVida {
	method position() = game.at(0, 0)
	
	method image() = "VIDA_" + player.vida() + ".png"
	
	method teEncontro(player) {}
	
	method teDejaPasar() {return true}
	
}
