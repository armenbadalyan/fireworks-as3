package com.abadalyan.fireworks.view.blast 
{
	import com.abadalyan.fireworks.controller.factory.IParticleFactory;
	import com.abadalyan.fireworks.model.blast.BlastData;
	import com.abadalyan.fireworks.view.ISimulation;
	import com.abadalyan.fireworks.FireworksFacade;
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
		
	}

}