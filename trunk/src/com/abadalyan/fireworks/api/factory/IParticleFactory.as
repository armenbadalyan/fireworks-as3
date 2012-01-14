package com.abadalyan.fireworks.api.factory 
{
	import com.abadalyan.fireworks.api.motion.IAnimator;
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	
	/**
	 * ...
	 * @author abadalyan
	 */
	public interface IParticleFactory 
	{
		function getParticle(type:String, animator:IAnimator):BaseParticle;
		function get particleCount():uint;
	}
	
}