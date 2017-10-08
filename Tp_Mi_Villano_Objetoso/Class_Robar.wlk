import Class_Maldades.*
import Class_Villanos.*
import Class_Armas.*
import Objetos_Robar.*

class Robar inherits Maldad{
	
	// Minions con concentracion
	/** Modificado, los minions que se asigan son los que tienen concentracion X y que sean peligrosos */
	override method minionsConConcentracion(nivel){
		super(nivel)
		minionsAsignados = minionsAsignados.filter({minion=> villano.peligroso(minion)})
	}
	
	//Quitar de la ciudad lo que se robaron
	method seRobaron(maravilla){
		villano.viveEn().seRobaron(maravilla)
	}

	
	//Robar piramide
	method robarPiramide(){
			self.minionsConConcentracion( self.mitadPiramide() )
			
			if(!minionsAsignados.isEmpty()){
			self.premiarMinions()
			self.seRobaron(piramides)
			self.minionsAsignados().forEach({minion=>minion.agregarMaldad()})
			} else{
				self.noHayMinions()
			}
		
	}
	
	//Dar la medida de la piramide
	method mitadPiramide(){
		return piramides.altura().div(2)
	}
	
	//Minions calificados para robar suero
	method minionsParaSuero(){
		self.minionsConConcentracion(23)
		minionsAsignados=minionsAsignados.filter({_minion=> _minion.bananas()>100})
	}
	
	//Robar Suero
	method robarSuero(){
		self.minionsParaSuero()
		if(!minionsAsignados.isEmpty()){
			
			villano.ejercitoMinions().forEach({x=> villano.aplicarSuero(x)})
			self.seRobaron(sueroMutante)	
			self.minionsAsignados().forEach({minion=>minion.agregarMaldad()})		
		
		}else{
			
			self.noHayMinions()
		
		}
	}
	
	
	//Recluta especiales para La Luna
	method minionsParaLuna(){
		self.minionsConConcentracion(0)
		minionsAsignados = minionsAsignados.filter({x=> x.tieneArma("rayo para enconger")})
	}
	
	//Robar Luna
	method robarLuna(){
		
			self.minionsParaLuna()
			
		if(!minionsAsignados.isEmpty()){
			
			const armaCongelante = new Arma("rayoCongelante",10)
			villano.viveEn().reducirTemperatura(15)
			minionsAsignados.forEach({x=> x.agregarArmas(armaCongelante)})
			self.seRobaron(laLuna)
			self.minionsAsignados().forEach({minion=>minion.agregarMaldad()})
			
			}else{
				
				self.noHayMinions()
			
			}
		}
	
	// Realizar maldad,
	/**Modificado para Robar,segun el objeto, 
	se realizara siempre que la ciudad tenga el objeto a robar */
	override method realizarMaldad(){
		if(villano.viveEn().tieneMaravilla(piramides)){
			self.robarPiramide()
		}
		if(villano.viveEn().tieneMaravilla(laLuna)){
			self.robarLuna()
		}
		if(villano.viveEn().tieneMaravilla(sueroMutante)){
			self.robarSuero()
		}
		
	}
	
	
	
}

