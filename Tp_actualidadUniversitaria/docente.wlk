import persona.*
import ContextoSocial.*

class Docente inherits Persona {
	var alumnos=[]
	var momentoActual
	var perspectiva
	constructor(_nombre,_alumnos,momentoActualHipotetico,momentoActualIdeal)=super(_nombre){
		alumnos.addAll(_alumnos)
		momentoActual=momentoActualHipotetico
		perspectiva = momentoActualIdeal
	}		
	
//TODO GETTER SETTER
	method alumnos()=alumnos
	method alumnos(alumno){
		alumnos.add(alumno)
	}
	
	method momentoActual()=momentoActual
	method momentoActual(_momentoActual){
		momentoActual=_momentoActual
	}
	method perspectiva()=perspectiva
	method perspectiva(_momentoActual){
		perspectiva=_momentoActual
	}

//TODO: momentoActuales

	method inflacionMayorAlAumento()= perspectiva.indicador("aumento salarial")< momentoActual.indicador("inflacion") 

	method noAlcanzaSueldo()= momentoActual.indicador("aumento salarial") > perspectiva.indicador("aumento salarial")

	

//TODO:Suceso que le pasa a los Alumnos
method suceso(suceso,motivacion){
	alumnos.forEach({alumno=> 
				alumno.experiencias(suceso,motivacion)
	})
}
//TODO:ACCIONES
	method enParo(){
	if(self.noAlcanzaSueldo()){
				self.suceso("paro",(-20))
				momentoActual.indicador("aumento salarial")
		}
	}
	
	method movilizacion(){
		if(momentoActual.indicador("represion de la protesta social")>1||self.inflacionMayorAlAumento()){
				alumnos.forEach({alumno=> 
					alumno.experiencias("Movilizacion",15)
					alumno.cambiarActitud()
				})
		}
	}
		
	method quejarseInstalaciones(){
		if(momentoActual.indicador("presupuesto") <2500){
				self.suceso("Estudio en malas condiciones",(-10))
		}
	}
	method clasePublica(){
		self.suceso("Clase Publica",100)
	}
	
	method unDiaEspecial(){
		alumnos.forEach({alumno=>
				alumno.cambiarActitud()
				alumno.experiencias("aprobe TODO!",1000)
				alumno.titulo("ING ")
		})
	}
	method algunAlumnoSeraBueno(){
		self.enParo()
		self.quejarseInstalaciones()
		return alumnos.any({unAlumno=> unAlumno.buenProfesional()})
	}
	

}
