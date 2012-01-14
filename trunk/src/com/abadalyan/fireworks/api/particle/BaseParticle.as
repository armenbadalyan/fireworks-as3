package com.abadalyan.fireworks.api.particle 
{	
	import com.abadalyan.fireworks.api.motion.IAnimator;
	import com.abadalyan.fireworks.api.motion.LinearMotionAnimator;
	import com.abadalyan.fireworks.api.particle.ParticleData;
	import com.abadalyan.fireworks.api.ISimulation;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class BaseParticle extends Sprite implements ISimulation 
	{
		private var _animator:IAnimator;		
		public var data:ParticleData;		
		
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
		
		public function simulate():void {
			draw();
			_animator.animate(this);
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
		
	}

}