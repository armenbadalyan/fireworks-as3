package com.abadalyan.fireworks.model.factory 
{
	import com.abadalyan.fireworks.model.particle.ParticleData;
	import com.abadalyan.fireworks.view.particle.BaseParticle;
	import com.abadalyan.fireworks.model.particle.ParticleType;
	import com.abadalyan.fireworks.view.particle.SimpleParticle;
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
		
		public function getParticle(type:String, color:uint, direction:Number, speed:Number, duration:uint):BaseParticle 
		{
			var data:ParticleData = new ParticleData(color, direction, speed, duration);
			var particle:BaseParticle;
			
			switch(type) {
				case ParticleType.SIMPLE:
					particle = new SimpleParticle(data);
					break;
				default:
					throw new IllegalOperationError("Trying to instantiate inexistent particle type: "+type);
			}
			
			return particle;
		}
		
	}

}