package com.abadalyan.fireworks.api.factory 
{
	import com.abadalyan.fireworks.api.blast.BlastData;
	import com.abadalyan.fireworks.api.blast.BaseBlast;
	import com.abadalyan.fireworks.api.blast.BlastType;
	import com.abadalyan.fireworks.api.blast.Emitter;
	import com.abadalyan.fireworks.api.blast.SimpleBlast;
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class BlastFactory implements IBlastFactory 
	{
		
		public function BlastFactory() 
		{
			
		}
		
		public function getBlast(type:String, force:Number, particleCount:uint, space:Sprite):BaseBlast 
		{
			var data:BlastData = new BlastData(force, particleCount);
			var blast:BaseBlast;
			
			switch(type) {
				case BlastType.SIMPLE:
					blast = new SimpleBlast(data);
					break;
				case BlastType.EMITTER:
					blast = new Emitter(space)
					break;
				default:
					throw new IllegalOperationError("Trying to instantiate inexistent blast type: "+type);
			}
			data = null;
			return blast;
			
		}
		
	}

}