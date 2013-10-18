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
		private static var _playerobject:DatabaseObject
		private static var _username:String
		
		public function Control()
		{
			
			login=new Login();
			addChild(login);
			
			login.addEventListener(EventoBoton.INICIAR, inicioSesion);
			login.addEventListener(EventoBoton.REGISTRO, registrar);
			
			menuprincipal = new MenuPrincipal();
			menuprincipal.addEventListener(EventoBoton.NIVEL1, SeleccionNivel1);
			menuprincipal.addEventListener(EventoBoton.NIVEL2, SeleccionNivel2);

		}

		public function SeleccionNivel1(evento : EventoBoton):void
		{

			reto = new MenuReto();
			reto.addEventListener(EventoBoton.NIVEL1, cargarNivel);
			addChild(reto);

		}
		public function SeleccionNivel2(evento : EventoBoton):void
		{

			reto = new MenuReto();
			reto.addEventListener(EventoBoton.NIVEL1, cargarNivel2);
			addChild(reto);

		}
		public function cargarNivel(evento : EventoBoton):void
		{

			nivel1 = new Nivel();
			nivel1.x = 0;
			nivel1.y = 0;
			addChild(nivel1);
			removeChild(reto);
		}
		public function cargarNivel2(evento : EventoBoton):void
		{

			nivel2 = new Nivel2();
			nivel2.x = 0;
			nivel2.y = 0;
			addChild(nivel2);
			removeChild(reto);
		}
	
		public function inicioSesion(evento : EventoBoton):void
		{

			trace(login.NombreUs.text);
			trace(login.Contrasena.text);
			
			if(login.NombreUs.text != ""){
				PlayerIO.quickConnect.simpleConnect(
					stage, 					
					"run-run-piggy-run-nhqdamv1fkg5kgcfjey7q",
					login.NombreUs.text,				
					login.Contrasena.text,						
					function (){
						addChild(menuprincipal);
						removeChild(login);
					},			
					handleError				
					
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
					handleError				
					);
				
			/*
			_client.bigDB.loadRange("PlayerObjects", "Nombre", [], null, null, 10, function handleGetToplist(list:Array):void{
					
					list.sortOn( ["ct"], Array.NUMERIC | Array.DESCENDING);
					trace(list.length);
					for( var a:int=0;a<list.length;a++){
						var co:DatabaseObject = list[a] as DatabaseObject
						trace(co.ct+ " "+ co.key);
						if(co.key== usuarioNuevo){
							error = new MensajeUsuario();
							error.addEventListener(EventoBoton.ERROR, regresar);
							addChild(error);
							trace("Usuario igual");
							encontro=true;
							
						}
					}
					if(!encontro){
						var nuevo:DatabaseObject = new DatabaseObject();
						nuevo.ct=contrasena;
						nuevo.save(false,false,null,null);
						_client.bigDB.createObject("PlayerObjects", usuarioNuevo, nuevo,null);
						registro.BRNombre.text="";
						registro.BRContrasena.text="";
						registro.BRConfirmar.text="";
						removeChild(registro);
						addChild(login);
					}
					
				})
			*/
			}else{
				trace("contrasena diferente")
			}
			
		}
		
		private function handleSuccess(client:Client):void{
			
			client = client
			client.bigDB.load("PlayerObjects", "k" ,function(user:DatabaseObject):void{
				trace("inicia"+ user.key)
				
			}, handleError );
			client.bigDB.loadMyPlayerObject(function(o:DatabaseObject):void{
				_playerobject = o;
			})
		}
		private function regresar(evento : EventoBoton):void{
			removeChild(error); 
		}
		
		private function handleError(e:PlayerIOError):void{
			trace( "error-.............................acaaaaaaaaaaaaaaaaaa..............")
			trace("no se encontrooo o o o o o o o o o o o o o o o o o s")
		}
		private function handleGetToplist(list:Array):void{
			list.sortOn( ["ct"], Array.NUMERIC | Array.DESCENDING);
			trace(list.length);
			for( var a:int=0;a<list.length;a++){
				var co:DatabaseObject = list[a] as DatabaseObject
			    trace(list[a]+ " "+co.ct);
				
			}
		}
		
	}

}