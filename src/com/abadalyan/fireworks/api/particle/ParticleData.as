package com.abadalyan.fireworks.api.particle 
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
		public var friction:Number;
		
		public function ParticleData(color:uint, direction:Number, speed:Number, duration:uint, friction:Number) 
		{
			this.color = color;
			this.direction = direction;
			this.speed = speed;
			this.duration = duration;
			this.friction = friction;
		}
		
	}

}