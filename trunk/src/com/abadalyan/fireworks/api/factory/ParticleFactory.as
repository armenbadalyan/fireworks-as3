﻿package com.abadalyan.fireworks.api.factory 
{
	import com.abadalyan.fireworks.api.motion.IAnimator;
	import com.abadalyan.fireworks.api.particle.ParticleData;
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.particle.ParticleType;
	import com.abadalyan.fireworks.api.particle.SimpleParticle;
	import com.abadalyan.fireworks.api.particle.VariableGlowParticle;
	import flash.errors.IllegalOperationError;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class ParticleFactory implements IParticleFactory 
	{			
		private var _particleCount:uint = 0;
		
		public function ParticleFactory() 
		{
			
		}		
		
		public function getParticle(type:String, animator:IAnimator):BaseParticle 
		{
			var particle:BaseParticle;
			
			
			switch(type) {
				case ParticleType.SIMPLE:
					particle = new SimpleParticle();
					break;
				case ParticleType.VARIABLE_GLOW:
					particle = new VariableGlowParticle();
					break;
				default:									
					throw new IllegalOperationError("Trying to instantiate inexistent particle type: "+type);
			}
			
			particle.animator = animator;
			_particleCount++;
			return particle;
		}
		
		public function get particleCount():uint 
		{
			return _particleCount;
		}
		
	}

}