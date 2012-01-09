package com.abadalyan.fireworks.model.factory 
{
	import com.abadalyan.fireworks.view.blast.BaseBlast;
	
	/**
	 * ...
	 * @author abadalyan
	 */
	public interface IBlastFactory 
	{
		function getParticle(type:String, force:Number):BaseBlast;
	}
	
}