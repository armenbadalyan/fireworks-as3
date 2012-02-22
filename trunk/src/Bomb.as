package  {
	
	import com.abadalyan.fireworks.api.blast.Emitter;
	import com.abadalyan.fireworks.api.FireworksFacade;
	import com.abadalyan.fireworks.api.blast.BaseBlast;
	import com.abadalyan.fireworks.api.blast.BlastType;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	
	public class Bomb extends MovieClip {
		
		private var emitter:Emitter;
		private var start:Point;
		private var current:Point;
		
		public function Bomb() {
			start = new Point();
			current = new Point();
			
			this.buttonMode = true;			
			this.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
		}
		
		private function onDown(e:MouseEvent):void {
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMove);
			stage.addEventListener(MouseEvent.MOUSE_UP, onUp);
			
			start.x = e.localX;
			start.y = e.localY;
		}
		
		private function onMove(e:MouseEvent):void {
			current.x = e.stageX;
			current.y = e.stageY;			
			
			current = parent.globalToLocal(current);
			
			x = current.x - start.x;
			y = current.y - start.y;		
			
			emitter.emitionStartPoint.x = x;
			emitter.emitionStartPoint.y = y;
		}
		
		private function onUp(e:MouseEvent):void {
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMove);
			stage.removeEventListener(MouseEvent.MOUSE_UP, onUp);
		}
		
		public function ignite():void {
			emitter = FireworksFacade.blastFactory.getBlast(BlastType.EMITTER, 0, 0, this.parent as Sprite) as Emitter;
			emitter.emitionStartPoint.x = x;
			emitter.emitionStartPoint.y = y;
			emitter.intensity = 50;
			emitter.simulate();	
		}

	}
	
}
