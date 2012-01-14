package com.abadalyan.fireworks.api.motion 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.particle.ParticleProperties;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author abadalyan
	 */
	public class Animator implements IAnimator
	{
		
		private var particle:BaseParticle;
		
		private var lastTime:uint;
		private var now:uint;
		private var frameDuration:uint = 0;		
		private var currentDuration:uint = 0;
		private var frameMultiplier:Number;		
		
		
		public function Animator() 
		{
						
		}		
		
		final public function animate(particle:BaseParticle):void {
			this.particle = particle;
			lastTime = getTimer();
			particle.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		
		private function onEnterFrame(e:Event):void {
			now = getTimer();
			currentDuration += now - lastTime;
			frameDuration = now - lastTime;
			
			if (currentDuration <= particle.data.properties[ParticleProperties.DURATION]) {
				
				frameMultiplier = frameDuration / 1000;				
				animateFrame(particle, currentDuration, frameMultiplier);
				
				lastTime = now;
			}
			else {
				particle.removeEventListener(Event.ENTER_FRAME, onEnterFrame);	
				
				// move it to factory later
				particle.visible = false;
			}
		}
		
		protected function animateFrame(particle:BaseParticle, currentDuration:uint, timeDeltaInSeconds:Number):void {
			// override in child classes
		}		
	}

}