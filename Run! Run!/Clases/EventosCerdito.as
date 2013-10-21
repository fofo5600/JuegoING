package  {
	import flash.events.Event;
	import flash.sampler.Sample;
	
	public class EventosCerdito extends Event {

		public static const MUERTE: String ="muerte";
		public static const MOVERSE: String ="moverse";
		public static const GANO: String ="ganar";
		
		public function EventosCerdito( type:String) {
			// constructor code
			
			super(type);
		}

	}
	
}
