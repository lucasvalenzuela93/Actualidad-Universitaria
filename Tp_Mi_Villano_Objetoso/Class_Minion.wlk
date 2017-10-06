class Minion {
	var nombre=""
	var color=""
	var bananas=0
	var armamento=[]
	var maldades=0



	
	constructor(_nombre,_color,_bananas,_armamento){
		nombre=_nombre
		color=_color
		bananas=_bananas
		armamento.add(_armamento)
		
	}
	//Muestra nombre del Minion
	method nombre()=nombre
	
	//Muestra color del minion
	method color()=color
	
	//Muestra cantidad de bananas
	method cantBananas()=bananas
	
	//Muestra las armas del minion
	method armas()=armamento
	
	//Hacer que coma 1 banana
	method comerBananas(){ bananas-=1}
	
	//Agregar bananas 
	method agregarBananas(_bananas){bananas+=_bananas}
	
	//Agregar que hizo una maldad
	method agregarMaldad(){
		maldades+=1
	}
	// Mostrar Maldad
	method mostrarMaldades()= maldades
	
	
	//Agregar armas 
	method agregarArmas(arma){
		armamento.add(arma)
	}
	
	//Preguntar si tiene un arma
	/** la constante nombreArma debe ser un string */
	method tieneArma(nombreArma){
		return self.armas().map({x=>x.nombre()}).contains(nombreArma)}
	
	//Preguntar si es peligroso 
	method peligroso()= armamento.size()>2||color==1
	
	//Hacer que tome el suero
	method beberSuero(){
		if(color=="Amarillo"){
			color="Violeta"
			self.comerBananas()
			armamento=[]
		}else{
			if(color=="Violeta"){
				color="Amarillo"
				self.comerBananas()
			}		
		}
	}
	/** si es violeta y toma el suero se vuelve 
		verde y esta muy hambriento se come 100 bananas 	
		Cuando vuelve a tomar el suero,tarda unos dias en volverse amarillo
		durante la transicion se vuelve loco por las tener bananas, es por eso, 
		que obtiene 1000 bananas.  

	method beberSuero(){
		if(color=="Amarillo"){
			color="Violeta"
			self.comerBananas()
			armamento=[]
		}else{
			if(color=="Violeta"){
				color="Verde"
				100.times({self.comerBananas()})
			}else{
				if(color=="Verde"){
				color="Amarillo"
				self.agregarBananas(1000)
				}
			}
		
		}
	}
	Esto es Polimorfismo, el objeto cambia de estados amarillo, verde, violeta, 
	pero aun asi sigue siendo un minion que puede robar y congelar ciudades, ser peligroso etc.
	

	En caso de que no pueda volver a ser amarillo, sera siempre peligroso.
	 Pero todas las demas tareas, metodos o lo que haga sera las mismas
	 */
	
	//Preguntar su nivel de concentracion
	method nivelConcentracion(){
		if(color=="Amarillo"){
			return self.cantBananas()+ (armamento.max({arma=> arma.poder()})).poder()
		}else
			if(color=="Violeta"){
				return self.cantBananas()
		}else{
			return 0
		}
	}

	
}
