package  {
	
	import flash.display.SimpleButton;
	import flash.display.MovieClip;
	
	
	public class InformacionReto extends MovieClip {
		public var llave:String
		public var nivelJugar:int
		
		public function InformacionReto(llave:String,nivelSeleccionado:String, reta:String, misPuntos:String, puntajeRetado:String, vencedor:Boolean) {
			// constructor code
			this.llave=llave
			nivelJugar=int(nivelSeleccionado)
			nivel.text=nivelSeleccionado
			nombre.text=reta
			
			if(int(misPuntos)!=-1){
				miPuntaje.text=misPuntos
			}
			if(int(puntajeRetado)!=-1){
				puntajeOponente.text=puntajeRetado
			}
			if(int(misPuntos)!=-1 && int(puntajeRetado)!=-1 ){
				if(vencedor){
					resultado.text="ganaste"
				}else{
					resultado.text="perdiste"
				}
			}
		}
		
	}
	
}
