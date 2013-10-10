package  {
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	
	public class Cerdito extends MovieClip {

		public function Cerdito() {
			detener();
			Listeners();
		}
		
		public function detener(): void{
			this.stop();
			
		}
		
		private function Listeners() : void
      	{
         	this.addEventListener(KeyboardEvent.KEY_UP, detenerc); 
			this.addEventListener(KeyboardEvent.KEY_DOWN, tecla);
      	}
		
		public function tecla(evento : KeyboardEvent) : void
		{
			
			  if(evento.keyCode == Keyboard.SPACE){
				  this.play();
			  }
			  if(evento.keyCode == Keyboard.LEFT){
				  this.gotoAndStop(9);
				  mover(-10);
				  
			  }
			  else if(evento.keyCode == Keyboard.RIGHT){
				  this.gotoAndStop(10);
				  mover(10);
			  }
			  
			  
		}
      
		private function mover( distancia : int): void{
			
			 var nP : int = this.x + distancia;
			 if(nP > -5 && nP < 805)
			 {
				this.x += distancia;
			 }
			 else
			 {
				detenerc();
			 }
			  
		}
		public function detenerc(evento : KeyboardEvent = null) : void
		{
			this.gotoAndStop(1);
			this.gotoAndStop(1);
		}

	}
}
