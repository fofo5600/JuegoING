package  {
	import flash.display.MovieClip;
	
	public class Contador extends MovieClip{
		
		
		public var numeroActual:Number;
		
		public function Contador() {
			// constructor code
			reset();
		}
		
		public function Aumentar( nuevoValor: Number ): void{
			numeroActual=numeroActual + nuevoValor;
			trace(numeroActual);
			Actualizar();
		}
		public function reducir( nuevoValor: Number ): void{
			
			numeroActual=numeroActual - nuevoValor;
			if(numeroActual<0){
				numeroActual=0;
			}
			trace(numeroActual);
			Actualizar();
		}
		public function reset():void{
			trace("--------");
			numeroActual=0;
			Actualizar();
		}
		public function Actualizar():void{
			
		}

	}
	
}
