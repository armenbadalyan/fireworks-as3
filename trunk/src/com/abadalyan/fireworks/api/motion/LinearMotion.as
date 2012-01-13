package com.abadalyan.fireworks.api.motion 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.particle.ParticleProperties;
	/**
	 * ...
	 * @author abadalyan
	 */
	
	 
	public class LinearMotion extends BaseMotion 
	{
		
		public function LinearMotion(particle:BaseParticle) 
		{
			super(particle);			
		}
		
		override protected function move(particle:BaseParticle, currentDuration:uint, timeDeltaInSeconds:Number):void {
			
			particle.x += particle.data.properties[ParticleProperties.SPEED].x * timeDeltaInSeconds;
			particle.y += particle.data.properties[ParticleProperties.SPEED].y * timeDeltaInSeconds;
			
		}
		
	}

}