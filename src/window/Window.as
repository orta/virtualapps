package  window {

	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 *	The subclass both orWindow and SWFWindow come from.
	 *  with all the vars they both can use
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author orta
	 *	@since  2008-06-14
	 */
	public class Window extends Sprite {
		
    public static const WINDOW:int     = 0;
	  public static const SUB_MENU:int   = 1;
	  public static const MENU_BAR:int   = 2;
	  public static const PANEL:int      = 3;
	  public static const SWF_WINDOW:int = 4;
	  
		public var windowType:uint = WINDOW;
		public var mPath:String;
		public var appName:String;
    public var mBlurBG: BlurBG;
		
		protected var mOS:OS;
    
		public function Window(){
			super();
		}
		
		public override function toString() : String {
    		  return "Window : '" + mPath + "' its windowType is " + windowType;  
    }
	}
}
