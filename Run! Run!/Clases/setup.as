package  {
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	
	public class setup extends MovieClip {

		function setup() {
		stage.addEventListener(KeyboardEvent.KEY_DOWN, displayKey);
		}

		 
		function displayKey(keyEvent:KeyboardEvent) {
		var modifier:String="";
		var keyPressed:String="";
		 
		if (keyEvent.ctrlKey) {
		modifier="Ctrl + ";
		} else if (keyEvent.altKey) {
		modifier="Alt + ";
		} else if (keyEvent.shiftKey) {
		modifier="Shift + ";
		}
		 
		keyPressed=keyEvent.keyCode.toString();
		 
		trace(keyPressed);
		}
	}
	
}
