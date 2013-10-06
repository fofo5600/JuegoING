package  {
	
	import flash.display.MovieClip;
	
	
	public class Bala extends MovieClip {
		
		
		public function Bala(ix: int, iy:int) {
			// constructor code
			x=ix;
			y=iy;
		}
		public function movimiento(): void
		{
			x= x+3;
		
		}
	}
	
}
