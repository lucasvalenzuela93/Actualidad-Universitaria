class UserException inherits wollok.lang.Exception {
constructor ( _mensaje ) = super ( _mensaje )
}


class ArbolNavidad {
	var edadArbol=0
	var tamTronco=0
	var conjCosas=[]

	constructor(_edadArbol,_tamTronco,_conjCosas){
		edadArbol=_edadArbol
		tamTronco=_tamTronco
		conjCosas=_conjCosas		
	}

	method vejez()= edadArbol
	method vejez(_edadArbol){ edadArbol = _edadArbol}
	
	
	method tamanioTronco()= tamTronco
	method tamanioTronco(_tamTronco){ tamTronco= _tamTronco}
	
	
	method capacidad()= tamTronco*edadArbol
	
	method elementos()= conjCosas
	
	method elementos(_objeto) {
        if ( self.capacidad() < conjCosas.sum({lugar => lugar.lugaresArbol() } ) ){
			
            throw new UserException ( "El arbol esta lleno" )
        }
        	conjCosas.add(_objeto)
          
    }

    method objSumanImp()=   	
    	conjCosas.filter({ imp => imp.estaColgado()})

	method importancia()= self.objSumanImp().sum({x=>x.importancia()})
    
    
    method promImportancia()= self.importancia() / self.objSumanImp().size()
    
    method objMayorImp()=
    	conjCosas.filter({imp => imp.importancia() > self.promImportancia()})
    
    method cantMayorImp() = self.objMayorImp().size()
	
	method elimVoluminosos()=
			conjCosas.forEach({objeto => if (objeto.lugaresArbol() > 5 ){conjCosas.remove(objeto)}})
	
	
	// mapeo de los articulos a destinatarios
	method mapDestinatario()=conjCosas.flatMap({adorno1 => adorno1.destinatarios()})

	//filtrar solo un destinatario (Coleccion)
	method colMenDest(destinatario1)= self.mapDestinatario().filter({destinatario2 =>  destinatario2 == destinatario1})
	
	//cantidad de veces mencionado
	method cantMismDest(destinatario)=self.colMenDest(destinatario).size()
	
	//Condicion
	method menMayor(dest1,dest2)= self.cantMismDest(dest1)>self.cantMismDest(dest2)
	//Sacar repetidos
	method destSinRep()= self.mapDestinatario().asSet()
	//Destinatarios!!! 
	method destinatarios() = self.destSinRep().sortedBy({dest1,dest2=>self.menMayor(dest1,dest2)})
	
	}	    
	
class Regalos{
	var conjdest
	//estado 1=Colgado, para cualquier otro no lo esta
	var colgado
	
	constructor(_colgado,_conjdest){
		colgado=_colgado
		conjdest=_conjdest
	}
	
	method estaColgado(){return colgado==1} 
	method estaColgado(_alpiso){colgado=_alpiso}
		
	method destinatarios(_destinatario){ conjdest.add(_destinatario)}
	
	method destinatarios(){ return conjdest}
	
	method importancia()= conjdest.size()*2
		
	method lugaresArbol()= 1
}

class Tarjetas{
	var destinatario
	var importancia
	var colgado
	//estado 1=Colgado, para cualquier otro no lo esta
	constructor (_destinatario,_importancia,_colgado){
		destinatario=_destinatario
		importancia=_importancia
		colgado=_colgado
	} 

	
	
	method estaColgado(){return colgado==1} 
	method estaColgado(_alpiso){colgado=_alpiso}
	
	method destinatarios(_destinatario){destinatario=_destinatario}
	method destinatarios()=[destinatario]
	
	method importancia(_importancia){ importancia = _importancia}
	method importancia()= importancia

	method lugaresArbol()=0
} 

class Adornos{
	var peso
	var cSup
	var colgado
	//estado 1=Colgado, para cualquier otro no lo esta
	
	constructor(_colgado,_peso,_cSup){
		colgado=_colgado
		peso=_peso
		cSup=_cSup
	}
	
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

	var conjAdornos
	var colgado
	//estado 1=Colgado, para cualquier otro no lo esta
	
	constructor(_colgado,_conjAdornos){
		conjAdornos=_conjAdornos
		colgado=_colgado
	}
	
	method estaColgado()= colgado==1 
	method estaColgado(_alpiso){colgado=_alpiso}
	
	method destinatarios()=[]
	
	method adorno(_adorno){ 
		conjAdornos.add(_adorno)
	}

	method adorno()=conjAdornos
	
	// cambiar importancia. max hace el map.(Punto por hacer)
	method mapImportancia()=conjAdornos.map({adorno1 => adorno1.importancia()})
	method importancia()= self.mapImportancia().max()
		
	//----------------------------------------------------------------------
	
	method lugaresArbol()= 1 + conjAdornos.sum({ocupar=> ocupar.lugaresArbol()})

}


 object estrellaDeBelen {

    var conjDest = []

	//Es la estrella colgada arriba del pinos.
	method estaColgado()= true 
         
    method lugaresArbol() = 1
    method importancia()= 10
    method destinatarios() = conjDest
    method destinatarios(_destinatario){
        conjDest.add(_destinatario)
    }

}
