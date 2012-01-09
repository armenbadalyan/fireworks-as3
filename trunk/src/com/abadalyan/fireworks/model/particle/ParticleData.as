package com.abadalyan.fireworks.model.particle 
{
	/**
	 * ...
	 * @author abadalyan
	 */
	public class ParticleData 
	{
		
		public var color:uint;
		public var direction:Number;
		public var speed:Number;
		public var duration:uint;
		
		public function ParticleData(color:uint, direction:Number, speed:Number, duration:uint) 
		{
			this.color = color;
			this.direction = direction;
			this.speed = speed;
			this.duration = duration;
			
		}
		
	}

}