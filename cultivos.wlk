import wollok.game.*
import hector.*

class Maiz {
	var property position
	var property estado = "bebe"
	var property image = "corn_baby.png"

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
}


class Trigo {
	var property position
	var property evolucion = 0
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_0.png"
	}


	method plantar() {
	  return game.addVisual(self)
	}

	method regar() {
	  
	}
	
	method planta() {
	  return true
	}
}

class Tomaco {
  var property position

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
}