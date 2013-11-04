package  {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	/*
	 * Clase TiempoReloj
	 * Creado por: Rodolfo Verjel
	 * 
	 */
	public class TiempoReloj extends MovieClip {
		
		public var segundo:int;
		public var contador:Timer= new Timer(1000);
		/*
		 * Funcion TiempoReloj 
		 * 			Constructor del TiempoReloj se instancia al entrar a un nivel
		 * 			
		 */
		public function TiempoReloj() {
			// constructor code
			super();
			contador.addEventListener(TimerEvent.TIMER,Aumentar);
			contador.start();
			Actualizar();
		}
		/*
		 * Funcion Aumentar
		 *		Actualiza el reloj cada vez que llegue un nuevo valor
		 *		
		 *		Pre condicion: El reloj fue instanciado y recibe un nuevo valor
		 *		Post condicion: El segundo del reloj cambia
		 */
		public function Aumentar( nuevoValor: Number ): void{
			segundo+=1;
			Actualizar();
		}
		/*
		 * Funcion reset
		 *		reinicia el reloj
		 *		
		 *		Pre condicion: El reloj fue instanciado y recibe un nuevo valor
		 *		Post condicion: El reloj vuelve a 0
		 */
		public function reset():void{
			segundo=0;
			Actualizar();
		}
		/*
		 * Funcion  Actualizar
		 *		Actualiza el contador cada vez que cambie el valor
		 *		
		 *		Pre condicion: Llega un nuevo valor para el reloj
		 *		Post condicion: El reloj cambie su valor y actualiza en pantalla
		 */
		public function Actualizar():void{
			
		}

	}
	
}
