package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	
	
	public class Nivel extends MovieClip {
		
	    private var cerdito: Cerdito;
		private var reloj: Timer;
		private var manzana: Manzana;
		private var manzanas: Array;
		private var fin: GameOver;
		private var bala : Bala;
		private var balas: Array;
		
		public function Nivel() {
			
			cerdito= new Cerdito();
			cerdito.x=400;
			cerdito.y=500;
			addChild(cerdito);
			
			manzanas= new Array();
			balas = new Array();
			addEventListener( Event.ADDED_TO_STAGE, Tutorial);
			
			reloj= new Timer(5);
			reloj.addEventListener(TimerEvent.TIMER, mover);
			reloj.start();
			
		}
		
		private function moverse( e: Event) : void
      	{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyUp);
      	}
		private function KeyDown( e: KeyboardEvent) : void
      	{
			cerdito.tecla(e);
		}
		private function KeyUp( e: KeyboardEvent) : void
      	{
			cerdito.detenerc(e);
		}
		private function mover(timer:TimerEvent){
			
			if(Math.random() < 0.09 )
			{
				var ran: Number = Math.random()* 200;
				var nM: Manzana = new Manzana(-15,ran);
				manzanas.push(nM);
				
				addChild(nM);
				
			}
			if(Math.random() < 0.03 )
			{
				var ran1: Number = Math.random()* 200;
				var nB: Bala = new Bala(-15,ran1);
				balas.push(nB);
				
				addChild(nB);
				
			}
			
			for each ( var M: Manzana in manzanas)
			{
				M.movimiento();
				if (cerdito.hitTestObject(M)) 
				{
					//reloj.stop();
					//dispatchEvent( new EventosCerdito( EventosCerdito.MUERTE));
					//removeChild(cerdito);
					//fin= new GameOver();
					//addChild(fin);
				}
			}	
			for each ( var B: Bala in balas)
			{
				B.movimiento();
				if (cerdito.hitTestObject(B)) 
				{
					reloj.stop();
					dispatchEvent( new EventosCerdito( EventosCerdito.MUERTE));
					//removeChild(cerdito);
					fin= new GameOver();
					addChild(fin);
				}
			}	
		}
		
		private function Tutorial():void
		{
			reloj.stop();
			
			trace("moverse a la dereche")
			stage.addEventListener(KeyboardEvent.KEY_DOWN, a);
			
			
		}
		
		private function a( var e: Number): void{
			if(e.keyCode == Keyboard.RIGHT){
				reloj.start();
			}
			
		}
	}
	
}
