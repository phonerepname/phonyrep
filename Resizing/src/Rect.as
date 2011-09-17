package {
	import flash.display.Sprite;

	/**
	 * @author micha
	 */
	 
	public class Rect extends Sprite 
	{
		
		private var _rect:Sprite;
		private var _xpos:Number;
		private var _ypos:Number;
		private var _width:uint;
		private var _height:uint;
		//private var _stage:Object;
		
		public function Rect( _xpos:Number, _ypos:Number, _width:uint, _height:uint ) 
		{
			this._xpos = _xpos;
			this._ypos = _ypos;
			this._width = _width;
			this._height = _height;
			//this._stage = _stage;
			
			draw();			
		}
		
		private function draw():void
		{
			_rect = new Sprite();
			_rect.graphics.beginFill( 0x00aaff );
			_rect.graphics.drawRect( 0, 0, _width, _height );
			_rect.graphics.endFill();
			
			_rect.x = _xpos-_width/2;
			_rect.y = _ypos-_height/2;
			addChild(_rect);
			//trace("sw " + " " + _stage);
			//trace( "x " + " " + _xpos );
		}
		
		public function update():void
		{
			
		}
		
		public function setX( val:Number ):void
		{
			_xpos = val - this._width/2;
			_rect.x = _xpos - this.width/2;
			//trace("setting X");
		}
		
		public function setY( val:Number ):void
		{
			_ypos = val - _height/2;
			_rect.y = _ypos;
		}
		
		public function getX():Number
		{
			return _xpos;
		}
		
		public function setWidth( scaleFactor:Number ):void
		{
			this._width = scaleFactor;
			_rect.width = scaleFactor*100;
		}
		
		public function getWidth() : Number
		{
			return _rect.width;
		}
	}
}
