package {
	import flash.events.*;
	//import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.utils.getTimer;

	/**
	 * @author micha
	 */
	 
	 //TODO add get and set key color in over and out functions
	 
	public class Keyboard extends Sprite {
		
		
		//TODO split arrays already here with .split and modify drawKeys() afterwards
		private var row1 : String = "qwertzuiop";
		private var row2 : String = "asdfghjkl";
		private var row3 : String = "yxcvbnm";
		
		private var specialChars : String = "aous";
		
		//for testing purposes
		private var onShiftKeyA : Array = "äáàӕӑâãāå".split("");
		
		private var rows : Array = [row1, row2, row3];
		
		private var key : Key;
		
		private var typed : String = "";
		private var typedLength : uint;
		
		//private var isSpecialCharacter : Boolean = false;
		
		private var rowsArray : Array;
		private var specialCharsArray : Array;
		
		private var spaceBar : Key;
		
		private var timer : Timer;
		
		private var lastKeyPressed : String ="";
		
		private var specialKeyDelay : Number = 1500;
		
		private var specialKeyIsDown : Boolean = false;
		
		private var test_object_to_pass_key_to_timer_function : Object;
		
		//test the thing with x and y
		private var tempX : Number;
		private var tempY : Number;
		
		//testing a timer workaround with getTimer()
		private var timeStart : Number;
		private var timeStop : Number;
		
		
		public function Keyboard() {
		
			//drawKeyboard();
			drawKeys();
		
		}



		//private functions
		private function drawKeys() : void
		{
			//var arr : Array = row1.split("");
			
			for(var i : uint = 0; i<rows.length; ++i)
			{
				rowsArray = rows[i].split("");
			
				for( var j:int = 0; j < rowsArray.length; ++j)
				{
					var _char : String = String(rowsArray[j]);//.toUpperCase(); //uncomment for uppercase glyphs on keys
					
					//TODO
					//add var for the numbers below
					key = new Key( ( 0+j*43 ) +i*23, 0+45*i, 40, 40, _char );
					
					
					//check if character is a special character (means it can have more glyphs like a and ä)
					specialCharsArray = specialChars.split("");
					
					for(var k:int = 0; k < specialCharsArray.length; ++k)
					{
						var specialCharacter : String = String(specialCharsArray[k]);
						if ( _char == specialCharacter )
						{
							key.setIsSpecialCharacter( true );
						}
					}
					this.addChild( key );
					trace("name in kb " + key.name);
					
				}
			}
			
			spaceBar = new Key(120, 134, 200, 40, "space");
			//spaceBar.name = "space";
			this.addChild(spaceBar);
			
			this.addEventListener(MouseEvent.MOUSE_UP, onKeyUp, false, 0, true );
			this.addEventListener(MouseEvent.MOUSE_DOWN, onKeyDown, false, 0, true );
			this.x = 0;
			this.y = 0;
		}
		
		//stop the timer when key is released (only true for specialKeys)
		private function onKeyUp( e:MouseEvent ) : void
		{
			timer.stop();
			this.timeStop = getTimer();
			trace( "stopped: " +  timeStop );
			
			//TODO
			//read the timer's value and compare to a specified one
			/*if(timer < 1000)
			{
				typed += String( e.target.name );
			} else { trace( "code for sprite to be executed now" ); }*/ 
			
			//TODO version 1
			//aa code to check if remaining timer is less than specified value (e.g. 1500 ms)
			//and therefore tell whether to display the sprite or add the character to the textfield
			timer.reset();
		}
		
		//process this when any key is pressed and determine which (kind of) key it was
		private function onKeyDown( e:MouseEvent ) : void
		{
			//TODO version 2
			//start timer on keydown and if timer runs longer than specified value, the sprite is
			//going to be displayed, else the character will be added
			
			this.timeStart = getTimer();
			trace ( "started: " + timeStart );
			
			trace( e.target.x );
			tempX = e.target.x;
			tempY = e.target.y;
			
			if( e.target.name == "a" )
			{
				specialKeyIsDown = true;
				onTimer( e.target.name );
			}
			
			else if( e.target.name == "space" ) { typed += " "; } 
			
			else {
			
			//TODO
			//got to be a private var in the class to be accessible from the up function, 
			//the add to string functionality should be added to the mouseup function anyway
			//but how to get the special chars to be added when i release the mouse and not to be if i keep pressing?
			lastKeyPressed = ( e.target.name );
			
			//old way to add characters to the string
				
				//TODO use textfield's append function to update the string, means turn string into textfield and append chars to it, 
				//but still save the whole string and the last char typed into seperate strings
				//new way to add characters to the string
			
			typed += String( e.target.name ); }
			
			//TODO remove last character from String
			/*if( typed != "" && lastKeyPressed != "del" )
			{
				
				
			} 
			else
			{
				typed += String( e.target.name );
				trace( typed );
			}*/
		}
		
		
		private function onTimer( targetKey : Object ) : void 
		{
			trace( "i trace timer from keyboard.as" );
			timer = new Timer( specialKeyDelay, 1 );
			timer.addEventListener( TimerEvent.TIMER_COMPLETE, specialKeyTimerComplete );
			timer.start();
			test_object_to_pass_key_to_timer_function = targetKey;
			//test_object_to_pass_key_to_timer_function.y = targetKey.y;
			//test_object_to_pass_key_to_timer_function.height = targetKey.height;
		}
		
		private function specialKeyTimerComplete ( e : TimerEvent ) : void
		{
			//TODO
			//this function needs re-working with a custom event class for the TIMER_COMPLETE event to be able to receive a ref to the pressed key 
			//to set the x and y of the container for special chars 
			
			if( test_object_to_pass_key_to_timer_function != null )
			{
				var _x : Number = tempX;//test_object_to_pass_key_to_timer_function.x;
				var _y : Number = tempY;//test_object_to_pass_key_to_timer_function.y;
				var _height : Number = 40;//test_object_to_pass_key_to_timer_function.height;
			} 
			
			//TODO
			//the following sprites must be removed entirely and the objects must be set to NULL afterwards!
			//TODO
			//THIS FUNCTION ALSO NEEDS A REFERENCE TO THE CLICKED KEY, SINCE IT GOT TO MAKE USE OF THY X AND Y PROPERTY TO SET ITS OWN X AND Y PROPERLY
			
			var shiftKeyBackground : Sprite = new Sprite();
			shiftKeyBackground.graphics.beginFill( 0xaaaaaa );
			shiftKeyBackground.graphics.drawRect(0, 0, 200, _height);
			shiftKeyBackground.graphics.endFill();
			
			shiftKeyBackground.x = _x;
			//TODO
			//add variables for x and y margins to the top
			shiftKeyBackground.y = _y - _height - 5;
			
			this.addChild( shiftKeyBackground );
			
			for ( var i : uint = 0; i<onShiftKeyA.length; ++i )
			{
				 var shiftKey : Sprite = new Sprite();
			}
		}
		
		//getters, setters
		public function getString() : String
		{
			return typed;
		}
		
		
		//test function, delete sometime
		/*private function drawKeyboard() : void
		{
			var arr : Array = row1.split("");
			
			for( var i:int = 0; i < arr.length; ++i)
			{
				trace(arr[i]);
				key = new Key( 0+i*43, 0, 40, 40, String(arr[i]).toUpperCase() );
				addChild( key );
			}
		}
		*/			
	}
}
