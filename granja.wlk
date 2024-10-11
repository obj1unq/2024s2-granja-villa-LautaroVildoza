import aspersor.*
import wollok.game.*
import cultivos.*
import mercado.*

object granja {
  const property cosas = []

  method ancho() {
    return 10
  }

  method alto() {
    return 10
  }

  method hayEn(posicion) {
    return not game.getObjectsIn(posicion).isEmpty()
  }

  method agregar(cultivo) {
    cosas.add(cultivo)
  }

  method remover(cultivo) {
    cosas.remove(cultivo)
  }
  
}