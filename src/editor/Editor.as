/* AS3
	Copyright 2009 orta.
*/

package editor  {

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.AntiAliasType;
	import flash.filters.DropShadowFilter;
  import visor.lt.uza.utils.*;
  import visor.lt.uza.utils.*;
	
  
	/**
	 *	Allow Editing on Flash 10.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author orta
	 *	@since  2009-7-10
	 */	 
	 
	public class Editor extends Sprite {

    	var mOS:OS;
      private var $:Global = Global.init();

		public function Editor(myOS:OS, filePath = ""):void {
			mOS = myOS;
	  
	}	
}
