package growl {

  import flash.display.Sprite;
  import flash.events.Event;
  import flash.text.TextField;
  import flash.text.TextFormat;
  import flash.text.AntiAliasType;
  import flash.filters.DropShadowFilter;

  public class Notification extends Sprite {

		private var _noteText : TextField = new TextField();
		private var _textShadowFilter :DropShadowFilter;
		private var _growl: Growl;
		public var _title:String;
    
    // Y informs the notification how far down to draw itself

    public function Notification( growl:Growl, title:String, i:Number ) {
      
      super();
      _title = title;
      _growl = growl;
      
      _noteText.selectable = false;
      _noteText.textColor = 0xeeeeee; 
      var textFormat:TextFormat = new TextFormat();
      textFormat.size = 14;
      textFormat.bold = true;
      textFormat.font = "Lucida Grande"
      _noteText.width = 200;
      _noteText.defaultTextFormat = textFormat;
      _noteText.antiAliasType = AntiAliasType.ADVANCED;
      _noteText.text = _title;
      
      _textShadowFilter = new DropShadowFilter();
      _textShadowFilter.color = 0;
      _textShadowFilter.strength = 1;
      _textShadowFilter.alpha = 0.75;
      _textShadowFilter.quality = 3;
      _textShadowFilter.blurX = 2;
      _textShadowFilter.blurY = 2;
      _textShadowFilter.distance = 1;
      _noteText.filters = [_textShadowFilter];
			
			graphics.beginFill(0x000000, 0.4);
      graphics.drawRoundRect( 0, 0, 20, 20, 20);
      graphics.endFill();
      
		  addChild(_noteText);
			
			x = stage.stageWidth - this.width;
			this.y = i * 30;
			
    }
    
  }
}

