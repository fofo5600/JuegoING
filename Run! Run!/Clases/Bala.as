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
			y=iy+300;
			tiempo = getTimer();
			trace(y);
			v=40;
			m=y;//-200;
		}
		public function movimiento(r : Timer): void
		{
			var t: Number= m + 9.8   ;// (getTimer()-tiempo)/100;
			var t1: Number= m + 9.8/2   ;
			//x=x+3;
			v1=(v*Math.sin(30))-(9.8*t);
			v2=v*Math.cos(30);
			
			//x += 30;//v2;
			
			//y= t1 ;//v1;//* t-((9.8/2)*(t*t)) ;
			m= t;
			
			y = 0.002644 * Math.pow(((x += 20) - 275), 2) + 200;
			
			//if(y<800){
				trace(x);
			trace("y "+y+ " " + t);
			//}
		}
	}
	
}
