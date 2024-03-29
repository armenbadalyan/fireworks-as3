package com.abadalyan.fireworks.api.motion 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.particle.ParticleProperties;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class GravityAnimator extends Animator 
	{
		
		public var gravity:Number;
		private var speed:Vector3D;
		
		public function GravityAnimator(gravity:Number) {
			super();
			this.gravity = gravity;
		}
		
		override protected function animateFrame(particle:BaseParticle, currentDuration:uint, timeDeltaInSeconds:Number):void {
			speed = particle.data.properties[ParticleProperties.SPEED];
			
			speed.y += gravity * timeDeltaInSeconds;						
		}
		
	}

}