package  {
	
	import flash.display.MovieClip;
	
	
	public class Slot extends DefaultContainer {
		
		private var _id:String;	
		private var _traje:DefaultItem;
		
		public function Slot(traje:String) {
			// constructor code
			
			_id = traje;
			
		}
		
		public function get id():String { return _id; }
		
		public override function addItem($item:DefaultItem):void 
		{
			_traje = $item;
			addChild(_traje);
			
		}
	}
	
}
