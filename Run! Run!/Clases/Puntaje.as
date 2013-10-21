package  {
	import flash.text.TextField;
	
	public class Puntaje extends Contador{
	
		public var score:TextField;
		
		public function Puntaje() {
			// constructor code
			super();
			score.text="0";
		}
		
		override public function Actualizar():void
		{
			super.Actualizar();
			score.text = numeroActual.toString();
		}

	}
	
}
