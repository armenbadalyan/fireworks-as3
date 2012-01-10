package com.abadalyan.fireworks.view.particle 
{
	import com.abadalyan.fireworks.model.particle.ParticleData;
	import flash.events.Event;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class VariableGlowParticle extends BaseParticle
	{
		
		private const G:int  = 10;
		
		private var duration:uint = 0;
		private var lastTime:uint;
		private var frameCount:uint = 0;
		private var t:Number;
		private var startX:Number;
		private var startY:Number;
		
		public function VariableGlowParticle(data:ParticleData) 
		{
			super(data);
		}	
		
		override public function simulate():void 
		{
			draw();
			startX = x;
			startY = y;
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
			
			// check if particale has expired			
			if (duration <= data.duration) {
				// if not
				frameCount++;
				
				t = frameCount*0.15;
				
				this.x = startX + data.speed * t * Math.cos(data.direction);
				this.y = startY - data.speed * t * Math.sin(data.direction) + 0.5 * G * t * t;			
				
				lastTime = now;
				
				draw();
			}
			else {
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				clear();				
			}
		}
		
	}

}