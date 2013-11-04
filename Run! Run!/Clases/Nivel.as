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
	 * Clase Nivel
	 * Creado por: Rodolfo Verjel
	 * 
	 */
	public class Nivel extends MovieClip {
		
		/*
		 * Funcion Nivel 
		 * 			Constructor del Nivel lo instancia al entrar al primer nivel
		 * 			
		 */
		public function Nivel( objeto : DatabaseObject) {
			
			
		}
		/*
		 * Funcion moverse 
		 * 			Crea los listener para leer si se presiona una tecla
		 * 			
		 */
		public function moverse( e: Event) : void
      	{
			
      	}
		/*
		 * Funcion KeyDown 
		 * 			Funcion que se llama al recibir que se presiono una tecla
		 * 			
		 */
		public function KeyDown( e: KeyboardEvent) : void
      	{
			
		}
		/*
		 * Funcion KeyUp 
		 * 			Funcion que se llama al recibir que se solto una tecla
		 * 			
		 */
		public function KeyUp( e: KeyboardEvent) : void
      	{
			
		}
		/*
		 * Funcion Tick
		 * 			Se acualiza la posicion del juego cada vez que cambie el timepo
		 *			Pre condicion: Cambio en el tiempo del reloj
		 *			Post condicon: Cambia los diferentes objetos del juego que dependen del tiempo
		 * 			
		 */
		public function Tick(timer:TimerEvent){
			
		}
		/*
		 * Funcion terminarJuego 
		 * 			Termina la partida al morir o terminar el juego
		 *			Pre condicion: Termina la partida
		 *			Post condicion: SE llama el constructor de una de las pantallas
		 * 			
		 */
		public function terminarJuego(){
	
		}
		/*
		 * Funcion Salir 
		 * 			Envia un evento de muerte del cerdito para terminar la partida
		 * 			
		 */
		public function salir(tiempo : TimerEvent){
			
		}
	}
	
}
