package {
	
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	/**
	 * @author micha
	 */
	public class SpecialKey extends Key 
	{
		private var key_is_active : Boolean = false;
		private var timer : Timer;
		private var specialKeyDelay : uint = 1500;
		
		
		public function SpecialKey(x : Number, y : Number, w : uint, h : uint, char : String = "") {
			//look up
			super(x, y, w, h, char);
			addTimer();
		}
		
		//TODO
		//extend the funtionality of key
		
		private function addTimer() : void
		{
			//this.addEventListener(Event.TimerEvent, onTimerEvent);
			timer = new Timer( specialKeyDelay, 1);
			timer.addEventListener( TimerEvent.TIMER_COMPLETE, onTimerComplete );
			timer.addEventListener( TimerEvent.TIMER, getCurrentTimer );
			timer.start();
		}
		
		private function onTimerComplete( e : TimerEvent ) : void
		{
			
		}
		
		//attempt to return the timer's current value to check if either to add the character to the string, or call its children (if it haves)
		//put keyboad data in xml like that <row>1<char>o<child>ö<child/><child><ø><child/>
		public function getCurrentTimer( e:TimerEvent ) : int
		{
			return timer.currentCount;
		}
		
	}
}
