package com.abadalyan.fireworks.api.motion 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	
	/**
	 * ...
	 * @author abadalyan
	 */
	public interface IAnimator 
	{
		function animate(particle:BaseParticle):void;
	}
	
}