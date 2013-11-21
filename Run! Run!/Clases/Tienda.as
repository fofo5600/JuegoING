package  {
	
	import flash.display.MovieClip;
	
	
	public class Tienda extends DefaultContainer {
		
		private var listaSlots:Array;
		
		// settings
		private var _paddingVertically:int = 32;
		private var _paddingHorizontally:int = 5;
		
		// data
		private var numSlots:int;
		private var numColumnas:int;
		
		public function Tienda(slots:int, columnas:int) {
			// constructor code
			numSlots = slots;
			numColumnas = columnas;			
			
			listaSlots = [];
			
			var tempSlot:Slot;					
			var currentColumn:uint = 0;			
			var currentRow:uint = 0;			
			var currentSlots:uint = 0;
			
			var i:int;
			for (i = 0; i < numSlots; i++)
			{
				var newId:String = "i" + int(i + 1);
				tempSlot = new Slot(newId);
				tempSlot.x = _paddingHorizontally + tempSlot.width * currentColumn;
				tempSlot.y = _paddingVertically + tempSlot.height * currentRow;
				
				addSlot(tempSlot);
				
				currentColumn++;
				if (currentColumn == numColumnas)
				{
					currentRow++;
					currentColumn = 0;
				}
			}
		}
		
		
		public function addSlot(slot:Slot):void
		{
			listaSlots.push(slot);
			addChild(slot);
		}
		
		public function getSlot($slotId:String):Slot
		{
			var i:int;
			var tempSlot:Slot;
			
			for (i = 0; i < listaSlots.length; i++)
			{
				tempSlot = listaSlots[i] as Slot;
				
				if (tempSlot.id == $slotId)
				{
					return tempSlot;
				}
				
			}
			
			trace("! Slot ID '" + $slotId + "' not found!");
			return null;
		}
	}
	
}
