package com.abadalyan.fireworks.view.blast 
{
	import com.abadalyan.fireworks.model.blast.BlastData;
	import com.abadalyan.fireworks.controller.factory.IParticleFactory;
	import com.abadalyan.fireworks.view.particle.BaseParticle;
	import com.abadalyan.fireworks.model.particle.ParticleType;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class SimpleBlast extends BaseBlast 
	{
		private const BASE_PARTICLE_DURATION:int = 3000;
		
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
				particle = particleFactory.getParticle(ParticleType.VARIABLE_GLOW, 0xffCC00, i * (2*Math.PI / data.particleCount), getRandomSpeed(), getRandomLife());
				particles.push(particle);
			}
		}
		
		private function simulateParticles():void {
			for each(var p:BaseParticle in particles) {
				addChild(p);
				p.simulate();
			}
		}
		
		private function getRandomSpeed():Number {
			var forceOffset:Number = data.force * 0.5;
			return data.force + Math.random() * forceOffset * 2 - forceOffset;
		}
		
		private function getRandomLife():Number {
			var durOffset:Number = BASE_PARTICLE_DURATION * 0.3;
			return BASE_PARTICLE_DURATION + Math.ceil(Math.random() * durOffset * 2) - durOffset;
		}
		
	}

}