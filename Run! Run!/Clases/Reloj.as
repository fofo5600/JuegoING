package  {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.text.TextField;
	import flash.events.TimerEvent;
	
	public class Reloj extends TiempoReloj{
		
		public var reloj:TextField;
		
		public function Reloj() {
			// constructor code
			
			reset();
			segundo=0;
			reloj.text="0:00";
			//contador.addEventListener(TimerEvent.TIMER,Actualizar);
			//contador.start();
		}
		override public function Actualizar():void
		{
			super.Actualizar();
			reloj.text = ":"+segundo;
		}
	}
	
}
