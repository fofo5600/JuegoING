package  {
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	
	/*
	 * Clase Cerdito
	 * Creado por: Rodolfo Verjel
	 *
	 */
	public class Cerdito extends MovieClip {
		
		/*
		 * Funcion constructor bala 
		 *		cada vez que se crea una instancia de 
		 *		la bala en uno de los niveles se llama el constructor
		 *
		 */
		public function Cerdito() {
			detener();
			Listeners();
		}
		/*
		 * Funcion detener 
		 *		Estado inicial de cerdito cuando el cerdito termina de realizar 
		 *		una accion regresa a este estado
		 *		Pre condicion: El cerdito es instanciado o el cerdito termina una accion
		 *		Post condicion: El cerdito que en us estado principal mirando hacia el frente
		 */
		public function detener(): void{
			this.stop();
			
		}
		/*
		 * Funcion detener 
		 *		Se agregan los listener para ser ejecutados por el nivel 
		 *	
		 */
		private function Listeners() : void
      	{
         	this.addEventListener(KeyboardEvent.KEY_UP, detenerc); 
			this.addEventListener(KeyboardEvent.KEY_DOWN, tecla);
      	}
		/*
		 * Funcion tecla
		 *		Al dar click en un tecla el nivel la lea y la envia para realizar la accion correspondiente
		 *		
		 *		Pre condicion: Se recibe la señal de alguna tecla
		 *		Post condicion: Una accion en el nivel del cerdito o del escenario
		 */
		public function tecla(evento : KeyboardEvent) : void
		{
			
			  if(evento.keyCode == Keyboard.SPACE){

				 this.gotoAndStop(2)
				 
			  }
			  if(evento.keyCode == Keyboard.LEFT){
				  this.gotoAndStop(3);
				  mover(-20);
				  
			  }
			  else if(evento.keyCode == Keyboard.RIGHT){
				  this.gotoAndStop(4);
				  mover(20);
			  }
			  
		}
      	/*
		 * Funcion mover
		 *		Se realiza el movimiento del cerdito hacia la derecha o izquierda
		 *		
		 *		Pre condicion: Se recibe una tecla de flecha izquierda o derecha
		 *		Post condicion: Se cambia la posicion actual del cerdito
		 */
		private function mover( distancia : int): void{
			
			 var nP : int = this.x + distancia;
			 if(nP > 100 && nP < 705)
			 {
				this.x += distancia;
			 }
			 else
			 {
				detenerc();
			 }
			  
		}
		/*
		 * Funcion deternerc
		 *		Regresa el cerdito a su posicion inicial cuando se recibe que se dejo 
		 *		de presionar la tecla
		 *		Pre condicion: Se suelta la tecla que esta oprimida
		 *		Post condicion: El cerdito regresa a su estano principal
		 */
		public function detenerc(evento : KeyboardEvent = null) : void
		{
			this.gotoAndStop(1);
		}

	}
}
