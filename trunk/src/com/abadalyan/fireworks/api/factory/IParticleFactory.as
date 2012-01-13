package com.abadalyan.fireworks.api.factory 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	
	/**
	 * ...
	 * @author abadalyan
	 */
	public interface IParticleFactory 
	{
		function getParticle(type:String):BaseParticle;
		function get particleCount():uint;
	}
	
}