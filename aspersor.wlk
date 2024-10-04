import wollok.game.*
import cultivos.*
import hector.*

class Aspersor {
  var property position
  method image() {
    return "aspersor.png"
  }

  method regar() {
    game.onTick(1000, "Regar cada 1 segundo sentido horario", {//self.validarRegar() and 
    self.regarLimitrofes()})
  }

  //method validarRegar() {
  //  if(not self.validarRegarArriba() and not self.validarRegarAbajo() and not self.validarRegarDer()
  //          and not self.validarRegarIzq()){
  //              self.error("No se puede Regar!")
  //              game.say(self, "No se puede Regar!")
  //          }
  //}

  method validarRegarArriba() {
    position = position.up(1)
    return  game.uniqueCollider(self).planta()
    position = position.down(1)
  }

  method validarRegarAbajo() {
    position = position.down(1)
    return  game.uniqueCollider(self).planta()
  }

  method validarRegarDer() {
    position = position.right(1)
    return  game.uniqueCollider(self).planta()
    position = position.left(1)
  }

  method validarRegarIzq() {
    position = position.left(1)
    return  game.uniqueCollider(self).planta()
    position = position.right(1)
  }

  method regarLimitrofes() {
        self.regarArriba()
        self.regarDer()
        self.regarAbajo()
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
}