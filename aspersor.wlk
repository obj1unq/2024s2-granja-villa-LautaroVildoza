import wollok.game.*
import cultivos.*
import hector.*

class Aspersor {
  var property position
  method image() {
    return "aspersor.png"
  }

  method regar() {
    game.schedule(1000, {self.regarLimitrofes()})
  }

  method validarRegarArriba() {
     if (not  game.getObjectsIn(position.up(1)).any({cosa => cosa.puedeRegarse()})){
      self.error("No se puede regar")
      game.say(self, "No se puede regar!")
    }
        position.down(1)
  }

  method validarRegarAbajo() {
     if ( not game.getObjectsIn(position.down(1)).any({cosa => cosa.puedeRegarse()})){
      self.error("No se puede regar")
      game.say(self, "No se puede regar!")
    }
        position.up(1)
  }

  method validarRegarDer() {
    if (not  game.getObjectsIn(position.right(1)).any({cosa => cosa.puedeRegarse()})){
      self.error("No se puede regar")
      game.say(self, "No se puede regar!")
    }
        position.left(1)
  }

  method validarRegarIzq() {
     if ( not game.getObjectsIn(position.left(1)).any({cosa => cosa.puedeRegarse()})){
      self.error("No se puede regar")
      game.say(self, "No se puede regar!")
    }
         position.right(1)
  }

  method regarLimitrofes() {
        self.validarRegarArriba()
        self.regarArriba()
        self.validarRegarDer()
        self.regarDer()
        self.validarRegarAbajo()
        self.regarAbajo()
        self.validarRegarIzq()
        self.regarIzq()
  }

  method regarArriba() {
    position = position.up(1)
    game.uniqueCollider(self).regar()
    position = position.down(1)

  }

  method regarDer() {
    position = position.right(1)
    game.uniqueCollider(self).regar()
    position = position.left(1)
  }

  method regarAbajo() {
    position = position.down(1)
    game.uniqueCollider(self).regar()
    position = position.up(1)
  }

  method regarIzq() {
    position = position.left(1)
    game.uniqueCollider(self).regar()
    position = position.right(1)
  }

  method planta() {
    return false
  }

  method puedeRegarse() {
    return false
  }
}