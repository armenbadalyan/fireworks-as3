package com.abadalyan.fireworks.api.motion 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class ComplexAnimator implements IAnimator 
	{		
		
		private var animators:Vector.<IAnimator>
		
		public function ComplexAnimator(animators:Vector.<IAnimator>) {
			this.animators = animators;
		}
		
		final public function animate(particle:BaseParticle):void {			
			for each(var animator:IAnimator in animators) {
				animator.animate(particle);
			}
		}
		
	}

}