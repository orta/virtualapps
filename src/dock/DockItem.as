﻿/* AS3	Copyright 2008 orta.*/package dock {	import flash.display.*;	import flash.events.*;	import flash.net.URLLoader;	import flash.net.URLRequest;	import flash.events.ErrorEvent;	import flash.events.MouseEvent;  import flash.text.TextField;  import visor.lt.uza.utils.*;		/**	 *	Holds the application icon or the window icon (if minimize gets added)	 *	 *	@langversion ActionScript 3.0	 *	@playerversion Flash 9.0	 *	 *	@author orta	 *	@since  13.06.2008	 *  	 **/	 	public class DockItem extends Sprite {    private var $:Global = Global.init();		public var itemName:String;		public var itemWindow:String;		public function draw() : void {            var imagePath:String =  "img/dock/" + itemName + ".png";      try{        var loader:Loader = new Loader();         var imageURL:URLRequest = new URLRequest(imagePath);        loader.load(imageURL);      }     catch(error:IOErrorEvent){        $.trace("Dock Image not found at path: " + imagePath + " error =" +error);      }      this.addChild(loader);      width = 128;      height = 128;      scaleX = 0.5;      scaleY = 0.5;    }		        		 public override function toString():String {		  return itemName;		}			}}