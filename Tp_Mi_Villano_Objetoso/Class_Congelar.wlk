import Class_Maldades.*

class Congelar inherits Maldad{
	
	//Reclutar Minions, con nivel base en 500
	method reclutarMinions(){ 
		self.minionsConConcentracion(500)
		minionsAsignados = self.minionsAsignados().filter({minions=> minions.tieneArma("rayoCongelante")})
	}
	//Reclutar Minions, con un nivel diferente
	method reclutarMinions(nivel){
		self.minionsConConcentracion(nivel)
		minionsAsignados = self.minionsAsignados().filter({minions=> minions.tieneArma("rayoCongelante")})
	}
	// Realizar maldad
	/**si cumple la condicion,que haga la maldad, sino solo que salte el error(condicionMaldad()) */
	override method realizarMaldad(){
		if( !minionsAsignados.isEmpty() ){
		villano.viveEn().reducirTemperatura(30)
		self.premiarMinions()
		}else{
		self.noHayMinions()
		}
		super()
	}
}