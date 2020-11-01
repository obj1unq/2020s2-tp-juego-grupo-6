import wollok.game.*
import player.*
import paredes.*
import misiones.*
import enemigos.*
import nave.*

object nivel1 {

	method iniciar() {
		config.configurarTeclas()
		config.agregarParedes()
		const tripulante1 = new Tripulante(position = game.at(8, 9))
		game.addVisual(tripulante1)
		nave.agregarEnemigo(tripulante1)
		game.onTick(1000, "Enemigo se mueve", {=> tripulante1.caminar(tripulante1.moverseRandom())})
		const tripulante2 = new Tripulante(position = game.at(0, 10))
		game.addVisual(tripulante2)
		nave.agregarEnemigo(tripulante2)
		game.onTick(1000, "Enemigo se mueve", {=> tripulante2.caminar(tripulante2.moverseRandom())})
		const tripulante3 = new Tripulante(position = game.at(10, 0))
		game.addVisual(tripulante3)
		nave.agregarEnemigo(tripulante3)
		game.onTick(1000, "Enemigo se mueve", {=> tripulante3.caminar(tripulante3.moverseRandom())})
			// config.musica()					
		config.configurarColisiones()
		config.tiempoDeJuego(60)
	}

}

object config {

    const property posiciones = [
        [1, 0], [1, 2], [1, 6], [1, 8], [2, 0], [2, 2], [2, 6], [2, 8], [2, 9], [2, 10], [3, 0],
        [3, 2], [3, 6], [4, 0], [4, 2], [4, 6], [4, 8], [4, 9], [4, 10], [5, 0], [5, 2], [5, 6],
        [5, 8], [6, 0], [6, 2], [6, 3], [6, 4], [6, 6], [6, 8], [6, 9], [6, 10], [6, 11], [7, 0],
        [7, 4], [7, 6], [8, 0], [8, 1], [8, 3], [8, 4], [8, 5], [8, 6], [8, 6], [8, 7], [8, 8],
        [8, 9], [9, 6], [10, 4], [10, 6], [11, 6]
    ]

	var property tiempoDeJuego = 1000

	method configurarTeclas() { // rompe encapsulamiento
		keyboard.left().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().left(1))})
		keyboard.right().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().right(1))})
		keyboard.up().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().up(1))})
		keyboard.down().onPressDo({ player.irASiSeMantieneEnLaPantalla(player.position().down(1))})
		keyboard.a().onPressDo({ player.atacar(player.tripulanteColosionado())})
		keyboard.s().onPressDo({ player.sabotear()})
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

	method agregarTiempoDeJuego() {
		tiempoDeJuego += 500
	}

	method agregarParedes() {
        posiciones.forEach {
            posicion =>
                const ubicacion = new Position(x=posicion.get(0), y=posicion.get(1))
                game.addVisualIn(new Pared(), ubicacion)
        }
	}

}

