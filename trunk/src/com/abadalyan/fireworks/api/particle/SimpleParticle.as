package com.abadalyan.fireworks.api.particle 
{
	import com.abadalyan.fireworks.api.motion.IAnimator;
	import com.abadalyan.fireworks.api.particle.ParticleData;
	import flash.events.Event;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class SimpleParticle extends BaseParticle
	{
		
		public function SimpleParticle(motion:IAnimator = null) 
		{
			super(motion);			
		}			
		
		override protected function draw():void {
			graphics.clear();						
			graphics.beginFill(data.properties[ParticleProperties.COLOR]);			
			graphics.drawCircle(0, 0, data.properties[ParticleProperties.SIZE]);
			graphics.endFill();
		}
	}

}