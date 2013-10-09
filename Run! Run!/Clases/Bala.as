package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	import flashx.textLayout.formats.Float;
	
	
	public class Bala extends MovieClip {
		
		private var tiempo:int;
		private var m:Number;
		private var v:int;
		private var v1:int;
		private var v2:int;
		
		public function Bala(ix: int, iy:int) {
			// constructor code
			x=0;
			v=iy;
		}
		public function movimiento(): void
		{	
			y = 0.00092 * Math.pow(((x += 20) - 350),2) + v;
			
		}
	}
	
}
