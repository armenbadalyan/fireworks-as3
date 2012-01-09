package com.abadalyan.fireworks.view.blast 
{
	import com.abadalyan.fireworks.model.blast.BlastData;
	import com.abadalyan.fireworks.view.ISimulation;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class BaseBlast implements ISimulation
	{
		
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