package  {
	import flash.display.MovieClip;
	
	public class ControladorTienda extends MovieClip {
		
		private var tienda:Tienda
			
		public function ControladorTienda() {
			// constructor code
			CrearTienda(4,1)
		}
		
		public function CrearTienda(slots:int, columnas:int):void{
			tienda = new Tienda(slots, columnas)
			tienda.x = 0;
			tienda.y = 0;
			
			createItemInSlot("zombiePiggy", "i1");
			//createItemInSlot("siperPiggy", "i2");
			//createItemInSlot("puercoPotter", "i3");
			
			addChild(tienda)
		}
		
		public function createItemInSlot($itemId:String, $slotId:String):void
		{
			trace("createItemInSlot");
			trace("\t item id: " + $itemId);
			trace("\t slot id: " + $slotId);
			
			// get slot
			var tempSlot:DefaultContainer = tienda.getSlot($slotId);
			
			// create item
			var tempItem:DefaultItem = createItemGraphic($itemId, tempSlot.width / 2, tempSlot.height / 2);
			
			// set container
			tempItem.currentContainer = tempSlot;
			tempSlot.addItem(tempItem);
		}
		
		private function createItemGraphic($itemId:String, $x:Number, $y:Number):DefaultItem
		{
			var tempItem:DefaultItem
			
			switch($itemId)
			{
				case "zombiePiggy":
				tempItem = new Item01("zombiePiggy", ItemTypes.WEAPON_LASER, $x, $y);
				break;
				
				/*case "BitmapItem02":
				tempItem = new Item02("BitmapItem02", ItemTypes.WEAPON_PROJECTILE, $x, $y);
				break;
				
				case "BitmapItem03":
				tempItem = new Item03("BitmapItem03", ItemTypes.WEAPON_LASER, $x, $y);
				break;
				
				case "BitmapItem04":
				tempItem = new Item04("BitmapItem04", ItemTypes.MATERIAL_CRYSTAL, $x, $y);
				break;*/
			}
			
			tempItem.addEventListener(ItemEvent.ITEM_PICKED_UP, onItemPickedUp);
			tempItem.addEventListener(ItemEvent.ITEM_DROPPED, onItemDropped);
			
			return tempItem;
		}
		
		private function pickUpItem($item:DefaultItem):void
		{
			// save reference to item's current container
			$item.lastContainer = $item.currentContainer;
			
			// remove item from current container
			//$item.currentContainer.removeItem($item);
			
			// add item to canvas
			//addChild($item);		
			
			// start dragging item
			$item.startDrag(true);
			
			// show selected frame
			//$item.gotoAndStop(2);
		}
		
		private function onItemPickedUp(e:ItemEvent):void 
		{
			trace("onItemPickedUp");			
			trace("\t item id: " + e.item.id);
			
			pickUpItem(e.item as DefaultItem);
		}
		
		/**
		 * Item drop handler
		 */
		private function onItemDropped(e:ItemEvent):void 
		{
			trace("onItemDropped");			
			trace("\t item id: " + e.item.id);
			
			//dropItem(e.item as DefaultItem);
		}

	}
	
}
