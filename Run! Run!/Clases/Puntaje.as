package  {
	import flash.text.TextField;
	
	public class Puntaje extends Coun{
	
		public var puntaje:TextField;
		
		public function Puntaje() {
			// constructor code
			super();
		}
		
		override public function actualizar():void
		{
			super.actualizar();
			puntaje.text =  currentValue.toString();
		}

	}
	
}
