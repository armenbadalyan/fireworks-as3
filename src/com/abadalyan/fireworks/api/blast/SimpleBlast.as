package com.abadalyan.fireworks.api.blast 
{
	import com.abadalyan.fireworks.api.blast.BlastData;
	import com.abadalyan.fireworks.api.factory.IParticleFactory;
	import com.abadalyan.fireworks.api.motion.AlpaAnimator;
	import com.abadalyan.fireworks.api.motion.ComplexAnimator;
	import com.abadalyan.fireworks.api.motion.FireworkMotion;
	import com.abadalyan.fireworks.api.motion.FrictionAnimator;
	import com.abadalyan.fireworks.api.motion.GravityAnimator;
	import com.abadalyan.fireworks.api.motion.IAnimator;	
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.particle.ParticleType;
	import com.abadalyan.fireworks.api.particle.ParticleProperties;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class SimpleBlast extends BaseBlast 
	{
		private const BASE_PARTICLE_DURATION:int = 2500;
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
			var direction:Number; // in rads
			var speed:Number;
			for (var i:int = 0; i < data.particleCount; i++ ) {
				
				
				var gravityAnimator:GravityAnimator = new GravityAnimator();
				gravityAnimator.gravity = 100;
				var frictionAnimator:IAnimator = new FrictionAnimator();		
				var alphaAnimator:IAnimator = new AlpaAnimator();
				var complexAnimator:IAnimator = new ComplexAnimator(new <IAnimator>[gravityAnimator, frictionAnimator, alphaAnimator]);			
				
				particle = particleFactory.getParticle(ParticleType.SIMPLE, complexAnimator);// 0xffCC00, i * (2 * Math.PI / data.particleCount), getRandomSpeed(0.1), getRandomLife(0.4), getRandomFriction(0.01));				
				
				direction = i * (2 * Math.PI / data.particleCount);
				speed = getRandomSpeed(0.05);				
				
				// fire particles in different directions
				particle.data.properties[ParticleProperties.SPEED] = new Vector3D(speed * Math.cos(direction), speed * Math.sin(direction));				
				particle.data.properties[ParticleProperties.DURATION] = getRandomLife(0.4);
				particle.data.properties[ParticleProperties.FRICTION] = getRandomFriction(0.005);
				particle.data.properties[ParticleProperties.SIZE] = 2;
				particle.data.properties[ParticleProperties.COLOR] = 0xFFCC00;
				
								
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