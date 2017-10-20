import persona.*
import Actitudes.*
class Estudiante inherits Persona {
	var actitudDestacada=0
	var actitudesPosibles=actitudes.actitudes()
	var motivacion=0
 	var recuerdoSignificativo=[]
 
 	
  
 	constructor(_nombre, _actitud, _motivacion, _recuerdo)= super(_nombre){
 		actitudDestacada=_actitud
 		motivacion=_motivacion
  		recuerdoSignificativo=_recuerdo
  		
 	}
 	

//TODO: Actitud Destacada
 	method actitudDestacada()=actitudDestacada
 	method actitudDestacada(_actitud){actitudesPosibles.add(_actitud)}
	
	//Very dificult hacerlo como pide, me pa que no se puede hacer recursividad aca, lo intente :( ... Lo cambie a que tome una actitud aleatoria :) 
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
 		motivacion+= motivacion*_cantidad/100
 	}
	
	

		
//TODO: Consultas
 	method recuerdoAprobo()= recuerdoSignificativo.any({recuerdo=> recuerdo.take(6) == "aprobe"})
 	//esto para la parte donde pide si tiene la palabra aprobe method agresionGraveDeFamiliar(unaAgresion){
	//return familia.contains(unaAgresion.agresor()) and unaAgresion.esGrave() 
 	
 	method buenProfesional()= self.recuerdoAprobo()&& motivacion > 30
 	
 
 	method experiencias(_experiencia,_motivacion){
 		
 		if (self.actitudDestacada() !="indiferente" || motivacion<0){
 				self.recuerdoSignificativo(_experiencia)
 				self.motivacion(_motivacion)
 		}
 	}


}

