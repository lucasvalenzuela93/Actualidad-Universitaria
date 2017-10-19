class Contexto {
	var situacion=0
	var nivel=0
	
	constructor(_situacion,_nivel){
		situacion=_situacion
		nivel=_nivel
	}
	
	method situacion(){return situacion}
	method situacion(_situacion){
		situacion=_situacion
	}
	
	method nivel(){return nivel}
	method nivel(_situacion){
		situacion=_situacion
	}
	
}

//Devuelve el nivel de un determinado contexto
class ContextoHipotetico {
	var contextoHipotetico=[]
	
	method contexto(){return contextoHipotetico}
	method contexto(_contexto){
		contextoHipotetico.add(_contexto)
	}
	
	method nivelContexto(_contexto){
		return _contexto.nivel()
	}
}