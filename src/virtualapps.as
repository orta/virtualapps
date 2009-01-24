package {
	
	import flash.events.Event;
	import flash.display.Sprite;
	
	/**
	 *	Main Class for Project. Only used if compiled through TextMate
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author orta
	 *	@since 22.05.2008
	 */	
	 
	public class virtualapps extends OS {
    [SWF(width='800', height='600', backgroundColor='#889981', frameRate='25')]
    
		public function virtualapps() {
			super();      
      stage.addEventListener( Event.RESIZE, initialise );
		}
		
		private function initialise( event:Event ): void {			
			stage.removeEventListener( Event.RESIZE, initialise );
		}
		
	}
	
}
