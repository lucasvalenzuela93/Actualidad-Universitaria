import Class_Villanos.*
import Class_Armas.*
import Class_Minion.*
import Objetos_Robar.*

class Maldad {
	
	var villano
	var minionsAsignados=[]
	
	constructor (_villano){
		villano=_villano
		}
	
	//Condicion para hacer todas las maldades
	method condicionMaldad(){
		if( minionsAsignados.isEmpty() ){
			error.throwWithMessage("no se puede realizar maldad,no hay minions Asignados")
			return false
		}else{
			return true
		}
	}
	
	//mostrarMinionsAsignados
	method minionsAsignados()=minionsAsignados
	//Premiar minions
	method premiarMinions(){
		self.minionsAsignados().forEach({minion=>villano.alimentar(minion.nombre(),10)})
	}
	
	//Realizar Maldad
	method realizarMaldad(){
		self.minionsAsignados().forEach({minion=>minion.agregarMaldad()})
	}

	
}

class Congelar inherits Maldad{
	
	//Reclutar Minions, con nivel base en 500
	method reclutarMinions(){ 
		minionsAsignados.addAll(villano.requisitosCongelarConNivel(500))
	}
	//Reclutar Minions, con un nivel diferente
	method reclutarMinions(nivel){
		minionsAsignados.addAll(villano.requisitosCongelarConNivel(nivel))
	}
	// Realizar maldad
	/**si cumple la condicion,que haga la maldad, sino solo que salte el error(condicionMaldad()) */
	override method realizarMaldad(){
		if(self.condicionMaldad()){
		villano.viveEn().reducirTemperatura(30)
		self.premiarMinions()
		super()
		}
	}
	
}

class Robar inherits Maldad{
	
	//Reclutar minion Peligrosos con nivel de Concentracion
	method minionsPeligrososConNivel(nivel){ 
		minionsAsignados.addAll(villano.requisitosRobarConNivel(nivel))
	}
	//Quitar de la ciudad lo que se robaron
	method seRobaron(maravilla){
		villano.viveEn().seRobaron(maravilla)
	}
	
	//Robar piramide
	method robarPiramide(){
		self.minionsPeligrososConNivel( self.mitadPiramide() )
		//Villano vive en la ciudad que tiene una piramide? y Cumple Condicion?
		if(villano.viveEn().tiene().contains(piramides) && self.condicionMaldad() ){
			self.premiarMinions()
			self.seRobaron(piramides)
			self.minionsAsignados().forEach({minion=>minion.agregarMaldad()})
			
		}
	}
	
	//Dar la medida de la piramide
	method mitadPiramide(){
		return piramides.altura().div(2)
	}
	
	//Filtrar minions con mas de 100 bananas
	method minionsBienAlimentados(minions){
		minionsAsignados.filter({_minion=> _minion.cantBananas()>100})
	}
	//Minions calificados para robar suero
	method minionsParaSuero(){
		self.minionsPeligrososConNivel(23)
		minionsAsignados=minionsAsignados.filter({_minion=> _minion.cantBananas()>100})
	}
	
	//Robar Suero
	method robarSuero(){
		//Villano vive en la ciudad que tiene una Suero? Y Cumple condicion?
		self.minionsParaSuero()
		
		if(villano.viveEn().tiene().contains(sueroMutante) && self.condicionMaldad() ){
			villano.mostrarMinions().forEach({x=> x.beberSuero()})
			self.seRobaron(sueroMutante)	
			self.minionsAsignados().forEach({minion=>minion.agregarMaldad()})		
		}
	}
	
	//Recluta especiales para La Luna
	method minionsParaLuna(){
		self.minionsPeligrososConNivel(0)
		minionsAsignados.filter({x=> x.armas().contains("rayo para enconger")})
	}
	
	//Robar Luna
	method robarLuna(){
		self.minionsParaLuna()
		if(villano.viveEn().tiene().contains(laLuna) && self.condicionMaldad() ){
			villano.viveEn().reducirTemperatura(15)
			const armaCongelante = new Arma("rayoCongelante",10)
			villano.mostrarMinions().forEach({x=> x.agregarArmas(armaCongelante)})
			self.seRobaron(laLuna)
			self.minionsAsignados().forEach({minion=>minion.agregarMaldad()})
			
		}
	}
	
	override method realizarMaldad(){
		self.robarPiramide()
		
		self.robarLuna()
		
		self.robarSuero()
		
		
	}
	
	
	
}

