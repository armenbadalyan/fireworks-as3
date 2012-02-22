package com.abadalyan.fireworks.api.factory 
{
	import com.abadalyan.fireworks.api.blast.BaseBlast;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author abadalyan
	 */
	public interface IBlastFactory 
	{
		function getBlast(type:String, force:Number, particleCount:uint, space:Sprite):BaseBlast;
	}
	
}