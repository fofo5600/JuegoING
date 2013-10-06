package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Control extends MovieClip {
		
		private var menuprincipal:MenuPrincipal; 
		private var nivel1 : Nivel;
		private var reto: MenuReto;
		
		public function Control() {
			// constructor code
			menuprincipal = new MenuPrincipal();
			menuprincipal.addEventListener(EventoBoton.NIVEL1, SeleccionNivel1); 
			addChild(menuprincipal);
			
			
		}
		
		public function SeleccionNivel1(evento : EventoBoton): void{
			
			reto = new MenuReto();
			reto.addEventListener(EventoBoton.NIVEL1, cargarNivel);
			addChild(reto);

		}
		public function cargarNivel(evento : EventoBoton): void{
			
			nivel1 = new Nivel();
			nivel1.x=0;
			nivel1.y=0;
			addChild(nivel1);
			removeChild(reto);
		}

	}
	
}
