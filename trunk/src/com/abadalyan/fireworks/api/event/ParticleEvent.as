package com.abadalyan.fireworks.api.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author abadalyan
	 */
	public class ParticleEvent extends Event 
	{
		public static const PARTICLE_EXPIRED:String = "particleRemoved";
		
		public function ParticleEvent(type:String) 
		{
			super(type, true, false);			
		}
		
		override public function clone():Event {
			return new ParticleEvent(type);
		}
		
	}

}