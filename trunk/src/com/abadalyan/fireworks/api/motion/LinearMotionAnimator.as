package com.abadalyan.fireworks.api.motion 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.particle.ParticleProperties;
	/**
	 * ...
	 * @author abadalyan
	 */
	
	 
	public class LinearMotionAnimator extends Animator 
	{
		
		override protected function animateFrame(particle:BaseParticle, currentDuration:uint, timeDeltaInSeconds:Number):void {
			
			particle.x += particle.data.properties[ParticleProperties.SPEED].x * timeDeltaInSeconds;
			particle.y += particle.data.properties[ParticleProperties.SPEED].y * timeDeltaInSeconds;
			
		}
		
	}

}