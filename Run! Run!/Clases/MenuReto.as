package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	
	
	public class MenuReto extends MovieClip {
		
		
		public function MenuReto() {
			// constructor code
			nivel1.addEventListener( MouseEvent.CLICK, seleccionNivel1);
		}
		
		public function seleccionNivel1( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.NIVEL1));
		}
	}
	
}
