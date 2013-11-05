package  {
	
	import flash.display.MovieClip;
	import playerio.DatabaseObject;
	import playerio.Client;
	import playerio.PlayerIO;
	import playerio.Client;
	import playerio.PlayerIOError;
	import playerio.DatabaseObject;
	import flash.events.MouseEvent;
	
	
	public class TablaPuntaje extends MovieClip {
		
		var usuario: DatabaseObject
		
		public function TablaPuntaje(usuario:DatabaseObject) {
			// constructor code
			this.usuario= usuario
			trace("entro")
			Volver.addEventListener( MouseEvent.CLICK, regresar);
			Control.cliente.bigDB.loadRange("PlayerObjects", "puntajeUsuario", [], null,null, 20, 
										   function(lista:Array)
										   {
										   		
												lista.sortOn(["puntajeTotal"], Array.RETURNINDEXEDARRAY)
												for(var i:int=0;i<10;i++){
													var objetoUsuario:DatabaseObject = lista[i] as DatabaseObject
													if(objetoUsuario!= null){
														TPosicion.appendText(i+1+"\n")
														TNombre.appendText(objetoUsuario.key+"\n")
														TPuntos.appendText(objetoUsuario.PuntajeTotal+"\n")
													}
													
												}
										   		TMisPuntos.appendText(usuario.PuntajeTotal)
										   		TPuesto.appendText( String (lista.indexOf(usuario)))
										   })
			
			
			
		}
		public function regresar( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.VOLVER));
		}
		
	}
	
}
