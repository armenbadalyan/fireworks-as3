package com.abadalyan.fireworks.api.blast 
{
	import com.abadalyan.fireworks.api.ISimulation;
	import com.abadalyan.fireworks.api.motion.AlpaAnimator;
	import com.abadalyan.fireworks.api.motion.ComplexAnimator;
	import com.abadalyan.fireworks.api.motion.FrictionAnimator;
	import com.abadalyan.fireworks.api.motion.GravityAnimator;
	import com.abadalyan.fireworks.api.motion.IAnimator;
	import com.abadalyan.fireworks.api.particle.ParticleType;
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.particle.ParticleProperties;
	import com.abadalyan.fireworks.api.utils.Utils;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author abadalyan
	 */
	public class Emitter extends BaseBlast
	{
		
		private var space:Sprite;
		private var particles:Vector.<BaseParticle>;
		
		private var timer:Timer;
		
		private var lastTime:uint;
		private var now:uint;
		private var frameDuration:uint = 0;		
		private var currentDuration:uint = 0;
		private var frameMultiplier:Number;	
		
		// animators
		
		
		public var emitionStartPoint:Point = new Point();
		public var intensity:int = 1; // particles emitted per second
		private var currentCount:Number = 0;
		
		public function Emitter(space:Sprite) 
		{
			super(null);
			
			this.space = space;
			timer = new Timer(30);		
			
			particles = new Vector.<BaseParticle>();
		}
		
		override public function simulate():void {
			lastTime = getTimer();
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		override public function stop():void {
			timer.removeEventListener(TimerEvent.TIMER, onTimer);
		}
		
		private function onTimer(e:Event):void {
			now = getTimer();
			currentDuration += now - lastTime;
			frameDuration = now - lastTime;
			lastTime = now;
			
			frameMultiplier = frameDuration / 1000;				
			onTimeStep(currentDuration, frameMultiplier);			
		}
		
		protected function onTimeStep(currentDuration:Number, frameDurationInSeconds:Number):void {
			// here we should emit intensity * frameDurationInSeconds particles			
			
			currentCount += intensity * frameDurationInSeconds;		
						
			if (currentCount >= 1) {
				
				var countInt:int = Math.round(currentCount);
				
				var particle:BaseParticle;
				
				for (var i:int = 0;  i < countInt; i++) {
					//var gravityAnimator:GravityAnimator = new GravityAnimator(100);				
					var frictionAnimator:IAnimator = new FrictionAnimator();				
					var complexAnimator:IAnimator = new ComplexAnimator(new <IAnimator>[/*gravityAnimator,*/ frictionAnimator])
					
					
					particle = particleFactory.getParticle(ParticleType.SIMPLE, complexAnimator);
					particle.data.properties[ParticleProperties.SPEED] = new Vector3D(getRandomSpeed(100), getRandomSpeed(100));				
					particle.data.properties[ParticleProperties.DURATION] = 500;
					particle.data.properties[ParticleProperties.FRICTION] = 0;
					particle.data.properties[ParticleProperties.SIZE] = 1;
					particle.data.properties[ParticleProperties.COLOR] = 0xFFCC00;	
					particles.push(particle);					
				}
				
				simulateParticles();			
				currentCount = 0;
			}			
		}
		
		private function simulateParticles():void {
			for each(var p:BaseParticle in particles) {
				p.x = emitionStartPoint.x;
				p.y = emitionStartPoint.y;
				space.addChild(p);
				p.simulate();
			}
			
			particles.splice(0, particles.length);
		}
		
		private function getRandomSpeed(absSpeed:Number):Number {			
			return Utils.randomNumber( -absSpeed, absSpeed);
		}
		
	}

}