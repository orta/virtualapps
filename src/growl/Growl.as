/* AS3
  Copyright 2009 orta.
  */
package growl  {

  /**
    *	Growl Like notification system.
    *
    *	@langversion ActionScript 3.0
    *	@playerversion Flash 9.0
    *
    *	@author orta
    *	@since  2009-01-24
    */	 

    import visor.lt.uza.utils.*;
    import flash.display.Sprite;

  public class Growl extends Object {

    private var notifications:Array = new Array(10);
    public var $:Global = Global.init();
    private var _screen:Sprite;
    
    public function Growl( screen:Sprite){
      $.trace("Created Growl singleton");

    }		

    public function addProgressNotification(title:String ) :Notification {
      var found:Boolean = false;
      for (var i:int = 0; i < notifications.length; i++){
        if(notifications[i] == null){
          found = true;
          var note:Notification = new Notification(this, title, i );
          trace()
          notifications[i] = note;
          $.trace("Created Progress Notification: " + title);
          _screen.addChild(note);
          break;
        }
      }
      if (found == false) $.trace("No space for Notification: " + title);
      
      return note;
    }

    public function addNotification(title:String, moreInfo:String) :Notification {
      var found:Boolean = false;
      for (var i:int = 0; i < notifications.length; i++){
        if(notifications[i] == null){
          found = true;
          var note:Notification = new Notification(this, title, i );
          notifications[i] = note;
          $.trace("Created Notification: " + title);
          _screen.addChild(note);

          break;

        }
      }
      if (found == false) $.trace("No space for Notification: " + title);

      return note;
    }

    public function removeNotification(Note:Notification): void { 

    }
  }	
}
