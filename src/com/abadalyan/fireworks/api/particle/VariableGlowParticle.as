package com.abadalyan.fireworks.api.particle 
{
	import com.abadalyan.fireworks.api.motion.BaseMotion;
	import com.abadalyan.fireworks.api.particle.ParticleData;
	import com.abadalyan.fireworks.api.particle.ParticleProperties;
	import flash.events.Event;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class VariableGlowParticle extends BaseParticle
	{
		
		public function VariableGlowParticle(motion:BaseMotion = null) 
		{
			super(motion);
			
			draw();
		}	
		
		/*override public function simulate():void 
		{
			draw();
			vx = data.speed * Math.cos(data.direction);
			vy = data.speed * Math.sin(data.direction);
			lastTime = getTimer();
			frameCount = 0;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);			
		}*/
		
		
		private function clear():void {
			graphics.clear();
		}
		
		/*private function onEnterFrame(e:Event):void {
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
		}*/
		
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