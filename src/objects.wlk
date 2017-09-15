class UserException inherits wollok.lang.Exception {
constructor ( _mensaje ) = super ( _mensaje )
}


class ArbolNavidad {
	var edadArbol=0
	var tamTronco=0
	var conjCosas=[]


	method vejez()= edadArbol
	method vejez(_edadArbol){ edadArbol = _edadArbol}
	
	
	method tamanioTronco()= tamTronco
	method tamanioTronco(_tamTronco){ tamTronco= _tamanoTronco}
	
	
	method capacidad()= tamTronco*edadArbol
	
	method elementos()= conjCosas
	
	method elementos(_objeto) {
        if ( self.capacidad() <= conjCosas.fold(0,{acum, lugar => acum + lugar.lugaresArbol() } ) ){
			
            throw new UserException ( "El arbol esta lleno" )
        }else{
        	conjCosas.add(_objeto)
        }  
    }

    method objSumanImp()=   	
    	conjCosas.filter({ imp => imp.estaColgado()})

	method importancia()= self.objSumanImp().fold(0,{acum, imp => acum + imp.importancia()})
    
    
    method promImportancia()= self.importancia() / self.objSumanImp().size()
    
    method objMayorImp()=
    	conjCosas.filter({imp => imp.importancia() > self.promImportancia()})
    
    method cantMayorImp() = self.objMayorImp().size()
	
	method elimVoluminosos()=
			conjCosas.forEach({objeto => if (objeto.lugaresArbol() > 5 ){conjCosas.remove(objeto)}})
	
	
	// mapeo de los articulos a destinatarios
	method mapDestinatario()=conjCosas.flatMap({adorno1 => adorno1.destinatario()})

	//filtrar solo un destinatario (Coleccion)
	method colMenDest(x)= self.mapDestinatario().filter({y => y == _x})
	
	//cantidad de veces mencionado
	method cantMismDest(_y)=self.colMenDest(_y).size()
	
	//Condicion
	method menMayor(_mayor,_menor)= self.cantMismDest(_mayor) >self.cantMismDest(_menor)
	//Sacar repetidos
	method destSinRep()= self.mapDestinatario().asSet()
	//Destinatarios!!! 
	method destinatario() = self.destSinRep().sortedBy({x,y=>self.menMayor(x,y)})
	
	}	    
	
class Regalos{
	var conjdest = []
	var ocupa = 1
	//estado 1=Colgado, para cualquier otro no lo esta
	var colgado= 1
	
	method estaColgado(){return colgado==1} 
	method estaColgado(_alpiso){colgado=_alpiso}
		
	method destinatario(_destinatario){ conjdest.add(_destinatario)}
	
	method destinatario(){ return conjdest}
	
	method importancia()= conjdest.size()*2
		
	method lugaresArbol()= ocupa 
}

class Tarjetas{
	var dest
	var imp=0
	var ocupa=0
	//estado 1=Colgado, para cualquier otro no lo esta
	var colgado= 1
	
	method estaColgado(){return colgado==1} 
	method estaColgado(_alpiso){colgado=_alpiso}
	
	method destinatario(_destinatario){dest=_destinatario}
	method destinatarios()=[dest]
	
	method importancia(_importancia){ imp = _importancia}
	method importancia()= imp

	method lugaresArbol()=ocupa
} 

class Adornos{
	var peso=0
	var cSup=0

	
	//estado 1=Colgado, para cualquier otro no lo esta
	var colgado= 1
	
	method estaColgado(){return colgado==1} 
	method estaColgado(_alpiso){colgado=_alpiso}
	
	method destinatarios()= []
	
	
	method pesoBase(_peso){ peso=_peso }
	method pesoBase()=peso
	
	method coefSup(_coef){cSup=_coef}
	method coefSup()=cSup
	
	method importancia()= cSup*peso
	
	method lugaresArbol()=	3.min(peso)
		 
}

class Figuras {

	var conjAdornos=[]

	//estado 1=Colgado, para cualquier otro no lo esta
	var colgado= 1
	
	method estaColgado()= colgado==1 
	method estaColgado(_alpiso){colgado=_alpiso}
	
	method destinatario()=destinatario
	
	method adorno(_adorno){ 
		conjAdornos.add(_adorno)
	}

	method adorno()=conjAdornos
	
	// mapear los adornos por sus importancias
	method mapImportancia()=conjAdornos.map({adorno1 => adorno1.importancia()})
	method importancia()= self.mapImportancia().max()
		
	method lugaresArbol()= conjAdornos.fold(1,{acum,ocupar=>acum+ocupar.lugaresArbol()})
	
}

 object estrellaDeBelen {
    var ocupa = 1
    var imp = 10
    var conjDest = []
	var colgado= 1
	
	method estaColgado()= colgado==1 
         
    method lugaresArbol() = ocupa
    method importancia()= imp
    method destinatario() = conjDest
    method destinatario(_destinatario){
        conjDest.add(_destinatario)
    }

}




