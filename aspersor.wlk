import wollok.game.*
import cultivos.*
import hector.*

class Aspersor {
  var property position
  method image() {
    return "aspersor.png"
  }

  method regarAspersor() {
    game.onTick(1000, "regarLimitrofes", {self.regarLimitrofes()})
  }

  method regarLimitrofes() {
      game.getObjectsIn(position.up(1)).forEach({objeto => objeto.regarse()})
      game.getObjectsIn(position.right(1)).forEach({objeto => objeto.regarse()})
      game.getObjectsIn(position.down(1)).forEach({objeto => objeto.regarse()})
      game.getObjectsIn(position.left(1)).forEach({objeto => objeto.regarse()})
  }
  method planta() {
    return false
  }

  method puedeRegarse() {
    return false
  }

  method regarse() {
    }
}