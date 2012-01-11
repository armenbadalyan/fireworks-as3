package  {
	
	import com.abadalyan.fireworks.controller.factory.IParticleFactory;
	import com.abadalyan.fireworks.controller.factory.ParticleFactory;
	import com.abadalyan.fireworks.model.blast.BlastType;
	import com.abadalyan.fireworks.view.blast.BaseBlast;
	import com.abadalyan.fireworks.view.particle.BaseParticle;
	import com.abadalyan.fireworks.FireworksFacade;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Main extends MovieClip {
		
		
		public var particleFactory:IParticleFactory;
		
		public function Main() {
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void {
			particleFactory = new ParticleFactory();
   			var blast:BaseBlast = FireworksFacade.blastFactory.getBlast(BlastType.SIMPLE, 5, 100);
			blast.x = e.localX;
			blast.y = e.localY;
			addChild(blast);
			blast.simulate();
			
		}
	}
	
}
