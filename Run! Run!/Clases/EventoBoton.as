package  {
	import flash.events.Event;
	/*
	 * Clase Contador
	 * Creado por: Rodolfo Verjel
	 * Se usa para la creacion de los eventos de los diferentes botones del juego
	 */
	public class EventoBoton extends Event {
		
		public static const NIVEL1 : String = "nivel1";
		public static const NIVEL2 : String = "nivel2";
		public static const INICIAR : String = "iniciarSeccion";
		public static const REGISTRAR : String = "registrase";
		public static const REGISTRO : String = "registro";
		public static const ERROR : String = "error";
		public static const JUGAR : String = "juegarNivel";
		public static const VOLVER : String = "volver";
		public static const PUNTAJE : String = "puntaje";
		public static const RETOS : String = "retos";
		
		public function EventoBoton( type:String) {
			// constructor code
		
			super(type);
		}

	}
	
}
