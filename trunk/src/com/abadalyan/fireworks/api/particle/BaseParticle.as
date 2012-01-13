package com.abadalyan.fireworks.api.particle 
{
	import com.abadalyan.fireworks.api.particle.ParticleData;
	import com.abadalyan.fireworks.api.ISimulation;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class BaseParticle extends Sprite implements ISimulation 
	{
		
		public var data:ParticleData;
		
		public function BaseParticle(data:ParticleData) 
		{
			this.data = data;
		}
		
		public function simulate():void {
			// leave empty and implement in concrete classes
		}
		
	}

}