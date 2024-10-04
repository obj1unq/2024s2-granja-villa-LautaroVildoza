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

  method validarCompra(precio) {
    if (self.monedas() < precio){
        game.say(self, "No tengo dinero para comprarte todo")
        self.error("No tengo dinero para comprarte todo")
    }
  }
}

