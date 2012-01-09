package com.abadalyan.fireworks.view.particle 
{
	import com.abadalyan.fireworks.model.particle.ParticleData;
	import com.abadalyan.fireworks.view.ISimulation;
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