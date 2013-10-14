package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Registrarse extends MovieClip {
		
		
		public function Registrarse() {
			// constructor code
			BRegistrase.addEventListener( MouseEvent.CLICK, Registro);
		}
		
		public function Registro( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.REGISTRO));
		}
	}
	
}
