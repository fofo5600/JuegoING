package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Control extends MovieClip {
		
		private var menuprincipal:MenuPrincipal; 
		private var nivel1 : Nivel;
		private var nivel2 : Nivel2;
		private var reto: MenuReto;
		
		public function Control() {
			// constructor code
			menuprincipal = new MenuPrincipal();
			menuprincipal.addEventListener(EventoBoton.NIVEL1, SeleccionNivel1); 
			menuprincipal.addEventListener(EventoBoton.NIVEL2, SeleccionNivel2); 
			addChild(menuprincipal);
			
			
		}
		
		public function SeleccionNivel1(evento : EventoBoton): void{
			
			//trace(evento.currentTarget.)
			reto = new MenuReto();
			reto.addEventListener(EventoBoton.NIVEL1, cargarNivel);
			addChild(reto);

		}
		public function SeleccionNivel2(evento : EventoBoton): void{
			
			reto = new MenuReto();
			reto.addEventListener(EventoBoton.NIVEL1, cargarNivel2);
			addChild(reto);

		}
		public function cargarNivel(evento : EventoBoton): void{
			
			nivel1 = new Nivel();
			nivel1.x=0;
			nivel1.y=0;
			addChild(nivel1);
			removeChild(reto);
		}
		public function cargarNivel2(evento : EventoBoton): void{
			
			nivel2 = new Nivel2();
			nivel2.x=0;
			nivel2.y=0;
			addChild(nivel2);
			removeChild(reto);
		}

	}
	
}
