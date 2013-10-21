package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import playerio.DatabaseObject;
	
	
	public class Nivel extends MovieClip {
		
	    private var cerdito: Cerdito;
		private var reloj: Timer;
		private var manzana: Manzana;
		private var manzanas: Array;
		private var fin: GameOver;
		private var bala : Bala;
		private var balas: Array;
		private var vidas : int;
		private var vida1: Vida;
		private var vida2: Vida;
		private var vida3: Vida;
		private var termino : GameOver;
		private var esperar : Timer
		private var objetoJugardor : DatabaseObject
		
		public function Nivel( objeto : DatabaseObject) {
			
			objetoJugardor = objeto
			
			
			vidas=3;
			vida1= new Vida();
			vida2= new Vida();
			vida3= new Vida();
			
			vida1.x= 680;
			vida1.y= 15;
			vida2.x= 720;
			vida2.y= 15;
			vida3.x= 760;
			vida3.y= 15;
			
			addChild(vida1);
			addChild(vida2);
			addChild(vida3);
			
			cerdito= new Cerdito();
			cerdito.x=400;
			cerdito.y=500;
			addChild(cerdito);
			
			manzanas= new Array();
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
			
			manzanaPuntaje.gotoAndStop(1);
			
			if(tiempo.segundo==60){
				terminarJuego();
			}else{
				tiempo.Actualizar();
			}
						
			
			if(Math.random() < 0.11 && manzanas.length<2)
			{
				var ran: Number = (Math.random()* 150)+10;
				var nM: Manzana = new Manzana(-15,ran);
				manzanas.push(nM);
				
				addChild(nM);
				if(nM.x>805 || nM.y>605){
					removeChild(nM);
					
				}
				
			}
			
			
			var indiceManzanas : int= manzanas.length-1;			
			
			while(indiceManzanas>-1){
				var M: Manzana = manzanas[indiceManzanas];
				M.movimiento();
				
				if (cerdito.hitTestObject(M)){
					manzanaPuntaje.gotoAndStop(2);
					puntaje.Aumentar(5);
					removeChild(M);
					manzanas.splice(indiceManzanas,1);
				}
				if(M.x>825 || M.y > 625){
					removeChild(M);
					manzanas.splice(indiceManzanas,1);
					puntaje.reducir(2);
				}
				indiceManzanas=indiceManzanas-1;
			}
		}
		
		private function terminarJuego(){
			reloj.stop();
			for each ( var M: Manzana in manzanas)
			{
				removeChild(M);
			}
			
			removeChild(cerdito)
			
			if(int(puntaje.score.text) > 100){
				objetoJugardor.PuntajeTotal+=int(puntaje.score.text)
				if(objetoJugardor.nivel1 < int(puntaje.score.text) ){
					objetoJugardor.nivel1 = int(puntaje.score.text) 
				}
				objetoJugardor.save(false,false,null,null)
				dispatchEvent( new EventosCerdito( EventosCerdito.GANO));
			}else{
				termino = new GameOver();
				addChild(termino);
				esperar = new Timer(3000)
				esperar.addEventListener(TimerEvent.TIMER, salir)
				esperar.start()
				
				
			}
		}
		private function salir(tiempo : TimerEvent){
			esperar.stop()
			removeChild(termino)
			dispatchEvent( new EventosCerdito( EventosCerdito.MUERTE));
		}
	}
	
}
