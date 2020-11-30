import wollok.game.*
import config.*


class BoardGround {    
	const image     
	
	method image(){
		return image 
	}    
	
	method position(){
		return game.origin()
	}
	
	method teDejaPasar() = true
	
}


class VisualesDelMenu{
	
	method image()
	
	method position()
	
	method ejecutar(){
			game.clear()
	}
	
}

object mainMenu {
	
	const board = new BoardGround (image = "fondoMenu.png")
	const property visualesDelMenu = []
	
	
	method contieneMenu(){
		return not visualesDelMenu.isEmpty()
	}
	
 	method agregarVisual(visual){
 		game.addVisual(visual)
 		visualesDelMenu.add(visual)
 	}
 	
 	method armarMenu(){
 		game.addVisual(board)
 		game.addVisual(titulo)
 		self.agregarVisual(nuevaPartida)
 		self.agregarVisual(comoJugar)
 		self.agregarVisual(misiones)
 		self.agregarVisual(cursor)	
 		self.configurarTeclado()	
 	}
 
 	
 	method getVisualDeMenu(indice){
 		return visualesDelMenu.get(indice).position().left(1)
	
	}	
	
	method configurarTeclado(){
		keyboard.down().onPressDo({ cursor.bajarCursor()})
		keyboard.up().onPressDo({ cursor.subirCursor()})
		keyboard.enter().onPressDo({ cursor.visualIndicada().ejecutar()})
	}

}

	object titulo{
	
 		method image(){
 			return "amunqUs.png"
 		}
 		
 		method position(){
 			return game.at(2, 10)
 		}
}
 	
 	
 	object nuevaPartida inherits VisualesDelMenu{
 		override method image(){
 			return "nuevaPartida.png"
 		}
 		
 		override method position(){
 			return game.at(2, 6)
 			}
 		
 		override method ejecutar(){
			super()
			nivel1.iniciar()
 		}
 		
}


	object comoJugar inherits VisualesDelMenu{
		
 		override method image(){
 			return "comoJugar.png"
 		}
 		
 		override method position(){
 			return game.at(2, 4)
 		}
 		
 		override method ejecutar() {
			super()
			game.addVisual(new BoardGround (image = "fondoComoJugar.jpg"))
			keyboard.backspace().onPressDo({
			game.clear()
			mainMenu.armarMenu()})
	}
	
 }
 
 object misiones inherits VisualesDelMenu{
 	
 	override method image(){
 		return "misiones.png"
 	}
 	
 	override method position(){
 		return game.at(2, 2)
 		
 	}
 	
 	override method ejecutar(){
 		super()
 		game.addVisual(new BoardGround (image = "fondoMisiones.jpg"))
 		keyboard.backspace().onPressDo({
 		game.clear()
 		mainMenu.armarMenu()})
 	}
 	
 }

	object cursor{
		var indice = 0
		var property position = nuevaPartida.position().left(1)
		
	
 		method image(){
 			return "cursor.png"
 	}
 	
 		method principioDelMenu() {
 			return 0
 	}
 	
 	method finalDelMenu() {
 		return 2
 	}
 		
 		method visualIndicada(){
			return game.getObjectsIn(self.position().right(1)).head()
	}

 		method bajarCursor() {
		if (self.puedoBajar()) {
			indice += 1
		} else {
			indice = self.principioDelMenu()
		}
		self.position(mainMenu.getVisualDeMenu(indice))
	}
	
	method subirCursor() {
		if (self.puedoSubir()) {
			indice -= 1
		} else {
			indice = self.finalDelMenu()
		}
		
		self.position(mainMenu.getVisualDeMenu(indice))
	}
	
	method puedoBajar() {
		return indice != self.finalDelMenu() 
	}
	
	method puedoSubir() {
		return indice != self.principioDelMenu() 
	}
	
	
	
}
 