class Estudiante {
	var nombre=0
 	var actitudDestacada=0
 	var motivacion=0
 	var recuerdoSignificativo=[]
  
 	constructor(_nombre, _actitud, _motivacion, _recuerdo){
 		nombre=_nombre
 		actitudDestacada=_actitud
 		motivacion=_motivacion
 		recuerdoSignificativo=_recuerdo
 	}
 	
 	method nombre()=nombre
 	
 	method actitudDestacada()=actitudDestacada
 	method actitudDestacada(_actitud){actitudDestacada=_actitud}
 	
 	method motivacion()= motivacion
 	method motivacion(_motivacion){motivacion=_motivacion}
 	
 	method recuerdoSignificativo()=recuerdoSignificativo
 	method recuerdoSignificativo(_recuerdo){recuerdoSignificativo.add(_recuerdo)}
 	
 	//esto para la parte donde pide si tiene la palabra aprobe method agresionGraveDeFamiliar(unaAgresion){
		//return familia.contains(unaAgresion.agresor()) and unaAgresion.esGrave() 
 
 
}