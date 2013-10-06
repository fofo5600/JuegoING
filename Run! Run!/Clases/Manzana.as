package  {
	import flash.display.MovieClip;
	
	public class Manzana extends MovieClip {

		public function Manzana( ix: int, iy:int) {
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
