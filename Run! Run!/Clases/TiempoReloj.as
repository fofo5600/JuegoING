package  {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class TiempoReloj extends MovieClip {
		
		public var segundo:int;
		public var contador:Timer= new Timer(1000);
		
		public function TiempoReloj() {
			// constructor code
			super();
			contador.addEventListener(TimerEvent.TIMER,Aumentar);
			contador.start();
			Actualizar();
		}
		
		public function Aumentar( nuevoValor: Number ): void{
			segundo+=1;
			Actualizar();
		}
		public function reset():void{
			segundo=0;
			Actualizar();
		}
		public function Actualizar():void{
			
		}

	}
	
}
