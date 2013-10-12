package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	
	
	public class MenuPrincipal extends MovieClip {
		
		
		public function MenuPrincipal() {
			// constructor code
			Bnivel1.addEventListener( MouseEvent.CLICK, seleccionNivel1);
			Bnivel2.addEventListener( MouseEvent.CLICK, seleccionNivel2);
		}
		
		public function seleccionNivel1( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.NIVEL1));
		}
		public function seleccionNivel2( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.NIVEL2));
		}
	}
	
}
