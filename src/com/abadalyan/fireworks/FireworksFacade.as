package com.abadalyan.fireworks 
{
	import com.abadalyan.fireworks.controller.factory.BlastFactory;
	import com.abadalyan.fireworks.controller.factory.IBlastFactory;
	import com.abadalyan.fireworks.controller.factory.ParticleFactory;
	import com.abadalyan.fireworks.controller.factory.IParticleFactory;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class FireworksFacade
	{
		
		private static var _particleFactory:IParticleFactory = new ParticleFactory();
		private static var _blastFactory:IBlastFactory = new BlastFactory();
		
		public function FireworksFacade() 
		{
			
		}
				
		public static function get particleFactory():IParticleFactory 
		{
			return _particleFactory;
		}
		
		public static function get blastFactory():IBlastFactory 
		{
			return _blastFactory;
		}
		
	}

}