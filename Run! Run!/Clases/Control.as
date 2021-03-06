﻿package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import playerio.PlayerIO;
	import playerio.Client;
	import playerio.PlayerIOError;
	import playerio.DatabaseObject;
	/*
	 * Clase Control
	 * Creado por: Rodolfo Verjel
	 *
	 */
	public class Control extends MovieClip
	{

		private var menuPrincipal:MenuPrincipal;
		private var nivel1:Nivel;
		private var nivel2:Nivel2;
		private var reto:MenuCarga;
		private var login:Login;
		private var registro:Registrarse;
		private var error : MensajeUsuario;
		public static var cliente:Client
		private static var objectoJugador:DatabaseObject
		private var puntuacion:TablaPuntaje
		private var pantallaReto:PantallaRetos
		private var jugandoReto:Boolean
		public static var retador:String
		private var tienda: ControladorTienda
		
		public function Control()
		{
			jugandoReto=false
			login=new Login();
			addChild(login);
			error = new MensajeUsuario();
			error.addEventListener(EventoBoton.ERROR, regresar);
			
			login.addEventListener(EventoBoton.INICIAR, inicioSesion);
			login.addEventListener(EventoBoton.REGISTRO, registrar);
			login.addEventListener(EventoBoton.INICIO, function(ev:EventoBoton){
								   		tienda = new ControladorTienda()
										removeChild(login)
										addChild(tienda)
								   })
			

		}

		public function SeleccionNivel1(evento : EventoBoton):void
		{
			jugandoReto=false
			reto = new MenuCarga(objectoJugador);
			reto.addEventListener(EventoBoton.JUGAR, cargarNivel);
			reto.addEventListener(EventoBoton.VOLVER, function(evento: EventoBoton)
									 {
										 removeChild(reto)
									 });
			addChild(reto);

		}
		public function SeleccionNivel2(evento : EventoBoton):void
		{
			jugandoReto=false
			reto = new MenuCarga(objectoJugador);
			reto.addEventListener(EventoBoton.JUGAR, cargarNivel2);
			reto.addEventListener(EventoBoton.VOLVER, function(evento: EventoBoton)
									 {
										 removeChild(reto)
									 });
			addChild(reto);

		}
		public function cargarNivel(evento : EventoBoton):void
		{

			nivel1 = new Nivel1(objectoJugador, jugandoReto);
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
		public function mostrarPuntaje(evento : EventoBoton):void
		{
			puntuacion = new TablaPuntaje(objectoJugador)
			//removeChild(menuprincipal)
			puntuacion.addEventListener(EventoBoton.VOLVER, function(evento: EventoBoton)
									 {
										 removeChild(puntuacion)
									 });
			addChild(puntuacion)
			
			
		}
		public function inicioSesion(evento : EventoBoton):void
		{

	
			if(login.NombreUs.text != "")
			{
				
				PlayerIO.quickConnect.simpleConnect(
					stage, 					
					"run-run-piggy-run-nhqdamv1fkg5kgcfjey7q", login.NombreUs.text,	login.Contrasena.text,					
					function (){
						trace(login.NombreUs.text+" "+ login.Contrasena.text )
						//
						PlayerIO.connect(
						stage,"run-run-piggy-run-nhqdamv1fkg5kgcfjey7q","public",login.NombreUs.text,"",
						null,function (clienteNuevo:Client){
									cliente= clienteNuevo
									cliente.bigDB.loadMyPlayerObject(function(objecto:DatabaseObject){
																	 
										objectoJugador = objecto; 
										cargarMenuPrincipal()
										trace("-------------------------------------")
										removeChild(login);
																	 
									});
						});
					},  function(errorIO : PlayerIOError){
							error.gotoAndStop(3);
							trace(errorIO)
							addChild(error);
						}
					);
			}

		}
		public function registrar(evento : EventoBoton):void{
			
			registro = new Registrarse();
			registro.addEventListener(EventoBoton.REGISTRO,registrarUsuario);
			registro.addEventListener(EventoBoton.VOLVER,function(evento : EventoBoton){
									  		removeChild(registro)
											addChild(login)
									  });
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
						//trace("aqui")
						client.bigDB.createObject("PlayerObjects", usuarioNuevo, {puntajeTotal:0, nivel1:0,nivel2:0, nivelActual:1, retos:0, retosEnviados:0 },null);
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
			cargarMenuPrincipal()
		}
		
		private function perdio(evento: EventosCerdito){
			removeChild(nivel1);
			cargarMenuPrincipal()
		}
		private function gano2(evento: EventosCerdito){
			removeChild(nivel2);
			cargarMenuPrincipal()
		}
		
		private function perdio2(evento: EventosCerdito){
			removeChild(nivel2);		
			cargarMenuPrincipal()
		}
		
		private function regresar(evento : EventoBoton){
			removeChild(error);
		}
		private function pantallaRetos(evento:EventoBoton){
			pantallaReto= new PantallaRetos(objectoJugador)
			pantallaReto.addEventListener(EventoBoton.JUGAR, function(evento:EventoBoton){
										  		jugandoReto=true
												retador=pantallaReto.llave
												if(pantallaReto.nivel==1){
													cargarNivel(evento)
												}else if(pantallaReto.nivel==2){
													cargarNivel2(evento)
												}
												removeChild(pantallaReto)
										  });
			pantallaReto.addEventListener(EventoBoton.VOLVER, function(evento: EventoBoton){
										 		removeChild(pantallaReto)
									 		});
			addChild(pantallaReto)
		}
		
		private function cargarMenuPrincipal(){
			menuPrincipal = new MenuPrincipal(objectoJugador);
			menuPrincipal.addEventListener(EventoBoton.NIVEL1, SeleccionNivel1);
			menuPrincipal.addEventListener(EventoBoton.NIVEL2, SeleccionNivel2);
			menuPrincipal.addEventListener(EventoBoton.PUNTAJE, mostrarPuntaje);
			menuPrincipal.addEventListener(EventoBoton.RETOS, pantallaRetos);
			addChild(menuPrincipal);
		}
	}

}