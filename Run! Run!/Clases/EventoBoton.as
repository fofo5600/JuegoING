package  {
	import flash.events.Event;
	
	public class EventoBoton extends Event {
		
		public static const NIVEL1 : String = "nivel1";
		public static const NIVEL2 : String = "nivel2";
		public static const INICIAR : String = "iniciarSeccion";
		public static const REGISTRAR : String = "registrase";
		public static const REGISTRO : String = "registro";
		
		public function EventoBoton( type:String) {
			// constructor code
		
			super(type);
		}

	}
	
}
