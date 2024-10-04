import wollok.game.*
import hector.*
import cultivos.*
import aspersor.*

class Mercado {
  var property position 
  var property monedas 
  var property mercaderia = []  

  method image() {
    return "market.png"
  } 

  method esMercado() {
    return true
  }

  method comprar(precio) {
    monedas -= precio

  }

  method darMercaderia(cosas) {
    mercaderia.addAll(cosas)
  }

  method tieneDineroSuficiente(precio) {
    if (monedas < precio){
        game.say(self, "No tengo dinero para comprarte todo")
    }
  }
}

