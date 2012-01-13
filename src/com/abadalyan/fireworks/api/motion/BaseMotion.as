package com.abadalyan.fireworks.api.motion 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author abadalyan
	 */
	public class BaseMotion 
	{
		
		private var particle:BaseParticle;
		
		private var lastTime:uint;
		private var now:uint;
		private var frameDuration:uint = 0;		
		private var currentDuration:uint = 0;
		private var frameMultiplier:Number;
		
		
		public function BaseMotion(particle:BaseParticle) 
		{
			this.particle = particle;
			
		}		
		
		final public function go():void {
			particle.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		
		private function onEnterFrame(e:Event):void {
			now = getTimer();
			currentDuration += now - lastTime;
			frameDuration = now - lastTime;
			
			if (duration <= data.duration) {
				move(particle, currentDuration, frameDuration/1000);
			}
			else {
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);							
			}
		}
		
		protected function move(particle:BaseMotion, currentDuration:uint, timeDeltaInSeconds:Number):void {
			// override in child classes
		}
		
	}

}