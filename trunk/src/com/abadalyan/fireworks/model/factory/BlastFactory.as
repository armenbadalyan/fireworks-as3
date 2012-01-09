package com.abadalyan.fireworks.model.factory 
{
	import com.abadalyan.fireworks.model.blast.BlastData;
	import com.abadalyan.fireworks.view.blast.BaseBlast;
	import com.abadalyan.fireworks.model.blast.BlastType;
	import com.abadalyan.fireworks.view.blast.SimpleBlast;
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
		
		public function getParticle(type:String, force:Number):BaseBlast 
		{
			var data:BlastData = new BlastData(force);
			var blast:BaseBlast;
			
			switch(type) {
				case BlastType.SIMPLE:
					blast = new SimpleBlast(data);
					break;
				default:
					throw new IllegalOperationError("Trying to instantiate inexistent blast type: "+type);
			}
			
		}
		
	}

}