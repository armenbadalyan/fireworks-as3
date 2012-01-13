package com.abadalyan.fireworks.api.blast 
{
	import com.abadalyan.fireworks.api.blast.BlastData;
	import com.abadalyan.fireworks.api.factory.IParticleFactory;
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.particle.ParticleType;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class SimpleBlast extends BaseBlast 
	{
		private const BASE_PARTICLE_DURATION:int = 5000;
		private const BASE_FRICTION:Number = 0.98;
		
		private var particles:Vector.<BaseParticle>;
				
		public function SimpleBlast(data:BlastData) 
		{
			super(data);
			particles = new Vector.<BaseParticle>();
		}
		
		override public function simulate():void {
			createParticles();
			simulateParticles();
			
		}
		
		private function createParticles():void {
			var particle:BaseParticle;
			for (var i:int = 0; i < data.particleCount; i++ ) {
				
				particle = particleFactory.getParticle(ParticleType.VARIABLE_GLOW, 0xffCC00, i * (2*Math.PI / data.particleCount), getRandomSpeed(0.1), getRandomLife(0.4), getRandomFriction(0.01));
								
				particles.push(particle);
				
			}
			
		}
		
		private function simulateParticles():void {
			for each(var p:BaseParticle in particles) {
				addChild(p);
				p.simulate();
			}
		}
		
		private function getRandomSpeed(q:Number):Number {
			var forceOffset:Number = data.force * q;
			return data.force + Math.random() * forceOffset * 2 - forceOffset;
		}
		
		private function getRandomLife(q:Number):Number {
			var durOffset:Number = BASE_PARTICLE_DURATION * q;
			return BASE_PARTICLE_DURATION + Math.ceil(Math.random() * durOffset * 2) - durOffset;
		}
		private function getRandomFriction(q:Number):Number {
			var fricOffset:Number = BASE_FRICTION * q;
			return BASE_FRICTION + Math.random() * fricOffset * 2 - fricOffset;
		}
		
	}

}