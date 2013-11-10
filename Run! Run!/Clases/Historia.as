package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Historia extends MovieClip {
		
		
		public function Historia() {
			// constructor code
			siguiente.addEventListener(MouseEvent.CLICK, cambiar)
			iniciar.addEventListener(MouseEvent.CLICK, inicio)
		}
		public function cambiar(evento:MouseEvent){
			dispatchEvent(new EventoBoton(EventoBoton.SIG))
		}
		public function inicio(evento:MouseEvent){
			removeChild(iniciar)
			dispatchEvent(new EventoBoton(EventoBoton.INICIO))
			
		}
	}
	
}
