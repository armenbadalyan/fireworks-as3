package com.abadalyan.fireworks.api.factory 
{
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
		public function ParticleFactory() 
		{
			
		}		
		
		public function getParticle(type:String, color:uint, direction:Number, speed:Number, duration:uint, friction:Number):BaseParticle 
		{
			var data:ParticleData = new ParticleData(color, direction, speed, duration, friction);
			var particle:BaseParticle;
			
			switch(type) {
				case ParticleType.SIMPLE:
					particle = new SimpleParticle(data);
					break;
				case ParticleType.VARIABLE_GLOW:
					particle = new VariableGlowParticle(data);
					break;
				default:
					throw new IllegalOperationError("Trying to instantiate inexistent particle type: "+type);
			}
			
			return particle;
		}
		
	}

}