import wollok.game.*
import cultivos.*


object hector {
	var property position = game.center()
	const property canasta = []

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

}