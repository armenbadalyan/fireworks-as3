package com.abadalyan.fireworks.api.motion 
{
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	/**
	 * ...
	 * @author abadalyan
	 */
	public class SparkleTraceAnimator extends Animator
	{
		
		private var traceDuration:int = 200;
		private var traceData:Vector.<TraceData> = new Vector.<TraceData>();		
		private var traceSpace:Sprite = new Sprite();
		private var hasTraceSpace:Boolean;
		
		override protected function animateFrame(particle:BaseParticle, currentDuration:uint, timeDeltaInSeconds:Number):void {	
			if (!hasTraceSpace) {				
				particle.parent.addChild(traceSpace);
				hasTraceSpace = true;
			}
			
			var path:GraphicsPath = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
			path.moveTo(particle.x, particle.y);
			
			traceData.push(new TraceData(particle.x, particle.y, path, currentDuration));			
			
			drawTrace(particle, currentDuration);
		}
		
		private function drawTrace(particle:BaseParticle, currentDuration:uint):void {
			var traceLength:int = traceData.length;			
			var data:TraceData = traceData[traceLength - 1];
			
			var color:uint = particle.data.properties[ParticleProperties.COLOR];
			var maxSize:Number = particle.data.properties[ParticleProperties.SIZE]*2;		
			var maxAlpha:Number = particle.alpha;
			
			var drawData:Vector.<IGraphicsData> = new Vector.<IGraphicsData>();			
			
			var g:Graphics = traceSpace.graphics;
			g.clear();
			
			var stroke:GraphicsStroke = new GraphicsStroke(maxSize);
			stroke.fill = new GraphicsSolidFill(color, maxAlpha);
			
			var firstPath:GraphicsPath = data.path;						
			drawData.push(stroke, firstPath);
			
			var dur:int;
			var size:Number;
			var alpha:Number;		
			var path:GraphicsPath;
			
			for (var i:int = traceLength - 2; i >= 0; i--) {	
				data = traceData[i];
				dur = currentDuration - data.timestamp;
				size = maxSize * (traceDuration - dur) / traceDuration;
				alpha = maxAlpha * (traceDuration - dur) / traceDuration;
							
				if (dur <= traceDuration) {
					
					stroke = new GraphicsStroke(size);
					stroke.fill = new GraphicsSolidFill(color, alpha);
					
					path = data.path;					
					drawData.push(stroke, path);					
				}
				else {
					break;
				}
				
			}
			
			g.drawGraphicsData(drawData);	
			
			firstPath.commands[0] = 2;
			
			
		}
		
	}

}
import flash.display.GraphicsPath;

class TraceData {
	
	public var x:Number;
	public var y:Number;
	public var path:GraphicsPath;
	public var timestamp:uint;
	
	
	public function TraceData(x:Number, y:Number, path:GraphicsPath, timestamp:uint) {
		this.x = x;
		this.y = y;
		this.path = path;
		this.timestamp = timestamp;
	}
}