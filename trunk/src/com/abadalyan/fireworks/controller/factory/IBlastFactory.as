package com.abadalyan.fireworks.controller.factory 
{
	import com.abadalyan.fireworks.view.blast.BaseBlast;
	
	/**
	 * ...
	 * @author abadalyan
	 */
	public interface IBlastFactory 
	{
		function getBlast(type:String, force:Number, particleCount:uint):BaseBlast;
	}
	
}