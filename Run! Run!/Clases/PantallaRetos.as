package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import fl.data.DataProvider; 
	import playerio.DatabaseObject;
	
	
	public class PantallaRetos extends MovieClip {
		private var usuario: DatabaseObject
		
		public function PantallaRetos(usuario:DatabaseObject) {
			// constructor code
			jugar.addEventListener( MouseEvent.CLICK, seleccionJugar);
			volver.addEventListener( MouseEvent.CLICK, regresar);
			
			//var arrayTemporal:Array = new Array();
			
			Control.cliente.bigDB.loadRange("RetosEnviados", "enviados", [],null,null,100, function(lista:Array){
											trace("entro"+lista.length)
											for(var i:int=0;i<5;i++){
												var objetoUsuario:DatabaseObject = lista[i] as DatabaseObject
												if(objetoUsuario!= null){
													trace("entro")
													var nuevaInfo: InformacionReto = new InformacionReto()
													nuevaInfo.x=-62,65
													nuevaInfo.y=-66+(23*i)
													nuevaInfo.nivel.appendText(objetoUsuario.nivel)
													//nuevaInfo.nombre.appendText(objetoUsuario.retado)
													//nuevaInfo.miPuntaje.appendText(objetoUsuario.miPuntaje)
													//nuevaInfo.puntajeOponente..appendText(objetoUsuario.puntajeRetado)
													nuevaInfo.gotoAndStop(1)
													addChild(nuevaInfo)
												}
											}
										})
											
											
		}
		public function seleccionJugar( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.JUGAR));
		}
		public function regresar( evento : MouseEvent): void{
			dispatchEvent(new EventoBoton(EventoBoton.VOLVER));
		}
	}
	
}
