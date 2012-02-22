package com.abadalyan.fireworks.api.motion 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.particle.ParticleProperties;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class FrictionAnimator extends Animator
	{
		public var speed:Vector3D;		
		
		override protected function animateFrame(particle:BaseParticle, currentDuration:uint, timeDeltaInSeconds:Number):void {
			speed = particle.data.properties[ParticleProperties.SPEED];
			
			speed.x *= Math.pow(1-particle.data.properties[ParticleProperties.FRICTION], timeDeltaInSeconds);
			speed.y *= Math.pow(1-particle.data.properties[ParticleProperties.FRICTION], timeDeltaInSeconds);
													
			/*particle.x += speed.x*timeDeltaInSeconds;
			particle.y += speed.y*timeDeltaInSeconds;*/		
		}		
	}

}