package {
	import flash.events.MouseEvent;
	import flash.display.Sprite;

	/**
	 * @author micha
	 */
	public class Key extends Sprite {
		
				
		private var keyboard : Keyboard;
		private var _w : uint;
		private var _h : uint;
		private var _x : Number;
		private var _y : Number;
		private var _char : String;
		
		//private var theKey : TheKey;
		
		//private var _col : uint;
		
		private var _key : Sprite;
		
		private var isSpecialCharacter : Boolean = false;
		
		private const _ALPHA : Number = .8;
		private const _COLOR : Number = 0x4499ff;
		private const _COLOR_OVER : Number = 0xDDDDDD;
		
		private var _color : Number;
		
		
		public function Key ( x : Number, y : Number, w : uint, h : uint, char : String="" )
		{
			this._w = w;
			this._h = h;
			this._x = x;
			this._y = y;
			this._char = char;
			//this._col = 0x0090f0;
			this._color = 0x4499ff;
			
			
			drawKey();
			
		}
		
		
		private function drawKey() : void
		{
			_key = new Sprite();
			//_key = new SimpleButtonExample();
			
			_key.graphics.beginFill( _color, _ALPHA );
			_key.graphics.drawRoundRect( 0, 0, _w, _h, 5 );
			_key.graphics.endFill();
			
			_key.x = _x;
			_key.y = _y;
			
			_key.name = _char;
			_key.mouseChildren = false;
			
			//_key.addEventListener(MouseEvent.ROLL_OVER, onKeyOver);
			//_key.addEventListener(MouseEvent.MOUSE_OUT, onKeyOut);
			addChild( _key );
			
			trace("name " + _key.name);
			
			var t : Single = new Single(false, 0xeeeeee );
				if(this._char != "space") {
					t.setText( _char ); 
				} else (t.setText( "" ));
				t.x = _key.width/2 - t.width/2 + .2;
				t.y = _key.height/2 - t.height/2 - 1.5;
				t.mouseEnabled = false;
				_key.addChild(t);
				
				//_key.addEventListener(MouseEvent.ROLL_OVER, onKeyOver);
				//_key.addEventListener(MouseEvent.MOUSE_UP, onKeyUp);
		}
		
		//TODO remove the over and out functions and replace by get and set _color
		private function onKeyOver( e:MouseEvent ) : void
		{
			trace("over");
			this._color = _COLOR_OVER;
			removeChild(_key);
			drawKey();
		}
		
		
		private function onKeyOut( e:MouseEvent ) : void
		{
			trace(this.isSpecialCharacter);
			this._color = _COLOR;
			drawKey();
		}
		
		
		private function onKeyUp( e:MouseEvent ) : void
		{
			var test : String = e.target.name;
			trace( test );
		}
		
		
		
		//public methods
		public function setIsSpecialCharacter( bool : Boolean ) : void
		{
			this.isSpecialCharacter = bool;
		}
		
		
		public function getChar() : String
		{
			return this._char;
		}
		
		
		//new
		public function setKeyColor( _col : Number ) : void
		{
			this._color = _col;
			drawKey();
		}
		
		public function getKeyX() : Number
		{
			return this._x;
		}
		
		public function getKeyY() : Number
		{
			return this._y;
		}
	}
}
