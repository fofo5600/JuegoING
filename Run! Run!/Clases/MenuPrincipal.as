package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import playerio.DatabaseObject;
	import fl.motion.MotionEvent;
	
	/*
	 * Clase Manzana
	 * Creado por: Rodolfo Verjel
	 * 
	 */
	public class MenuPrincipal extends MovieClip {
		
		var usuario: DatabaseObject
		/*
		 * Funcion MenuPrincipal 
		 * 			Constructor del MenuPrincipal que crea una instancia al realizar login ocn exito
		 * 			
		 */
		public function MenuPrincipal(usuario:DatabaseObject) {
			// constructor code
			this.usuario= usuario;
			Usuario.text = usuario.key;
			Puntaje.text = usuario.PuntajeTotal;
			Bnivel1.addEventListener( MouseEvent.CLICK, seleccionNivel1);
			if(usuario.nivelActual>=2){
				Bnivel2.addEventListener( MouseEvent.CLICK, seleccionNivel2);
				Bnivel2.gotoAndStop(1)
			}else{
				Bnivel2.gotoAndStop(2)
			}
			Retos.addEventListener( MouseEvent.CLICK, seleccionRetos);
			Tpuntaje.addEventListener(MouseEvent.CLICK, TablaPuntajes);
			addEventListener(EventosCerdito.GANO, ganador);
			addEventListener(EventosCerdito.MUERTE, perdedor);
			
		}
		
		public function seleccionNivel1( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.NIVEL1));
		}
		public function seleccionNivel2( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.NIVEL2));
		}
		public function seleccionRetos( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.RETOS));
		}
		public function TablaPuntajes( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.PUNTAJE));
		}
		public function ganador( evento : EventosCerdito): void{
			dispatchEvent(new EventosCerdito(EventosCerdito.GANO));
		}
		public function perdedor( evento : EventosCerdito): void{
			dispatchEvent(new EventosCerdito(EventosCerdito.MUERTE));
		}
	}
	
}
