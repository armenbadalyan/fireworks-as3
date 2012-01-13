package com.abadalyan.fireworks.api.motion 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.particle.ParticleProperties;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class FireworkMotion extends BaseMotion 
	{		
		private var speed:Vector3D;
		private const GRAVITY:Number = 100;
		
		public function FireworkMotion(particle:BaseParticle) 
		{
			super(particle);			
		}
		
		override protected function move(particle:BaseParticle, currentDuration:uint, timeDeltaInSeconds:Number):void {
			speed = particle.data.properties[ParticleProperties.SPEED];
			
			speed.y += GRAVITY * timeDeltaInSeconds;		
				
			speed.x *= Math.pow(1-particle.data.properties[ParticleProperties.FRICTION], timeDeltaInSeconds);
			speed.y *= Math.pow(1-particle.data.properties[ParticleProperties.FRICTION], timeDeltaInSeconds);
													
			particle.x += speed.x*timeDeltaInSeconds;
			particle.y += speed.y*timeDeltaInSeconds;				
			
		}
		
	}

}