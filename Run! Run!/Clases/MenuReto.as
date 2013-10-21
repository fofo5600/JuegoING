package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	
	
	public class MenuReto extends MovieClip {
		
		
		public function MenuReto() {
			// constructor code
			jugar.addEventListener( MouseEvent.CLICK, seleccionJugar);
		}
		
		public function seleccionJugar( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.JUGAR));
		}
	}
	
}
