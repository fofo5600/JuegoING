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
		private static var _client:Client
		private static var _playerobject:DatabaseObject
		private static var _username:String
		
		public function Control()
		{
			// constructor code
			
			login=new Login();
			addChild(login);
			
			login.addEventListener(EventoBoton.INICIAR, inicioSesion);
			login.addEventListener(EventoBoton.REGISTRO, registrar);
			
			menuprincipal = new MenuPrincipal();
			menuprincipal.addEventListener(EventoBoton.NIVEL1, SeleccionNivel1);
			menuprincipal.addEventListener(EventoBoton.NIVEL2, SeleccionNivel2);

			//addChild(menuprincipal);

			//registrar();
		}

		public function SeleccionNivel1(evento : EventoBoton):void
		{

			//trace(evento.currentTarget.)
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

			//trace(evento.currentTarget.)
			//login.NombreUs.visible=false;
			trace(login.NombreUs.text);
			trace(login.Contrasena.text);
			_client.bigDB.load("PlayerObjects", "d" ,function(user:DatabaseObject):void{
				trace("inicia")
			})  


		}
		
		public function registrar(evento : EventoBoton):void{
			
			
			
			registro = new Registrarse();
			registro.addEventListener(EventoBoton.REGISTRO,registrarUsuario);
			removeChild(login);
			addChild(registro);
			
			//_client.bigDB.createObject();
			
			//base.startGame();
			//e.preventDefault()
			//e.stopImmediatePropagation()
			//_client.bigDB.loadRange("PlayerObjects", "Nombre", [], null, null, 10, handleGetToplist)
		//}		
		var username:String= "a";
			_username = username.replace(/[^A-Z0-9]+/gi,"");
			if(_username != ""){
				//loginbtn.visible = false;
				PlayerIO.connect(
					stage, 					//Referance to stage
					"run-run-piggy-run-nhqdamv1fkg5kgcfjey7q",//Game id (Get your own at playerio.com. 1: Create user, 2:Goto admin pannel, 3:Create game, 4: Copy game id inside the "")
					"public",//Config.connectionId,	//Connection id, default is public
					"a",				//Username
					"",						//User auth. Can be left blank if authentication is disabled on connection
					null,					//Current PartnerPay partner.
					handleSuccess,			//Function executed on successful connect
					handleError				//Function executed if we recive an error
					
				);
			}
			
		}
		
		private function registrarUsuario(e:EventoBoton){
			
			var usuarioNuevo : String= registro.BRNombre.text;
			var contrasena : String= registro.BRContrasena.text;
			var confirmarContrasena : String= registro.BRConfirmar.text;
			var encontro : Boolean = false;
			if(contrasena == confirmarContrasena){
			
			_client.bigDB.loadRange("PlayerObjects", "Nombre", [], null, null, 10, function handleGetToplist(list:Array):void{
					
					list.sortOn( ["ct"], Array.NUMERIC | Array.DESCENDING);
					trace(list.length);
					for( var a:int=0;a<list.length;a++){
						var co:DatabaseObject = list[a] as DatabaseObject
						trace(co.ct+ " "+ co.key);
						if(co.key== usuarioNuevo){
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
			
			}else{
				trace("contrasena igual")
			}
			
		}
		
		private function handleSuccess(client:Client):void{
			trace( "error-...........................................")
			_client = client
			trace( "error-...........................................")
			client.bigDB.loadMyPlayerObject(function(o:DatabaseObject):void{
				_playerobject = o;
				trace(_playerobject.toString());
				//callback();
			})
		}
		
		
		private function handleError(e:PlayerIOError):void{
			//loginbtn.visible = true;
			trace( "error-...........................................")
		}
		private function handleGetToplist(list:Array):void{
			list.sortOn( ["ct"], Array.NUMERIC | Array.DESCENDING);
			trace(list.length);
			for( var a:int=0;a<list.length;a++){
				var co:DatabaseObject = list[a] as DatabaseObject
			    trace(list[a]+ " "+co.ct);
				//var r:HighscoreEntry = new HighscoreEntry( a+1, co.key, parseInt(co.ct+1) );
				//addChild(r)
				//r.x = 152
				//r.y = 126 + a * 15
				
			}
		}
		
	}

}