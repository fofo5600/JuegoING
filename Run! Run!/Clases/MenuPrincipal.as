package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import playerio.DatabaseObject;
	
	
	public class MenuPrincipal extends MovieClip {
		
		var usuario: DatabaseObject
		
		public function MenuPrincipal(usuario:DatabaseObject) {
			// constructor code
			this.usuario= usuario;
			Usuario.text = usuario.key;
			Puntaje.text = usuario.PuntajeTotal;
			Bnivel1.addEventListener( MouseEvent.CLICK, seleccionNivel1);
			Bnivel2.addEventListener( MouseEvent.CLICK, seleccionNivel2);
			addEventListener(EventosCerdito.GANO, ganador);
			addEventListener(EventosCerdito.MUERTE, perdedor);
			
		}
		
		public function seleccionNivel1( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.NIVEL1));
		}
		public function seleccionNivel2( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.NIVEL2));
		}
		public function ganador( evento : EventosCerdito): void{
			dispatchEvent(new EventosCerdito(EventosCerdito.GANO));
		}
		public function perdedor( evento : EventosCerdito): void{
			dispatchEvent(new EventosCerdito(EventosCerdito.MUERTE));
		}
	}
	
}
