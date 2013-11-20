package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import fl.data.DataProvider; 
	import playerio.DatabaseObject;
	
	
	public class PantallaRetos extends MovieClip {
		public var llave: String
		public var nivel: int
		
		public function PantallaRetos(usuarioJuego:DatabaseObject) {
			// constructor code
			jugar.addEventListener( MouseEvent.CLICK, seleccionJugar);
			volver.addEventListener( MouseEvent.CLICK, regresar);
			
			
			Control.cliente.bigDB.loadRange("Reto", "IDReto",[usuarioJuego.key], null,null,100, function(lista:Array){
											for(var i:int=0;i<lista.length;i++){
												var objetoUsuario:DatabaseObject = lista[i] as DatabaseObject
												if(objetoUsuario!= null){
													var nuevaInfo: InformacionReto = new InformacionReto(objetoUsuario.key,objetoUsuario.nivel,objetoUsuario.retado,objetoUsuario.miPuntaje, objetoUsuario.puntajeRetado, objetoUsuario.resultado )
													nuevaInfo.x=-62.65
													nuevaInfo.y=-66+(23*i)
													
													addChild(nuevaInfo)
													
												}
											}
										})
			Control.cliente.bigDB.loadRange("Reto", "IDReto",[],null,null,100, function(lista:Array){
											trace(lista.length)
											var j:int=0
											for(var i:int=0;i<lista.length;i++){
												var objetoUsuario:DatabaseObject = lista[i] as DatabaseObject
												trace(objetoUsuario.key+" "+objetoUsuario.retado)
												if(objetoUsuario.retado==usuarioJuego.key){
													var nuevaInfo: InformacionReto = new InformacionReto(objetoUsuario.key,objetoUsuario.nivel,objetoUsuario.retado, objetoUsuario.puntajeRetado, objetoUsuario.miPuntaje, objetoUsuario.resultado )
													nuevaInfo.x=-62.65
													nuevaInfo.y=100.95+(23*j)
													j=j+1
													nuevaInfo.addEventListener(MouseEvent.CLICK,function(evento:MouseEvent){   
																			 trace("entro")
																			 llave=nuevaInfo.llave
																			 nivel=nuevaInfo.nivelJugar
																			   })
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
