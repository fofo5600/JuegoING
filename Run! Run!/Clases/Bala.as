package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	import flashx.textLayout.formats.Float;
	
	/*
	 * Clase Bala 
	 * Creado por: Rodolfo Verjel
	 *
	 */
	public class Bala extends Objeto {
		
		private var velocidad:int;

		/*
		 * Funcion constructor bala 
		 *		cada vez que se crea una instancia de 
		 *		la bala en uno de los niveles se llama el constructor
		 *
		 */
		public function Bala(inicialx: int, inicialy:int) {
			x=inicialx;
			velocidad=inicialy;
		}

		/*
		 * Funcion movimiento
		 * 		Pre condicion: La bala se instancion en un nivel 
		 *      Post condicion: La bala realiza un trayectoria en forma parabolica
		 *		
		 *		Cada vez que se indique un movimiento para la bala esta usa la formula para 
		 *		definir su siguiente posicion
		 *
		 */
		override public function movimiento(): void
		{	
			y = 0.00092 * Math.pow(((x += 20) - 350),2) + velocidad;
			
		}
	}
	
}
