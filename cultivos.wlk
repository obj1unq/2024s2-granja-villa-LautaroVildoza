import wollok.game.*
import hector.*

class Maiz {
	var property position
	var property estado = "bebe"
	var property image = "corn_baby.png"
	const property precio = 150

	method plantar() {
		game.addVisual(self)
	}

	method regar() {
		if (self.esBebe()){
			estado = "adulta"
			image = "corn_adult.png"
		}
	}

	method esBebe() {
	  return self.estado() == "bebe"
	}

	method planta() {
	  return true
	}

	method validarRegarP(posicion) {}

	method cosechar() {
	  self.validarCosechar()
	  game.removeVisual(self)
	}

	method validarCosechar() {
	  if (self.esBebe()){
		self.error("No esta lista para cosechar")
		game.say(self, "No esta lista para cosechar")
	  }
	}
}


class Trigo {
	var etapaDeEvolucion = 0
	var property position
	var property evolucion = 0

	method etapaDeEvolucion() {
	  return etapaDeEvolucion
	}

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_"+ self.etapaDeEvolucion()+".png"
	}


	method plantar() {

	  return game.addVisual(self)
	}

	method regar() {
	  etapaDeEvolucion = (etapaDeEvolucion + 1) % 4
	  return "wheat_"+ self.etapaDeEvolucion()+".png"
	}
	
	method planta() {
	  return true
	}

	method validarRegarP(posicion) {}

	method cosechar() {
	  self.validarCosechar()
	  game.removeVisual(self)
	}

	method validarCosechar() {
	  if ( etapaDeEvolucion < 2){
		self.error("No esta lista para cosechar")
		game.say(self, "No esta lista para cosechar")
	  }
	}

	method precio() {
	  return (etapaDeEvolucion - 1) * 100
	}
}

class Tomaco {
  	var property position
	const property precio = 80 
	
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco.png"
	}

	method plantar() {
	  return game.addVisual(self)
	}

	method planta() {
	  return true
	}

	method regar() {
		//self.validarRegarP(posicion)
	  position = position.up(1)
	}

	method validarRegarP(posicion) {
	  if (posicion != (game.width() - 1)){
		self.error("No puedo moverme para arriba")
		game.say(self, "No puedo moverme para arriba")
		}
	}

	method cosechar() {
		self.validarCosechar()
	  game.removeVisual(self)
	}

	method validarCosechar() {}
}