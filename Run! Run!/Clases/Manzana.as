package  {
	import flash.display.MovieClip;
	
	public class Manzana extends MovieClip {
		
		private var entro : Boolean;
		private var v:int;
		
		public function Manzana( ix: int, iy:int) {
			// constructor code
			entro=false;
			x=ix;
			v=iy;
		}
		public function movimiento(): void{
			if(!entro)
			{
				y = 0.0009 * Math.pow(((x += 20) - 350),2) + v;
			//x= x+3;
			}
		
		}
		public function atrapada( px : int, py : int):void{
			x=px;
			y=py;
			entro=true;
		}

	}
	
}
