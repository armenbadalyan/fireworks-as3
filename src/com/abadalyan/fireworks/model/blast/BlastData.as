package com.abadalyan.fireworks.model.blast 
{
	/**
	 * ...
	 * @author abadalyan
	 */
	public class BlastData 
	{
		public var force:Number;
		public var particleCount:uint;
		
		public function BlastData(force:Number, particleCount:uint) 
		{
			this.force = force;			
			this.particleCount = particleCount;
		}
		
	}

}