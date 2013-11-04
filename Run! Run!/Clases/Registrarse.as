package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/*
	 * Clase Registrarse
	 * Creado por: Rodolfo Verjel
	 * 
	 */
	public class Registrarse extends MovieClip {
		
		/*
		 * Funcion Registrarse 
		 * 			Constructor del Registrarse se instancia Pasar del login al registro
		 * 			
		 */
		public function Registrarse() {
			// constructor code
			BRegistrase.addEventListener( MouseEvent.CLICK, Registro);
			RVolver.addEventListener( MouseEvent.CLICK, Regresar);
		}
		
		public function Registro( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.REGISTRO));
		}
		public function Regresar( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.VOLVER));
		}
	}
	
}
