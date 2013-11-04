package  {
	import flash.display.MovieClip;
	
	/*
	 * Clase Contador
	 * Creado por: Rodolfo Verjel
	 *
	 */
	public class Contador extends MovieClip{
		
		
		public var numeroActual:Number;
		/*
		 * Funcion Contador
		 *		Cada vez que se inicializa un contador se crea una instancia 
		 *		constructor del contador
		 *		Pre condicion: Se crea un nuevo nivel
		 *		Post condicion: Se instancia el contaodr en el nivel
		 */
		public function Contador() {
			reset();
		}
		/*
		 * Funcion Aumentar
		 *		Actualiza el contador cada vez que llegue un nuevo valor
		 *		
		 *		Pre condicion: El contandro fue instanciado y recibe un nuevo valor
		 *		Post condicion: el numero del contador aumenta
		 */
		public function Aumentar( nuevoValor: Number ): void{
			numeroActual=numeroActual + nuevoValor;
			Actualizar();
		}
		/*
		 * Funcion reducir
		 *		Actualiza el contador cada vez que llegue un nuevo valor
		 *		
		 *		Pre condicion: El contandro fue instanciado y recibe un nuevo valor
		 *		Post condicion: el numero del contador se reduce
		 */
		public function reducir( nuevoValor: Number ): void{
			
			numeroActual=numeroActual - nuevoValor;
			if(numeroActual<0){
				numeroActual=0;
			}
			Actualizar();
		}
		/*
		 * Funcion reset
		 *		reinicia el contador
		 *		
		 *		Pre condicion: El contandro fue instanciado y recibe un nuevo valor
		 *		Post condicion: el numero del contaodr aumenta
		 */
		public function reset():void{
			numeroActual=0;
			Actualizar();
		}
		/*
		 * Funcion  Actualizar
		 *		Actualiza el contador cada vez que cambie el valor
		 *		
		 *		Pre condicion: Llega un nuevo valor para el contador
		 *		Post condicion: El contador cambie su valor y actualiza en pantalla
		 */
		public function Actualizar():void{
			
		}

	}
	
}
