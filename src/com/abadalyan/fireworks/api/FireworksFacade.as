package com.abadalyan.fireworks.api 
{
	import com.abadalyan.fireworks.api.factory.BlastFactory;
	import com.abadalyan.fireworks.api.factory.IBlastFactory;
	import com.abadalyan.fireworks.api.factory.ParticleFactory;
	import com.abadalyan.fireworks.api.factory.IParticleFactory;
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