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
			addEventListener( Event.ADDED_TO_STAGE, moverse);
			
			reloj= new Timer(50);
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
			
			
			
			if(Math.random() < 0.11 && manzanas.length<2)
			{
				var ran: Number = (Math.random()* 150)+10;
				var nM: Manzana = new Manzana(-15,ran);
				manzanas.push(nM);
				
				addChild(nM);
				if(nM.x>805 || nM.y>605){
					removeChild(nM);
					//delete manzanas[M];
				}
				
			}
			if(Math.random() < 0.03 )
			{
				var ran1: Number =  Math.random()*150; 
				var nB: Bala = new Bala(-15,ran1);
				balas.push(nB);
				
				addChild(nB);
				
			}
			
			
			var indiceManzanas : int= manzanas.length-1;
			var indiceBalas : int=balas.length-1;
			
			
			while(indiceManzanas>-1){
				var M: Manzana = manzanas[indiceManzanas];
				M.movimiento();
				
				if (cerdito.hitTestObject(M)){
					trace("captura");
					M.atrapada(cerdito.puntaCola.x, cerdito.puntaCola.y);
					//reloj.stop();
					//dispatchEvent( new EventosCerdito( EventosCerdito.MUERTE));
					//removeChild(cerdito);
					//fin= new GameOver();
					//addChild(fin);
					removeChild(M);
					manzanas.splice(indiceManzanas,1);
				}
				if(M.x>825 || M.y > 625){
					removeChild(M);
					manzanas.splice(indiceManzanas,1);
				}
				indiceManzanas=indiceManzanas-1;
			}
			
			for each ( var B: Bala in balas)
			{
				B.movimiento();
				if (cerdito.hitTestObject(B)) 
				{
					//reloj.stop();
					//dispatchEvent( new EventosCerdito( EventosCerdito.MUERTE));
					//removeChild(cerdito);
					fin= new GameOver();
					//addChild(fin);
				}
			}	
		}
		
		private function Tutorial():void
		{
			reloj.stop();
			
			trace("moverse a la dereche")
			stage.addEventListener(KeyboardEvent.KEY_DOWN, a);
			
			
		}
		
		private function a( e : KeyboardEvent): void{
			if(e.keyCode == Keyboard.RIGHT){
				reloj.start();
			}
			
		}
	}
	
}
