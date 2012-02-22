package  {
	
	import com.abadalyan.fireworks.api.blast.Emitter;
	import com.abadalyan.fireworks.api.factory.IParticleFactory;
	import com.abadalyan.fireworks.api.factory.ParticleFactory;
	import com.abadalyan.fireworks.api.blast.BlastType;
	import com.abadalyan.fireworks.api.blast.BaseBlast;
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.FireworksFacade;
	import flash.display.Graphics;
	import flash.display.GraphicsPath;
	import flash.display.GraphicsSolidFill;
	import flash.display.GraphicsStroke;
	import flash.display.IGraphicsData;
	import flash.display.IGraphicsStroke;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	[SWF(width='800',height='600',backgroundColor='#000000',frameRate='60')]
	public class Main extends MovieClip {
		
		
		public var particleFactory:IParticleFactory;
		
		public function Main() {
			stage.addEventListener(MouseEvent.CLICK, onClick);
			
			var bomb:Bomb = new Bomb();
			bomb.x = 200;
			bomb.y = 200;
			addChild(bomb);
			
			bomb.ignite();
		}
		
		private function onClick(e:MouseEvent):void {			
			var blast:BaseBlast;
			var speedDiff:int = 0;
			/*for (var i:int = 0; i < 5; i++) {
				speedDiff += i * 20; 
				blast = FireworksFacade.blastFactory.getBlast(BlastType.SIMPLE, 300 - speedDiff, 50 - i*10);
				blast.x = e.localX;
				blast.y = e.localY;
				addChild(blast);
				
				blast.simulate();
			}*/	
			
			/*blast = FireworksFacade.blastFactory.getBlast(BlastType.SIMPLE, 500, 1);
			blast.x = e.localX;
			blast.y = e.localY;
			addChild(blast);*/
			
			/*blast = FireworksFacade.blastFactory.getBlast(BlastType.EMITTER, 0, 0, this);
			(blast as Emitter).emitionStartPoint.x = e.localX;
			(blast as Emitter).emitionStartPoint.y = e.localY;
			(blast as Emitter).intensity = 50;
			blast.simulate();*/	
						
		}
	}
	
}
