import Class_Villanos.*
import Class_Armas.*
import Class_Minion.*


class Maldad {
	
	var villano
	
	constructor (_villano){
		villano=_villano
		}
	
	//Condicion para hacer todas las maldades
	method condicionMaldad(){
		if( !villano.mostrarMinions().isEmpty() ){
			error.throwWithMessage("Debe haber minions Asignados")
			return villano.mostrarMinions().isEmpty()
		}else{
			return villano.mostrarMinions().isEmpty()
		}
	}
	
	//Premiar minions
	method premiarMinions(){
		villano.mostrarMinions().forEach({x=>x.alimentar(10)})
	}
}

class Congelar inherits Maldad{

	method reclutarMinions()= villano.requisitosCongelar(500)
	method reclutarMinions(nivel)= villano.requisitosCongelar(nivel)
	
	
}

class Robar inherits Maldad{
	
}

