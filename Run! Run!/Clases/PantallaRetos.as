package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class PantallaRetos extends MovieClip {
		
		
		public function PantallaRetos() {
			// constructor code
			jugar.addEventListener( MouseEvent.CLICK, seleccionJugar);
			volver.addEventListener( MouseEvent.CLICK, regresar);
		}
		public function seleccionJugar( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.JUGAR));
		}
		public function regresar( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.VOLVER));
		}
	}
	
}
