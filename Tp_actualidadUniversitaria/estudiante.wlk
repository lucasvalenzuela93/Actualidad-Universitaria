import persona.*

class Estudiante inherits Persona {
	var actitudDestacada=0
	var actitudesPosibles=["buenaonda","predispuesto", "indiferente","solidario","generoso","malaonda"]
	var motivacion=0
 	var recuerdoSignificativo=[]
 
 	
  
 	constructor(_nombre, _actitud, _motivacion, _recuerdo)= super(_nombre){
 		actitudDestacada=_actitud
 		motivacion=_motivacion
  		recuerdoSignificativo=_recuerdo
  		
 	}
 	

//TODO: Actitud Destacada
 	method actitudDestacada()=actitudDestacada
 	method actitudDestacada(_actitud){
 		actitudesPosibles.add(_actitud)
 		actitudDestacada=_actitud
 	}
	
	
	method cambiarActitud(){
		actitudDestacada=  actitudesPosibles.get(0.randomUpTo(actitudesPosibles.size()-1))
		return actitudDestacada
	}
 	
//TODO: Recuerdo Significativo
 	method recuerdoSignificativo()=recuerdoSignificativo
 	method recuerdoSignificativo(_recuerdo){recuerdoSignificativo.add(_recuerdo)}
 	
 //TODO:Recuerdo que aprobo

 	

 	
 //TODO: Motivacion
 	 method motivacion()= motivacion
 	 method motivacion(_cantidad){
 		motivacion+= _cantidad
 	}
	
	

		
//TODO: Consultas
 	
	method recuerdoAprobo()= recuerdoSignificativo.any({recuerdo=> recuerdo.startsWith("aprobe")})

 	
 	method buenProfesional()= self.recuerdoAprobo()&& motivacion > 30
 	
 
 	method experiencias(_experiencia,_motivacion){
 		
 		if (self.actitudDestacada() !="indiferente" || motivacion<0){
 				self.recuerdoSignificativo(_experiencia)
 				self.motivacion(_motivacion)
 		}
 	}


}

