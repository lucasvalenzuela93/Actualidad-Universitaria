
class Maldad {
	
	var villano
	var minionsAsignados=[]
	
	constructor (_villano){
		
		villano=_villano
		
		}
	
	//Condicion para hacer todas las maldades
	method noHayMinions(){
		
		error.throwWithMessage("no se puede realizar maldad,no hay minions Asignados")
	
	}
	
	//Coleccion de minions con nivel de concentracion x
	method minionsConConcentracion(nivel){
		
		minionsAsignados = villano.ejercitoMinions().filter({minion=> villano.nivelConcentracion(minion)>= nivel})
	
	}
	
	//mostrarMinionsAsignados
	method minionsAsignados()=minionsAsignados
	
	//Premiar minions
	method premiarMinions(){
		
		self.minionsAsignados().forEach({minion=>villano.alimentar(minion,10)})
	
	}
	
	//Realizar Maldad
	method realizarMaldad(){
		
		self.minionsAsignados().forEach({minion=>minion.agregarMaldad()})
	
	}

	
}

