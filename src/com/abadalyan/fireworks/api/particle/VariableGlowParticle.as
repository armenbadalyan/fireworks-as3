package com.abadalyan.fireworks.api.particle 
{
	import com.abadalyan.fireworks.api.particle.ParticleData;
	import flash.events.Event;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class VariableGlowParticle extends BaseParticle
	{
		
		private const G:int  = 10;
		private const TIME_STEP:int = 30; //ms
			
		private var duration:uint = 0;
		private var frameDuration:uint = 0;
		private var lastTime:uint;				
		private var prevFrameCount:uint = 0;
		private var frameCount:uint = 0;
		private var t:Number;	
		private var a:Number;
		
		private var vx:Number;
		private var vy:Number;	
		
		private var gravity:int = 100;
		
		
		public function VariableGlowParticle(data:ParticleData) 
		{
			super(data);
		}	
		
		override public function simulate():void 
		{
			draw();
			vx = data.speed * Math.cos(data.direction);
			vy = data.speed * Math.sin(data.direction);
			lastTime = getTimer();
			frameCount = 0;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);			
		}
		
		private function draw():void {
			graphics.clear();
			var fadeInDuration:Number = data.duration * 0.1;
			var fadeOutDuration:Number = data.duration - fadeInDuration;
			if (duration <= fadeInDuration) {
				var arg:Number = Math.PI/2 * duration / fadeInDuration;
				graphics.beginFill(data.color, 2*Math.sin(arg));
			}			
			else {
				arg = Math.PI/2 * (duration - fadeInDuration) / (fadeOutDuration - fadeInDuration);
				graphics.beginFill(data.color, Math.cos(arg));
			}
			
			graphics.drawCircle(0, 0, 2);
			graphics.endFill();
		}
		
		private function clear():void {
			graphics.clear();
		}
		
		private function onEnterFrame(e:Event):void {
			var now:uint = getTimer()
			duration += now - lastTime;
			frameDuration = now - lastTime;
						
			// check if particale has expired			
			if (duration <= data.duration) {
				// if not								
							
				var timeDeltaInSeconds:Number = frameDuration / 1000;
				
				vy += gravity * timeDeltaInSeconds;
				
				//trace(data.friction);
				
				vx *= Math.pow(1-data.friction, timeDeltaInSeconds);
				vy *= Math.pow(1-data.friction, timeDeltaInSeconds);
													
				x += vx*timeDeltaInSeconds;
				y += vy*timeDeltaInSeconds;				
								
				lastTime = now;
				
				draw();
			}
			else {
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				clear();				
			}
		}
		
		/*private function updateTimeStep():Boolean {
			accumulator += frameDuration;			
			
			while (accumulator >= TIME_STEP) {				
				prevFrameCount = frameCount;
				frameCount++;				
				accumulator -= TIME_STEP;
			}
			
			a = accumulator / TIME_STEP;
			
			if (frameCount != prevFrameCount) {
				t = 0.01 * frameCount * a + 0.01 * prevFrameCount * (1 - a);
				return true;
			}			
			else {
				return false;
			}			
		}*/
		
	}

}