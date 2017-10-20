Actualidad universitaria

Primera parte: los estudiantes
En el sistema educativo universitario un integrante fundamental es el alumno. A lo largo de
su recorrido institucional va viviendo experiencias que moldean su perfil profesional. En
nuestro sistema informático, de cada uno de ellos se conoce el nombre, una actitud
destacada, un índice de motivación y un conjunto de recuerdos significativos.
Por ejemplo:
cachito es un alumno que se llama "Estanislao Pereira" es "buenaonda" su motivacion es de 15,
y sus experiencias ["conoci la facultad", "aprobe mi primer examen", "hice un hola mundo que funcionaba", "conoci a julia"]

actitudesFrecuentes = ["buena onda","predispuesto", "indiferente", "malaonda"]


Se quiere poder hacer

1) Averiguar si un alumno tiene algún recuerdo significativo que comience con "aprobe"

2) Obtener cómo queda el alumno luego de incrementar su motivación en 10.

3) Cambiar la actitud de un alumno, en función de la actitud actual, donde puede tomar cualquiera actitud en forma aleatoria, menos la que ya tenia.

4) Predecir si un estudiante será un buen profesional, teniendo en cuenta si tuvo un 
recuerdos significativos que aprobo y su motivación sea mayor a 30.

5) Vivir una experiencia, de manera que, dependiendo de cómo está, y a partir de otros
parámetros, pueda agregar un recuerdo significativo, modificar su actitud, alterar su
motivación u otros efectos. Teniendo en cuenta que si su motivacion es menor a 0 o su actitud es "indiferente" no lo afecte en nada.

Segunda parte: el contexto social
Es de vital importancia tener en cuenta el contexto en el cual se desarrolla la actividad
universitaria, tanto en lo que hace a la infraestructura, la calidad académica, la situación
social, etc. De lo variado y complejo que puede ser, en nuestro sistema se destacan
algunas situaciones y se representa su nivel con un indicador numérico.
Por ejemplo:
contextoHipotetico = [("aumento salarial", 30.0), ("presupuesto", 2000.0), ("represion de la
protesta social", 1.18), ("inflacion", 35.5), … ]
1) Obtener el indicador correspondiente a una situación en un determinado contexto
por ejemplo, en este caso el indicador de “inflacion” es 35.5.

Tercera parte: los docentes
Así como su rol típico es mediar entre el conocimiento y los estudiantes, en un sentido
amplio actúa como mediador con todo el contexto social y el sistema universitario.
Cada docente tiene una determinadas acciónes frente a sus alumnos en función de su forma
de apreciación del contexto.
por ejemplo:

hector es un Docente "Hector Crack"
[cachito,pedrito,carlitos] 
su contexto es la universidad
y su apresiacion es su pensamiento


Las acciones posibles de los docentes frente al contexto son:
enParo: Si no alcanza el Sueldo, los alumnos viven la experiencia y reducen su motivacion en 10
movilizacion: si hay represion de la protesta social o inflacion es mayor al aumento, los alumnos viven la experiencia y aumentan su motivacion en 15.
quejarseInstalaciones: si hay bajo presupuesto(<2500), los alumnos viven la experiencia, reducen su motivacion en 10 y les cambia la actitud
clasePublica: viven la experiencia y suman 100 en motivacion
unDiaEspecial: Hacer que los alumnos del docente cambien de actitud,tengan la experiencia que aprobaron todo, aumento su motivacion en 1000 y que le tenga ING antes de su nombre.


1) Dado un docentes, los contextos y un mismo grupo de estudiantes,
obtener al final de haber pasado por un paro y quejas de instalaciones si algun alumno sera un
buen profesional.

