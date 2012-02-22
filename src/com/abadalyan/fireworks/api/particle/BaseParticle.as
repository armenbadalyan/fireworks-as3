package com.abadalyan.fireworks.api.particle 
{	
	import com.abadalyan.fireworks.api.event.ParticleEvent;
	import com.abadalyan.fireworks.api.motion.IAnimator;
	import com.abadalyan.fireworks.api.motion.LinearMotionAnimator;
	import com.abadalyan.fireworks.api.particle.ParticleData;
	import com.abadalyan.fireworks.api.ISimulation;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class BaseParticle extends Sprite implements ISimulation 
	{
		private var _animator:IAnimator;		
		public var data:ParticleData;		
		
		private var lastTime:uint;
		private var now:uint;		
		private var currentDuration:uint = 0;
		private var frameDuration:Number;
		
		public function BaseParticle(animator:IAnimator = null) 
		{
			data = new ParticleData();
			
			if (!animator) {
				_animator = new LinearMotionAnimator();				
			}
			else {
				_animator = animator;
			}
			
		}
		
		final public function simulate():void {
			lastTime = getTimer();
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			draw();
			_animator.animate(this);
		}
		
		public function stop():void {
			// TODO: implement this
		}
		
		protected function draw():void {
			
		}
		
		/**
		 * 
		 *  Sets new motion for particle
		 * 
		 */		 
		public function set animator(value:IAnimator):void 
		{
			_animator = value;
		}
		
		private function onEnterFrame(e:Event):void {
			now = getTimer();
			currentDuration += now - lastTime;
			frameDuration = (now - lastTime)/1000;
			lastTime = now;
			
			
			
			if (currentDuration > data.properties[ParticleProperties.DURATION]) {
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				dispatchEvent(new ParticleEvent(ParticleEvent.PARTICLE_EXPIRED));
			}
			else {				
				this.x += data.properties[ParticleProperties.SPEED].x * frameDuration;
				this.y += data.properties[ParticleProperties.SPEED].y * frameDuration;
			}
		}
		
	}

}