class Minion {
	var nombre=""
	var color=""
	var bananas=0
	var armamento=[]



	
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
	
	//Agregar armas 
	method agregarArmas(arma){
		armamento.add(arma)
	}
	
	//Preguntar si tiene un arma
	/** la constante nombreArma debe ser un string */
	method tieneArma(nombreArma){
		return self.armas().map({x=>x.nombre()}).contains(nombreArma)
	}
	
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
