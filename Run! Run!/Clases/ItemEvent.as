/**
 * Inventory System Manager
 * ---------------------
 * VERSION: 1.1.1
 * DATE: 07/24/2011
 * AS3
 * UPDATES AND DOCUMENTATION AT: http://www.FreeActionScript.com
 **/
package 
{
	import DefaultItem;
	import flash.events.Event;
	
	public class ItemEvent extends Event
	{
		public static const UPDATED = "updated";
		public static const ITEM_PICKED_UP = "itemPickedUp";
		public static const ITEM_DROPPED = "itemDropped";
		
		public var item:DefaultItem;
		
		public function ItemEvent(type:String, $item:DefaultItem = null)
		{
			super(type);
			item = $item;
		}
		
	}
}
