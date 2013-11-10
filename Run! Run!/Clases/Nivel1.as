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
	import Nivel
	
	/*
	 * Clase Nivel
	 * Creado por: Rodolfo Verjel
	 * 
	 */
	public class Nivel1 extends Nivel {
		
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
		private var retando: Boolean
		private var jugandoReto: Boolean
		private var historia:Historia
		/*
		 * Funcion Nivel 
		 * 			Constructor del Nivel lo instancia al entrar al primer nivel
		 * 			
		 */
		public function Nivel1( objeto : DatabaseObject, jugandoReto:Boolean) {
			
			super(objeto)
			
			this.jugandoReto=jugandoReto
			objetoJugardor = objeto
			if(MenuCarga.usuarioRetado!=""){
				retando=true
			}else{
				retando=false
			}
			addEventListener( Event.ADDED_TO_STAGE, moverse);
			manzanaPuntaje.gotoAndStop(1)
			tiempo.stop()
			
			historia = new Historia()
			historia.gotoAndStop(1)
			historia.addEventListener(EventoBoton.SIG,function(evento:EventoBoton){
									  		historia.nextFrame()
											trace(historia.currentFrame)
											if(historia.currentFrame==6){
												var espera:Timer = new Timer(3000);
												espera.addEventListener(TimerEvent.TIMER, function(evento:TimerEvent){
																			historia.gotoAndStop(7)
																			espera.stop()
																			
																		})
												espera.start();
											}
									  })
			historia.addEventListener(EventoBoton.INICIO,function(evento:EventoBoton){	
												//historia.removeChildren(0,historia.numChildren)
												removeChild(historia)
												
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
												
												reloj= new Timer(80);
												reloj.addEventListener(TimerEvent.TIMER, Tick);
												reloj.start();
			
											})
			
			addChild(historia)
			
		}
		/*
		 * Funcion moverse 
		 * 			Crea los listener para leer si se presiona una tecla
		 * 			
		 */
		override public function moverse( e: Event) : void
      	{
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyUp);
      	}
		/*
		 * Funcion KeyDown 
		 * 			Funcion que se llama al recibir que se presiono una tecla
		 * 			
		 */
		override public function KeyDown( e: KeyboardEvent) : void
      	{
			cerdito.tecla(e);
		}
		/*
		 * Funcion KeyUp 
		 * 			Funcion que se llama al recibir que se solto una tecla
		 * 			
		 */
		override public function KeyUp( e: KeyboardEvent) : void
      	{
			cerdito.detenerc(e);
		}
		/*
		 * Funcion Tick
		 * 			Se acualiza la posicion del juego cada vez que cambie el timepo
		 *			Pre condicion: Cambio en el tiempo del reloj
		 *			Post condicon: Cambia los diferentes objetos del juego que dependen del tiempo
		 * 			
		 */
		override public function Tick(timer:TimerEvent){
			
			manzanaPuntaje.gotoAndStop(1);
			
			if(tiempo.segundo==60){
				terminarJuego();
			}else{
				tiempo.Actualizar();
			}
						
			
			if(Math.random() < 0.09 && Math.random() > 0.08 && manzanas.length<2)
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
		/*
		 * Funcion terminarJuego 
		 * 			Termina la partida al morir o terminar el juego
		 *			Pre condicion: Termina la partida
		 *			Post condicion: SE llama el constructor de una de las pantallas
		 * 			
		 */
		override public function terminarJuego(){
			reloj.stop();
			for each ( var M: Manzana in manzanas)
			{
				removeChild(M);
			}
			
			removeChild(cerdito)
			
			if(jugandoReto){
				Control.cliente.bigDB.load("RetosEnviados",Control.retador,function(usuario:DatabaseObject){
													trace("entro aqui i i "+usuario.puntajeRetado)
													usuario.puntajeRetado=int(puntaje.score.text)
													objetoJugardor.PuntajeTotal+=int(puntaje.score.text)
													objetoJugardor.save(false,false,null,null)
													usuario.puntajeRetado=int(puntaje.score.text)
													usuario.save(false,false,null,null)
													if(int(puntaje.score.text)>usuario.miPuntaje){
														objetoJugardor.PuntajeTotal+=int(puntaje.score.text)
														objetoJugardor.save(false,false,null,null)
														
													}else if(int(puntaje.score.text)<usuario.miPuntaje){
														
														Control.cliente.bigDB.load("PlayerObjects",usuario.usuario,function(usuarioGanador:DatabaseObject){
																				   		usuarioGanador.PuntajeTotal+=usuario.miPuntaje
																						usuarioGanador.save(false,false,null,null)
																				   })
														termino = new GameOver();
														addChild(termino);
														esperar = new Timer(3000)
														esperar.addEventListener(TimerEvent.TIMER, salir)
														esperar.start()
													}
												},null)
			}
			if(retando){
				
				if(int(puntaje.score.text) > 100){
					objetoJugardor.PuntajeTotal+=int(puntaje.score.text)
					if(objetoJugardor.nivel1 < int(puntaje.score.text) ){
						objetoJugardor.nivel1 = int(puntaje.score.text) 
						
					}
					if(objetoJugardor.nivelActual==1){
						objetoJugardor.nivelActual=2
					}
					if(retando){
						Control.cliente.bigDB.load("PlayerObjects", MenuCarga.usuarioRetado,function(usuario:DatabaseObject){
														trace(usuario.retos)
														usuario.retos+=1
														
														usuario.save(false,false,null,null)
														Control.cliente.bigDB.createObject("RetosEnviados", objetoJugardor.key+objetoJugardor.retos , {nivel:1,retado:MenuCarga.usuarioRetado,miPuntaje:int(puntaje.score.text), puntajeRetado:-1, resultado:false, usuario:objetoJugardor.key },null,null)	
												   })	
						
					}
					objetoJugardor.retosEnviados+=1
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
		}
		/*
		 * Funcion Salir 
		 * 			Envia un evento de muerte del cerdito para terminar la partida
		 * 			
		 */
		override public function salir(tiempo : TimerEvent){
			esperar.stop()
			removeChild(termino)
			dispatchEvent( new EventosCerdito( EventosCerdito.MUERTE));
			
		}
	}
	
}
