package com.abadalyan.fireworks.api.factory 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	
	/**
	 * ...
	 * @author abadalyan
	 */
	public interface IParticleFactory 
	{
		function getParticle(type:String, color:uint, direction:Number, speed:Number, duration:uint, friction:Number):BaseParticle;
	}
	
}