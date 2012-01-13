package com.abadalyan.fireworks.api.particle 
{
	import com.abadalyan.fireworks.api.motion.BaseMotion;
	import com.abadalyan.fireworks.api.motion.LinearMotion;
	import com.abadalyan.fireworks.api.particle.ParticleData;
	import com.abadalyan.fireworks.api.ISimulation;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class BaseParticle extends Sprite implements ISimulation 
	{
		private var _motion:BaseMotion;		
		public var data:ParticleData;
		
		public function BaseParticle(motion:BaseMotion = null) 
		{
			data = new ParticleData();
			
			if (!motion) {
				_motion = new LinearMotion(this);
			}
			else {
				_motion = motion;
			}
			
		}
		
		public function simulate():void {
			draw();
			_motion.animate();
		}
		
		protected function draw():void {
			
		}
		
		/**
		 * 
		 *  Sets new motion for particle
		 * 
		 */		 
		public function set motion(value:BaseMotion):void 
		{
			_motion = value;
		}
		
	}

}