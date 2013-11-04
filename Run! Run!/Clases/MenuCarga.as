package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import fl.data.DataProvider; 
	import fl.events.ListEvent;
	import playerio.DatabaseObject;
	
	/*
	 * Clase MenuReto
	 * Creado por: Rodolfo Verjel
	 * 
	 */
	public class MenuCarga extends MovieClip {
		private var usuario: DatabaseObject
		public static var usuarioRetado: String
		/*
		 * Funcion MenuReto 
		 * 			Constructor del MenuRetol que crea una instancia al entrar a un nivel
		 * 			
		 */
		public function MenuCarga(usuario:DatabaseObject) {
			// constructor code
			jugar.addEventListener( MouseEvent.CLICK, seleccionJugar);
			CVolver.addEventListener( MouseEvent.CLICK, regresar);
			var arrayTemporal:Array = new Array();
			usuarioRetado=""
			Control.cliente.bigDB.loadRange("PlayerObjects", "puntajeUsuario", [], null,null, 20, 
										   function(lista:Array)
										   {
											  
											   for(var i:int=0;i<lista.length;i++){
												   
													var objetoUsuario:DatabaseObject = lista[i] as DatabaseObject
													arrayTemporal.push( objetoUsuario.key) 
													
												}
										   		Reto.dataProvider = new DataProvider(arrayTemporal)
												
										   })
										   
			
			Reto.addEventListener(ListEvent.ITEM_CLICK, function(evento: ListEvent){
								  					usuarioRetado = arrayTemporal[evento.rowIndex]
													//dispatchEvent(new EventosReto(EventosReto.RETAR))
								  			}); 
		}
		
		public function seleccionJugar( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.JUGAR));
		}
		public function regresar( evento : MouseEvent): void{
			removeChild(Reto)
			dispatchEvent(new EventoBoton(EventoBoton.VOLVER));
		}
	}
	
}
