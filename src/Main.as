package  {
	
	import com.abadalyan.fireworks.api.factory.IParticleFactory;
	import com.abadalyan.fireworks.api.factory.ParticleFactory;
	import com.abadalyan.fireworks.api.blast.BlastType;
	import com.abadalyan.fireworks.api.blast.BaseBlast;
	import com.abadalyan.fireworks.api.particle.BaseParticle;
	import com.abadalyan.fireworks.api.FireworksFacade;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Main extends MovieClip {
		
		
		public var particleFactory:IParticleFactory;
		
		public function Main() {
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void {
			particleFactory = new ParticleFactory();
   			var blast:BaseBlast = FireworksFacade.blastFactory.getBlast(BlastType.SIMPLE, 300, 100);
			blast.x = e.localX;
			blast.y = e.localY;
			addChild(blast);
			blast.simulate();
			
		}
	}
	
}
