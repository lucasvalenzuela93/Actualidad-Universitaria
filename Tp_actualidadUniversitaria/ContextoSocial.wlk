class ContextoHipotetico {
	
	var contexto=[]
	method contexto(_contexto,indicador){
		//Si ya existia, que lo borre (enrealidad lo pisa)
		contexto = contexto.filter({x => x.first()!=_contexto})
		contexto.add([_contexto,indicador])
	}
	//Contexto
	method contexto()=contexto
	
	// Segun el contexto(string), que devuelva el indicador
	method indicador(_contexto){

		return contexto.filter({x => x.contains(_contexto)}).flatten().last()
	}
}