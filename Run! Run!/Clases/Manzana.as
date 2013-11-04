package  {
	import flash.display.MovieClip;
	/*
	 * Clase Manzana
	 * Creado por: Rodolfo Verjel
	 * 
	 */
	public class Manzana extends Objeto {
		
		private var entro : Boolean;
		private var velocidad:int;
		/*
		 * Funcion Manzana 
		 * 			Constructor de la clase manzana que instancia una manzana en los niveles
		 * 			
		 */
		public function Manzana( inicialx: int, inicialy:int) {
			// constructor code
			entro=false;
			x=inicialx;
			velocidad=inicialy;
		}
		/*
		 * Funcion movimiento
		 * 			Actualiza la posicion de la manzana dando forma de tiro parabolico
		 *			Pre condicion: 
		 * 			Psot condicion: la manzana cabia de posicion en x e y 
		 */
		override public function movimiento(): void{
			if(!entro)
			{
				y = 0.0009 * Math.pow(((x += 10) - 350),2) + velocidad;
			}
		
		}
		/*
		 * Funcion atrapa
		 * 			Elimina la manzana de la pantalla si esta es atrapada
		 * 			
		 */
		public function atrapada( posicionx : int, posiciony : int):void{
			x=posicionx;
			y=posiciony;
			entro=true;
		}

	}
	
}
