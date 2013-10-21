package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import playerio.PlayerIO;
	import playerio.Client;
	import playerio.PlayerIOError;
	import playerio.DatabaseObject;

	public class Control extends State
	{

		private var menuprincipal:MenuPrincipal;
		private var nivel1:Nivel;
		private var nivel2:Nivel2;
		private var reto:MenuReto;
		private var login:Login;
		private var registro:Registrarse;
		private var error : MensajeUsuario;
		private static var client:Client
		private static var objectoJugador:DatabaseObject
		
		public function Control()
		{
			
			login=new Login();
			addChild(login);
			error = new MensajeUsuario();
			error.addEventListener(EventoBoton.ERROR, regresar);
			
			login.addEventListener(EventoBoton.INICIAR, inicioSesion);
			login.addEventListener(EventoBoton.REGISTRO, registrar);
			

		}

		public function SeleccionNivel1(evento : EventoBoton):void
		{

			reto = new MenuReto();
			reto.addEventListener(EventoBoton.JUGAR, cargarNivel);
			addChild(reto);

		}
		public function SeleccionNivel2(evento : EventoBoton):void
		{

			reto = new MenuReto();
			reto.addEventListener(EventoBoton.JUGAR, cargarNivel2);
			addChild(reto);

		}
		public function cargarNivel(evento : EventoBoton):void
		{

			nivel1 = new Nivel(objectoJugador);
			nivel1.x = 0;
			nivel1.y = 0;
			nivel1.addEventListener(EventosCerdito.MUERTE, perdio);
			nivel1.addEventListener(EventosCerdito.GANO, gano);
			addChild(nivel1);
			removeChild(reto);
		}
		public function cargarNivel2(evento : EventoBoton):void
		{

			nivel2 = new Nivel2(objectoJugador);
			nivel2.x = 0;
			nivel2.y = 0;
			nivel2.addEventListener(EventosCerdito.MUERTE, perdio2);
			nivel2.addEventListener(EventosCerdito.GANO, gano2);
			addChild(nivel2);
			removeChild(reto);
		}
	
		public function inicioSesion(evento : EventoBoton):void
		{

			trace(login.NombreUs.text);
			trace(login.Contrasena.text);
			
			if(login.NombreUs.text != "")
			{
				PlayerIO.quickConnect.simpleConnect(
					stage, 					
					"run-run-piggy-run-nhqdamv1fkg5kgcfjey7q", login.NombreUs.text,	login.Contrasena.text,					
					function (){
						trace("-------------------------------------")
						PlayerIO.connect(
						stage,"run-run-piggy-run-nhqdamv1fkg5kgcfjey7q","public",login.NombreUs.text,"",
						null,function (cliente:Client){
									cliente.bigDB.loadMyPlayerObject(function(objecto:DatabaseObject){
										objectoJugador = objecto; 
										menuprincipal = new MenuPrincipal(objecto);
										menuprincipal.addEventListener(EventoBoton.NIVEL1, SeleccionNivel1);
										menuprincipal.addEventListener(EventoBoton.NIVEL2, SeleccionNivel2);
										addChild(menuprincipal);
										removeChild(login);
																	 
									});
						});
					},  function(errorIO : PlayerIOError){
							error.gotoAndStop(3);
							addChild(error);
						}
					);
			}

		}
		
		public function registrar(evento : EventoBoton):void{
			
			registro = new Registrarse();
			registro.addEventListener(EventoBoton.REGISTRO,registrarUsuario);
			removeChild(login);
			addChild(registro);
			
		}
		
		private function registrarUsuario(e:EventoBoton){
			
			var usuarioNuevo : String= registro.BRNombre.text;
			var contrasena : String= registro.BRContrasena.text;
			var confirmarContrasena : String= registro.BRConfirmar.text;
			var encontro : Boolean = false;
			
			if(contrasena == confirmarContrasena){
				
				PlayerIO.quickConnect.simpleRegister(
					stage, 					
					"run-run-piggy-run-nhqdamv1fkg5kgcfjey7q",
					usuarioNuevo,				
					contrasena,	
					null,null,null,null,null,
					function(client:Client):void{
						trace("aqui")
						client.bigDB.createObject("PlayerObjects", usuarioNuevo, {PuntajeTotal:0, nivel1:0,nivel2:0 },null);
						registro.BRNombre.text="";
						registro.BRContrasena.text="";
						registro.BRConfirmar.text="";
						removeChild(registro);
						addChild(login);
					},			
					function(errorIO:PlayerIOError){
						error.gotoAndStop(2);
						addChild(error);
					}
					);
			
			}else{
				error.gotoAndStop(1);
				addChild(error);
				trace("contrasena diferente")
			}
	
		}
		
		private function gano(evento: EventosCerdito){
			removeChild(nivel1);
			menuprincipal = new MenuPrincipal(objectoJugador);
			menuprincipal.addEventListener(EventoBoton.NIVEL1, SeleccionNivel1);
			menuprincipal.addEventListener(EventoBoton.NIVEL2, SeleccionNivel2);
			addChild(menuprincipal);
		}
		
		private function perdio(evento: EventosCerdito){
			removeChild(nivel1);
			menuprincipal = new MenuPrincipal(objectoJugador);
			menuprincipal.addEventListener(EventoBoton.NIVEL1, SeleccionNivel1);
			menuprincipal.addEventListener(EventoBoton.NIVEL2, SeleccionNivel2);
			addChild(menuprincipal);
		}
		private function gano2(evento: EventosCerdito){
			removeChild(nivel2);
			menuprincipal = new MenuPrincipal(objectoJugador);
			menuprincipal.addEventListener(EventoBoton.NIVEL1, SeleccionNivel1);
			menuprincipal.addEventListener(EventoBoton.NIVEL2, SeleccionNivel2);
			addChild(menuprincipal);
		}
		
		private function perdio2(evento: EventosCerdito){
			removeChild(nivel2);		
			menuprincipal = new MenuPrincipal(objectoJugador);
			menuprincipal.addEventListener(EventoBoton.NIVEL1, SeleccionNivel1);
			menuprincipal.addEventListener(EventoBoton.NIVEL2, SeleccionNivel2);
			addChild(menuprincipal);
		}
		
		private function regresar(evento : EventoBoton){
			removeChild(error);
		}
		
	}

}