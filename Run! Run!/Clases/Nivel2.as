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
	/*
	 * Clase Nivel2
	 * Creado por: Rodolfo Verjel
	 * 
	 */
	public class Nivel2 extends Nivel {


		private var cerdito: Cerdito;
		private var reloj: Timer;
		private var llave: Llave;
		private var llaves: Array;
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
		/*
		 * Funcion Nivel2 
		 * 			Constructor del Nivel lo instancia al entrar al segundo nivel
		 * 			
		 */
		public function Nivel2(objeto : DatabaseObject) {
			
			super(objeto)
			
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
			balas = new Array();
			addEventListener( Event.ADDED_TO_STAGE, moverse);
			
			reloj= new Timer(50);
			reloj.addEventListener(TimerEvent.TIMER, Tick);
			reloj.start();
			
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
		override public function KeyDown( evento: KeyboardEvent) : void
      	{
			cerdito.tecla(evento);
		}
		/*
		 * Funcion KeyUp 
		 * 			Funcion que se llama al recibir que se solto una tecla
		 * 			
		 */
		override public function KeyUp( evento: KeyboardEvent) : void
      	{
			cerdito.detenerc(evento);
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
			
			if(Math.random() < 0.11 && llaves.length<3)
			{
				var ran: Number = (Math.random()* 150)+10;
				var nM: Manzana = new Manzana(-15,ran);
				manzanas.push(nM);
				
				addChild(nM);
				if(nM.x>805 || nM.y>605){
					removeChild(nM);
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
			
			
			
			while(indiceBalas>-1){
				var B: Bala = balas[indiceBalas];
				B.movimiento();
				
				if (cerdito.hitTestObject(B)){
					restarVida()
					if(vidas==0){
						terminarJuego()
					}
					
					removeChild(B);
					balas.splice(indiceBalas,1);
				}
				if(B.x>825 || B.y > 625){
					removeChild(B);
					balas.splice(balas,1);
				}
				indiceBalas=indiceBalas-1;
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
				Control.cliente.bigDB.load("Reto",Control.retador,function(usuario:DatabaseObject){
													trace("entro aqui i i "+usuario.puntajeRetado)
													usuario.puntajeRetado=int(puntaje.score.text)
													objetoJugardor.PuntajeTotal+=int(puntaje.score.text)
													objetoJugardor.save(false,false,null,null)
													usuario.puntajeRetado=int(puntaje.score.text)
													usuario.save(false,false,null,null)
													if(int(puntaje.score.text)>usuario.miPuntaje){
														objetoJugardor.PuntajeTotal+=int(puntaje.score.text)
														objetoJugardor.save(false,false,null,null)
														
														ganador= new Ganador()
														ganador.GPuntos.text=puntaje.score.text
														addChild(ganador)
														esperar = new Timer(3000)
														esperar.addEventListener(TimerEvent.TIMER, salir)
														esperar.start()
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
			if(!jugandoReto){
				
				if(int(puntaje.score.text) > 100){
					gano=true
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
														
														Control.cliente.bigDB.createObject("Reto", objetoJugardor.key+objetoJugardor.retos , {nivel:1,retado:MenuCarga.usuarioRetado,miPuntaje:int(puntaje.score.text), puntajeRetado:-1, resultado:false, usuario:objetoJugardor.key },null,null)	
												   })	
							objetoJugardor.retosEnviados+=1
					}
					
					objetoJugardor.save(false,false,null,null)
					ganador= new Ganador()
					ganador.GPuntos.text=puntaje.score.text
					addChild(ganador)
					esperar = new Timer(3000)
					esperar.addEventListener(TimerEvent.TIMER, salir)
					esperar.start()
					
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
			if(gano){
				removeChild(ganador)
				dispatchEvent( new EventosCerdito( EventosCerdito.GANO));
			}else{
				removeChild(termino)
				dispatchEvent( new EventosCerdito( EventosCerdito.MUERTE))
			}
		}
		/*
		 * Funcion Salir 
		 * 			Envia un evento de muerte del cerdito para terminar la partida
		 * 			Pre condicion: El cerdito toca algun objeto maligno
		 *			Post condicion: La variable vida se reduce 
		 */
		private function restarVida(){
			if(vidas==3){
				removeChild(vida3)
			}else if(vidas==2){
				removeChild(vida2)
			}else{
				removeChild(vida1)
			}
			vidas-=1
			
		}
	}
	
}
