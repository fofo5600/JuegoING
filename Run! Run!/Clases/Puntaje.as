package  {
	import flash.text.TextField;
	/*
	 * Clase Puntaje
	 * Creado por: Rodolfo Verjel
	 * 
	 */
	public class Puntaje extends Contador{
	
		public var score:TextField;
		/*
		 * Funcion Puntaje 
		 * 			Constructor del Puntaje se instancia al entrar aun nivel
		 * 			
		 */
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
