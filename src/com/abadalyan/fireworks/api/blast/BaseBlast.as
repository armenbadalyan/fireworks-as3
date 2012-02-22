package com.abadalyan.fireworks.api.blast 
{
	import com.abadalyan.fireworks.api.factory.IParticleFactory;
	import com.abadalyan.fireworks.api.blast.BlastData;
	import com.abadalyan.fireworks.api.ISimulation;
	import com.abadalyan.fireworks.api.FireworksFacade;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class BaseBlast extends Sprite implements ISimulation
	{
		
		public var particleFactory:IParticleFactory = FireworksFacade.particleFactory;
		public var data:BlastData;
		
		public function BaseBlast(data:BlastData) 
		{
			this.data = data;
		}		
		
		public function simulate():void 
		{			
			// leave empty and implement in concrete classes
		}
		
		public function stop():void {
			// leave empty and implement in concrete classes
		}
		
	}

}