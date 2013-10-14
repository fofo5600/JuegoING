package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Login extends MovieClip {
		
		
		public function Login() {
			// constructor code
			Bingresar.addEventListener( MouseEvent.CLICK, iniciarSesion);
			BRegistar.addEventListener( MouseEvent.CLICK, registro);
		}
		
		public function iniciarSesion( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.INICIAR));
		}
		public function registro( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.REGISTRO));
		}
	}
	
}
