package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/*
	 * Clase MensajeUsuario
	 * Creado por: Rodolfo Verjel
	 * 
	 */
	public class MensajeUsuario extends MovieClip {
		/*
		 * Funcion Manzana 
		 * 			Constructor de la clase  MensajeUsuario que instancia un mensaje de error
		 * 			
		 */
		public function MensajeUsuario() {
			// constructor code
			ok1.addEventListener( MouseEvent.CLICK, Regresar);

		}
		/*
		 * Funcion Regresar  
		 * 			Crea un nuevo eveto de raton
		 * 			
		 */
		public function Regresar( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.ERROR));
		}
	}
	
}