package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/*
	 * Clase Login
	 * Creado por: Rodolfo Verjel
	 * 
	 */
	public class Login extends MovieClip {
		
		/*
		 * Funcion Login 
		 * 			Constructor de la clase Login que instancia la pantalla de Login en el juego
		 * 			Con dos listeners de click del raton para acceder a las diferntes pantallas
		 */
		public function Login() {
			// constructor code
			Bingresar.addEventListener( MouseEvent.CLICK, iniciarSesion);
			BRegistar.addEventListener( MouseEvent.CLICK, registro);
		}
		/*
		 * Funcion iniciarSesion 
		 * 			Crea el evento al dar click en el boton de inicio
		 *			Pre condicion: Se recibe el evento de click 
		 *			Post condicion: envia la señal para crear el evento 			
		 */
		public function iniciarSesion( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.INICIAR));
		}
		/*
		 * Funcion iniciarSesion 
		 * 			Crea el evento al dar click en el boton de Registrarme
		 * 			Pre condicion: Se recibe el evento de click 
		 *			Post condicion: envia la señal para crear el evento 			
		 */
		public function registro( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.REGISTRO));
		}
	}
	
}
