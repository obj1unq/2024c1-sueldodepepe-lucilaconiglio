// empleados
object pepe {
	
	var categoria = cadete
	var faltas = 0
	var bonoResultado = resultadoNulo
	var bonoPresentismo = presentismoNulo
	
	method neto(){
		return categoria.neto()	
	}
	
	method categoria(_categoria){
		categoria = _categoria		
	}
	
	method faltas(_faltas){
		faltas = _faltas
	}
	
	method faltas(){
		return faltas
	}
	
	method bonoResultado(_bonoResultado){
		bonoResultado = _bonoResultado		
	}
	
	method bonoPresentismo(_bonoPresentismo){
		bonoPresentismo = _bonoPresentismo		
	}
	
	
	method sueldo(){
		return categoria.neto()  + self.resultado() + self.presentismo()
	}
	
	method resultado(){
		return bonoResultado.valor(self)
	}
	
	method presentismo(){
		return bonoPresentismo.valor(self)
	}
}


object sofia{
	var categoria = cadete
	var bonoResultado = resultadoNulo
	
	method sueldo(){
		return categoria.neto()  + self.resultado() 
	}
	
	method resultado(){
		return bonoResultado.valor(self)
	}
	
	method bonoResultado(_bonoResultado){
		bonoResultado = _bonoResultado		
	}
	
	method neto(){
		return categoria.neto()	* 1.3
	}
	
	method categoria(_categoria){
		categoria = _categoria		
	}

}


 object roque{
 	
 	const neto = 28000
	var bonoResultado = resultadoNulo
	
 	
 	method sueldo(){
 		return neto + self.resultado() + 9000
 	}
 	
	method resultado(){
		return bonoResultado.valor(self)
	}
	
	method bonoResultado(_bonoResultado){
		bonoResultado = _bonoResultado		
	}
 }
 
 /*
  * Ernesto, que trabaja junto con un compañero, que puede cambiar. El neto de Ernesto es igual al de su compañero.
Su sueldo se calcula como neto + bono por presentismo.
Para el bono por presentismo, usar las mismas opciones que para Pepe.
*  Se sabe que Ernesto no falta nunca.
  */
  
 object ernesto{
 	
 	var companiero = pepe
	var bonoPresentismo = presentismoNulo
	
	method faltas(){
		return 0	
	}
	
 	method companiero(_companiero){
 		companiero = _companiero	
 	}
 	
 	method neto(){
 		return companiero.neto()
 	}
 	
	method bonoPresentismo(_bonoPresentismo){
		bonoPresentismo = _bonoPresentismo		
	}
	
	method presentismo(){
		return bonoPresentismo.valor(self)
	}
	
	method sueldo(){
		return self.neto() + self.presentismo()
	}
 	
 	
 }
  
  
// categorias
object cadete{
	method neto(){
		return 20000
	}
}

object gerente{
	method neto(){
		return 15000
	}
}

object vendedor{
	
	const neto = 16000
	var hayAumento = false
	
	method activarAumentoPorMuchasVentas(){
		hayAumento = true
	}
	
	method desactivarAumentoPorMuchasVentas(){
		hayAumento = false
	}
	
	method neto(){
		return neto * self.extraPorVentas()
	}
	
	method extraPorVentas(){
		return if (hayAumento) 1.25 else 1
	}
	
}

object medioTiempo{
	
	var categoriaBase = cadete
	
	method categoriaBase(_categoriaBase){
		categoriaBase = _categoriaBase
	}
	
	method neto(){
		return categoriaBase.neto() / 2
	}
}

// bono resultado

object porcentaje{
	method valor(empleado){
		return empleado.neto() * 0.10
	}
}

object fijo{
	method valor(empleado){
		return 800
	}
}

object resultadoNulo{
	
	method valor(empleado){
		return 0
	}
}

// bono presentismo
object normal{
	
	method valor(empleado){
		
		var faltas = empleado.faltas()
		
		return if(faltas == 0){
			2000
		}
		else if(faltas == 1){
			1000
		}
		else{
			0
		}
		
		// calculado matematicamente:
		//return (2000 - empleado.faltas() * 1000).max(0)
	}
}

object ajuste{
	method valor(empleado){
		return if (empleado.faltas() == 0) 100 else 0
	}
}

object demagogico{
	method valor(empleado){
		return if(empleado.neto() < 18000) 500 else 300
	}	
}

object presentismoNulo{
	
	method valor(empleado){
		return 0
	}
}
