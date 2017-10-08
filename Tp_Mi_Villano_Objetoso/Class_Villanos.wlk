import Class_Minion.*
import Class_Armas.*
import Class_Ciudad.*

class UserException inherits wollok.lang.Exception {
	constructor(_mensaje) = super(_mensaje)
}
class Villano {
	var ejercitoMinion= []
 	var ciudad
 	var rayoCongelante =new Arma("rayoCongelante",10)
 	

	constructor(_ciudad){
		ciudad=_ciudad
	}
	
	//Ciudad donde vive 
	method viveEn()=ciudad
	
	//Todos los minions que trabajan   
	method ejercitoMinions()= ejercitoMinion
	
	//crear un Nuevo minion 
	method nuevoMinion(){
	var soldado = new Minion(5)
	self.otorgarArma(soldado,rayoCongelante)
	ejercitoMinion.add(soldado)
	}
	// Incorpora un minion
	method nuevoMinion(minion){
		minion.bananas(5)
		self.otorgarArma(minion,rayoCongelante)
		ejercitoMinion.add(minion)
	}

	//Dar un arma a un minion
	method otorgarArma(minion,arma){ 
		
		minion.agregarArmas(arma)
	}
	
	//Dar mas bananas a un minion
	method alimentar (minion,bananas){
		
		minion.agregarBananas(bananas)
	}

	//Nivel de concentracion de 1 minion
	method nivelConcentracion(minion){	
		
		return minion.nivelConcentracion()
	}
	
	// El minion es peligroso?
	method peligroso(minion){	
		
		return minion.peligroso()
	}

	// Hacer que un minion tome el suero
	method aplicarSuero(minion){
		minion.beberSuero()
	}
	//El minion mas util
	method minionMasUtil()=	self.ejercitoMinions().max({x=> x.cantMaldades()})
	
	//Los minions mas inutiles
	method minionInutiles()=self.ejercitoMinions().filter({x=> x.cantMaldades() < 1})
	
}


