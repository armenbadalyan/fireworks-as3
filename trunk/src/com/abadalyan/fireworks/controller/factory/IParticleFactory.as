package com.abadalyan.fireworks.controller.factory 
{
	import com.abadalyan.fireworks.view.particle.BaseParticle;
	
	/**
	 * ...
	 * @author abadalyan
	 */
	public interface IParticleFactory 
	{
		function getParticle(type:String, color:uint, direction:Number, speed:Number, duration:uint):BaseParticle;
	}
	
}