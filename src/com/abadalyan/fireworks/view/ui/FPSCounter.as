package com.abadalyan.fireworks.view.ui {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	
	public class FPSCounter extends MovieClip {
		
		private var lastTime:uint;
		private var duration:uint = 0;
		private var frames:int = 0;
		private var fps:Number;
		
		public function FPSCounter() {		
			lastTime = getTimer();
			addEventListener(Event.ENTER_FRAME, onEnterFrame);			
		}
		
		private function onEnterFrame(e:Event):void {
			var now:uint = getTimer();
			duration = now - lastTime;
			
			frames++;
			
			if (duration >= 1000) { 
				fps = frames / duration * 1000;
				fpsFld.text = fps.toFixed(1)+" fps";
				
				frames = 0;			
				lastTime = now;
			}
		}
	}
	
}
