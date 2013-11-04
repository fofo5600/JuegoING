package  {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.text.TextField;
	import flash.events.TimerEvent;
	/*
	 * Clase Reloj
	 * Creado por: Rodolfo Verjel
	 * 
	 */
	public class Reloj extends TiempoReloj{
		
		public var reloj:TextField;
		/*
		 * Funcion Reloj
		 * 			Constructor del Reloj se instancia al entrar a un nivel
		 * 			
		 */
		public function Reloj() {
			// constructor code
			
			reset();
			segundo=0;
			reloj.text=" 00";
			//contador.addEventListener(TimerEvent.TIMER,Actualizar);
			//contador.start();
		}
		override public function Actualizar():void
		{
			super.Actualizar();
			reloj.text = String(segundo);
		}
	}
	
}
