package com.abadalyan.fireworks.api.motion 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.particle.ParticleProperties;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class AlpaAnimator extends Animator 
	{
		
		override protected function animateFrame(particle:BaseParticle, currentDuration:uint, timeDeltaInSeconds:Number):void {			
            var fadeInDuration:Number = particle.data.properties[ParticleProperties.DURATION] * 0.3;
            var fadeOutDuration:Number = particle.data.properties[ParticleProperties.DURATION] - fadeInDuration;
            if (currentDuration <= fadeInDuration) {
                var arg:Number = Math.PI/2 * currentDuration / fadeInDuration;
                particle.alpha = 2*Math.sin(arg);
            }                       
            else {
                arg = Math.PI/2 * (currentDuration - fadeInDuration) / (fadeOutDuration - fadeInDuration);
                particle.alpha = Math.cos(arg);
            }			
		}
		
	}

}