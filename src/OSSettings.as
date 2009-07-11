﻿package {	import flash.events.*;	import flash.xml.XMLDocument;	import flash.net.URLLoader;	import flash.net.URLRequest;	import flash.geom.Rectangle;	import flash.display.*;	import flash.filters.DropShadowFilter;  import visor.lt.uza.utils.*;		public class OSSettings {			  		public var mOS:OS;		private var $:Global = Global.init();    		public function OSSettings(theOS:OS) {						mOS = theOS;			var xmlString:URLRequest = new URLRequest("xml/" + "vasettings" + ".xml");			try{			var xmlLoader:URLLoader = new URLLoader(xmlString);			}			catch(error:IOErrorEvent){				$.trace("can't find the va settings... ");			}										xmlLoader.addEventListener(Event.COMPLETE, xmlLoaded);		}						private function xmlLoaded(event:Event): void {						var xDoc:XMLDocument=new XMLDocument;			xDoc.ignoreWhite=true;			var mXML:XML=XML(event.target.data);			xDoc.parseXML(mXML.toXMLString());						// this is the real XML spec			var debugLevel:Number = 1;			if(mXML.dlevel.toString()  != "0"){			//	mOS.debugLevel = mXML.dlevel;			mOS.devMode = true;		// TODO: debug level			}									if(mXML.taskbar == "yes"){				mOS.hasTaskbar = true;			}						mOS.titleright = mXML.titleright;						mOS.titleleft = mXML.titleleft;						mOS.titlecenter = mXML.titlecenter;						if(mXML.dragdepth.toString()  != ""){				mOS.dragDepth = mXML.dragdepth;			}						if(mXML.blurall == "yes"){				mOS.isVista = true;			}						if(mXML.showborders == "no"){				mOS.showBorders = false;			}						if(mXML.blur == "yes"){				mOS.applyBlur = true;			}						if(mXML.dock =="yes"){				mOS.hasDock = true;			}						if(mXML.singlewindowmode == "no"){				mOS.singleWindow = false;			}						if(mXML.addshadows =="yes"){				mOS.allShadows = true;			}						if(mXML.yoffset.toString() != ""){				mOS.yOffset = mXML.yoffset;			}						if(mXML.xoffset.toString() != ""){				mOS.xOffset = mXML.xoffset;			}						if(mXML.topbar.toString() != ""){				var bar:Sprite = new Sprite();				var loader:Loader = new Loader(); 				bar.addChild(loader); 				var imageURL:URLRequest = new URLRequest("img/" + mXML.topbar);				loader.load(imageURL);				mOS.topBar = bar;				var dropShadow:DropShadowFilter = new DropShadowFilter();				dropShadow.color = 0x000000;				dropShadow.strength = 0.8;				dropShadow.blurX = 30;				dropShadow.blurY = 15;				dropShadow.angle = 90;				dropShadow.alpha = 0.5;				dropShadow.distance = 2;				mOS.topBar.filters = [dropShadow];				mOS.addChild(mOS.topBar);			}			if(mXML.bottombar.toString() != ""){			  				var bar2:Sprite = new Sprite();				var loader2:Loader = new Loader(); 				bar2.addChild(loader2); 				var imageURL2:URLRequest = new URLRequest("img/" + mXML.bottombar);				loader2.load(imageURL2);				mOS.bottomBar = bar2;				//bar.width = mOS.stage.stageWidth;				mOS.addChild(mOS.bottomBar);			}						var pattern:RegExp = /width(.*)/;   // take out the number after width			var theResult:Object = pattern.exec(mXML.close.x);			if(theResult){				mOS.closeRect = new Rectangle(0, mXML.close.y, mXML.close.width, mXML.close.height);				mOS.rightAlignedCloseRect = theResult[1]; // it actually comes up twice							}else{				mOS.closeRect = new Rectangle(mXML.close.x, mXML.close.y, mXML.close.width, mXML.close.height);			}			var i:int = 0;			var windowlist:XMLList = mXML.open;			for each (var button2:XML in windowlist) {				if(button2.toString() != "") { 					i++;					mOS.addWindow(button2, false) ;					}			}							var swf:XMLList = mXML.swf;			for each (var swfView:XML in swf) {				if(swfView.toString() != "") { 					mOS.addSWF(swfView);				}			}				if(mXML.menu){				mOS.setCurrentApplication(mXML.menu);			}		}	}}