import config.*
import wollok.game.*
import mainMenu.*
import misiones.*
import player.*
import enemigos.*
import paredes.*


object nivelDeTest inherits Nivel{
	override method ponerFondo() {
		game.addVisual(new BoardGround (image = "fondoLvl1.png"))
	}
	
	
	override method siguienteNivel() {
		return nivel3DeCreditos
	}
	
	
	
	
	
}
