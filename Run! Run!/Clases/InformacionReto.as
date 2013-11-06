package  {
	
	import flash.display.SimpleButton;
	import flash.display.MovieClip;
	
	
	public class InformacionReto extends MovieClip {
		
		
		public function InformacionReto(nivelSeleccionado:String, reta:String, misPuntos:String, puntajeRetado:String, vencedor:Boolean) {
			// constructor code
			nivel.text=nivelSeleccionado
			nombre.text=reta
			miPuntaje.text=misPuntos
			puntajeOponente.text=puntajeRetado
			if(vencedor){
				resultado.text="ganaste"
			}else{
				resultado.text="perdiste"
			}
		}
		
	}
	
}
