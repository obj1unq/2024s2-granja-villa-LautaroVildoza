import aspersor.*
import wollok.game.*
import cultivos.*
import mercado.*

object hector {
	var property position = game.center()
	const property canasta = []
	var oro =  0

	const property image = "player.png"
	method sembrarTrigo() {
	   self.sembrar(new Trigo(position = self.position()))
	}

	//Sembrar
	method sembrarTomaco() {
	  self.sembrar(new Tomaco(position = self.position()))
	}

	method sembrarMaiz() {
	  self.sembrar(new Maiz(position = self.position()))
	}
	method sembrar(cultivo) {
		self.validarSembrar(self.position())
		 cultivo.plantar()
	}

	method validarSembrar(posicion) {
	  if( self.hayPlantas(posicion)){
		self.error("Ya hay una planta aqui!")
		game.say(self, "Ya hay una planta aqui!")
	  }
	}
	//Regar
	method regar() {
		self.validarRegar(self.position())
	  	//game.uniqueCollider(self).validarRegarP(self.position())
	  	game.uniqueCollider(self).regar()
	  	game.say(self, "ya lo regue")
	}

	//Validaciones
	method validarRegar(posicion) {
	 if( not self.hayPlantas(posicion)){
		game.say(self, "No tengo nada para regar")
	  }
	}

	method hayPlantas(posicion){
	  return game.getObjectsIn(posicion).any({cosa => cosa.planta()})
	}

	method planta() {
	  return false
	}

	method validarCosechar(posicion) {
	  if( not self.hayPlantas(posicion)){
		game.say(self, "No tengo nada para cosechar")
	  }
	}

	//Cosechar
	method cosechar() {
		 self.validarCosechar(self.position())
		 const planta = game.uniqueCollider(self)
		 planta.cosechar()
		 canasta.add(planta)
	}


	//Venta
	method vender() {
		const mercado = game.uniqueCollider(self)
		const precioTotal = canasta.sum({cosa => cosa.precio()})
		self.validarVenta(mercado)
		mercado.validarCompra(precioTotal)
		mercado.comprar(precioTotal)
		mercado.darMercaderia(self.canasta())
	  	oro += precioTotal
		canasta.clear()
	}

	method cantOroYCantPlantas() {
	   game.say(self, "Tengo" + oro + "monedas y" + canasta.size() + "plantas para vender!")
	}

	method validarVenta(mercado) {
	 	if(not mercado.esMercado()){
			game.say(self, "No estoy en un mercado")
			self.error("No estoy en un mercado")
	  }
	}

	method oro() {
	  return oro
	}

	//Aspersores
	method colocarAspersor() {
	  self.validarSembrar(self.position())
	  const aspersor = new Aspersor(position = self.position())
	  game.addVisual(aspersor)
	  aspersor.regar()
	}

	method puedeRegarse() {
	  return false
	}
}