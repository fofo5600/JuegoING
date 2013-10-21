package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class MensajeUsuario extends MovieClip {
		
		public function MensajeUsuario() {
			// constructor code
			ok1.addEventListener( MouseEvent.CLICK, Regresar);
			//ok2.addEventListener( MouseEvent.CLICK, Regresar);
			//ok3.addEventListener( MouseEvent.CLICK, Regresar);

		}
		
		public function Regresar( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.ERROR));
		}
	}
	
}