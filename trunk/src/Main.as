package  {
	
	import com.abadalyan.fireworks.model.factory.IParticleFactory;
	import com.abadalyan.fireworks.model.factory.ParticleFactory;
	import com.abadalyan.fireworks.model.particle.ParticleType;
	import com.abadalyan.fireworks.view.particle.BaseParticle;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Main extends MovieClip {
		
		
		var particleFactory:IParticleFactory;
		
		public function Main() {
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void {
			particleFactory = new ParticleFactory();
   			var particle:BaseParticle = particleFactory.getParticle(ParticleType.SIMPLE, 0xff0000, Math.PI / 4, 20, 10000);
			particle.x = e.localX;
			particle.y = e.localY;
			addChild(particle);
			particle.simulate();
			
		}
	}
	
}
