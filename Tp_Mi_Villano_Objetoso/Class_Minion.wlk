class Minion {

	var color="Amarillo"
	var bananas=0
	var listaArmas=[]
	var maldades=0

	constructor(_bananas){
		bananas=_bananas
	}
		
	//Color del minion
	method color()=color
	
	// Fija color
	method color(_color){color=_color}
	
	//Cantidad de bananas
	method bananas()=bananas
	
	//Fijar bananas en X
	method bananas(x){ bananas = x}
	
	//Armas del minion
	method armas()=listaArmas
	
	//Hacer que coma 1 banana
	method comerBanana(){ 
		if(bananas>0){
		bananas-=1
		}else{
			bananas=0
		}
	}
	
	//Agregar bananas 
	method agregarBananas(_bananas){
		
		bananas+=_bananas
	
	}
	
	//Agregar que hizo una maldad
	method agregarMaldad(){
		maldades+=1
	}
	// Cantidad de maldades
	method cantMaldades()= maldades
	
	
	//Agregar armas 
	method agregarArmas(arma){
		
		self.armas().add(arma)
	
	}
	
	//Preguntar si tiene un arma
	method tieneArma(nombreArma){
		
		return self.armas().map({x=>x.nombre()}).contains(nombreArma)
		
	}
	
	//Preguntar si es peligroso 
	method peligroso()= self.armas().size()>2||color==1
	
	//Hacer que tome el suero
	method beberSuero(){
		if(color=="Amarillo"){
			
			self.color("Violeta")
			self.comerBanana()
			listaArmas=[]
			
			}else{
				
		if(color=="Violeta"){
			
			self.color("Amarillo")
			self.comerBanana()
			
			}		
		}
	}
	/** si es violeta y toma el suero se vuelve verde por falta de potancio,
		entonces come 100 bananas y su nivel de concentracion es 0.
		Cuando vuelve a tomar el suero,tarda unos dias en volverse amarillo
		durante la transicion se vuelve loco por las tener bananas, es por eso, 
		que obtiene 1000 bananas.  

	(Si se testea, saldra una falla ya que un minion violeta pasa a ser verde.)

	La solucion seria:
	
	method beberSuero(){
		if(color=="Amarillo"){
			color="Violeta"
			self.comerBanana()
			listaArmas=[]
		}else{
			if(color=="Violeta"){
				color="Verde"
				100.times({self.comerBanana()})
			}else{
				if(color=="Verde"){
				color="Amarillo"
				self.agregarBananas(1000)
				}
			}
		
		}
	}

	
	Esto es Abstraccion, el objeto cambia de estados amarillo, verde, violeta, 
	pero aun asi sigue siendo un minion que puede robar y congelar ciudades, ser peligroso etc.
	

	En caso de que no pueda volver a ser amarillo, sera siempre peligroso.
	 Pero todas las demas tareas, metodos o lo que haga sera las mismas
	 */
	
	
	// Poder del arma mas Poderosa
	method poderArmaMasPoderosa(){
		if (self.armas().isEmpty()){
			return 0
		}else{
		return self.armas().max({arma=> arma.poder() }).poder()
	}
	}
	//Nivel de concentracion
	method nivelConcentracion(){
		if(self.color()=="Amarillo"){
			return self.bananas()+ self.poderArmaMasPoderosa()
		}else
			if(self.color()=="Violeta"){
				return self.bananas()
		}else{
			return 0
		}
	}

	
}
