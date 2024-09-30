import wollok.game.*
import cultivos.*


object hector {
	var property position = game.center()
	const property image = "player.png"
	method sembrarTrigo() {
	   self.sembrar(new Trigo(position = self.position()))
	}

	method sembrarTomaco() {
	  self.sembrar(new Tomaco(position = self.position()))
	}

	method sembrarMaiz() {
	  self.sembrar(new Maiz(position = self.position()))
	}
	method sembrar(cultivo) {
		 cultivo.plantar()
	}

	method regar() {
	  self.validarRegar(self.position())
	  game.uniqueCollider(self).regar()
	  game.say(self, "ya lo regue")
	}

	method validarRegar(posicion) {
	 if( not self.hayPlantas(posicion)){
		game.say(self, "no+tengo+nada+para+regar")
	  }
	}

	method hayPlantas(posicion){
	  return game.getObjectsIn(posicion).any({cosa => cosa.planta()})
	}

	method planta() {
	  return false
	}

	method cosechar() {
	}

}