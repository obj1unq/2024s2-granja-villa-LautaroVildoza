import wollok.game.*
import hector.*
import granja.*


class Maiz {
	var property position
	var property estado = bebe
	var property image = "corn_" + estado.image() + ".png"
	const property precio = 150

	method plantar() {
		game.addVisual(self)
	}

	method regar() {
		estado.regar()
		 image = "corn_" + estado.image() + ".png"
	}

	method regarse() {
	  self.regar()
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
	  if (estado.esCosechable()){
		self.error("No esta lista para cosechar")
		game.say(self, "No esta lista para cosechar")
	  }
	}

	method puedeRegarse() {
    	return true
  }
}

object bebe {
	var property image = "baby"

  method regar() {
		  image = "adult"
  }
  method esCosechable() {
	return false
  }
}

object adulta {
  const property image = "adult"

  method regar() {}

  method esCosechable() {
	return true
  }
}

class Trigo {
	var etapaDeEvolucion = 0
	var property position
	var property evolucion = 0
	var property image = "wheat_"+ self.etapaDeEvolucion()+".png"

	method etapaDeEvolucion() {
	  return etapaDeEvolucion
	}

	method plantar() {

	  return game.addVisual(self)
	}

	method regar() {
	  etapaDeEvolucion = (etapaDeEvolucion + 1) % 4
	  image =  "wheat_"+ self.etapaDeEvolucion()+".png"
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

	method puedeRegarse() {
    return true
  }

  method regarse() {
	  self.regar()
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
	self.validarRegarP(position)
	  position = position.up(1)
	}

	method validarRegarP(posicion) {
		const posicionA = position.up(1)
	  if (posicionA.y() == (granja.alto()) or !game.getObjectsIn(posicionA).isEmpty()){
		self.error("No puedo moverme para arriba")
		game.say(self, "No puedo moverme para arriba")
		}
	}

	method cosechar() {
		self.validarCosechar()
	  game.removeVisual(self)
	}

	method validarCosechar() {}

	method puedeRegarse() {
    	return true
  }

  method regarse() {
	  self.regar()
	}
}