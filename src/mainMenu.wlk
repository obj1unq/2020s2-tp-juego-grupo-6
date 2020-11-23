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


object mainMenu {
	
	const board = new BoardGround (image = "board.jpg")
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
 		self.agregarVisual(nuevaPartida)
 		self.agregarVisual(comoJugar)
 		self.agregarVisual(cursor)	
 		self.configurarTeclado()	
 	}
 	
 		method image(){
 			return "amunqUs.png"
 		}
 		
 		method position(){
 			return game.at(2, 8)
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
 	
 	
 	object nuevaPartida{
 		method image(){
 			return "nuevaPartida.png"
 		}
 		
 		method position(){
 			return game.at(2, 7)
 			}
 		
 		method ejecutar(){
 			game.clear()
 			nivel1.iniciar()
 		}
 		

}


	object comoJugar{
		
 		method image(){
 			return "comoJugar.png"
 		}
 		
 		method position(){
 			return game.at(2, 5)
 		}
 		
 		method ejecutar() {
			game.clear()
			game.addVisual(self.image())
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
 		return mainMenu.visualesDelMenu().size() - 2
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
 