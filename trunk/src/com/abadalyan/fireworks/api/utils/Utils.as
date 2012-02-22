package com.abadalyan.fireworks.api.utils 
{
	/**
	 * ...
	 * @author abadalyan
	 */
	public class Utils 
	{
		
		static public function randomNumber(low:Number, high:Number):Number {
			return Math.floor(Math.random() * (1+high-low)) + low;
		}
		
	}

}