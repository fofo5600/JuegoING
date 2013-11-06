package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import fl.data.DataProvider; 
	import playerio.DatabaseObject;
	
	
	public class PantallaRetos extends MovieClip {
		//private var usuario: DatabaseObject
		
		public function PantallaRetos(usuarioJuego:DatabaseObject) {
			// constructor code
			jugar.addEventListener( MouseEvent.CLICK, seleccionJugar);
			volver.addEventListener( MouseEvent.CLICK, regresar);
			
			//var arrayTemporal:Array = new Array();
			
			Control.cliente.bigDB.loadRange("RetosEnviados", "enviados", [usuarioJuego.key],null,null,100, function(lista:Array){
											trace("entro"+lista.length)
											for(var i:int=0;i<5;i++){
												var objetoUsuario:DatabaseObject = lista[i] as DatabaseObject
												if(objetoUsuario!= null){
													trace("entro")
													var nuevaInfo: InformacionReto = new InformacionReto(objetoUsuario.nivel,objetoUsuario.retado,objetoUsuario.miPuntaje, objetoUsuario.puntajeRetado, objetoUsuario.resultado )
													nuevaInfo.x=-62,65
													nuevaInfo.y=-66+(23*i)
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
