package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class MensajeUsuario extends MovieClip {
		
		
		public function MensajeUsuario() {
			// constructor code
			Ok.addEventListener( MouseEvent.CLICK, Regresar);

		}
		
		public function Regresar( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.ERROR));
		}
	}
	
}
