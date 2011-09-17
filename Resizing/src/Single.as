package {
	import flash.display.Sprite;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;

	/**
	 * @author Micha
	 */
	 
	 //this class uses the font DIN Expert Regular
	 
	public class Single extends Sprite {
		public var offset : Number = 0;
		public var myFont : FontClass_12340dacf373d680;
		
		private var text : TextField;
		private var textSelectable : Boolean;
		private var textColor : uint;

		public function Single( textSelectable : Boolean, textColor : uint = 0x333333 ) {
			this.textSelectable = textSelectable;
			this.textColor = textColor;
			check_for_fonts();
		}

		private function check_for_fonts() : void {
			if (Font.enumerateFonts().length) {
				for ( var i : int = 0; i < Font.enumerateFonts().length; i++ ) {
					displayEmbeddedFont(String(Font.enumerateFonts()[i].fontName));
				}
			} else {
				var text : TextField = new TextField();
				text.autoSize = TextFieldAutoSize.LEFT;
				text.antiAliasType = AntiAliasType.ADVANCED;
				text.text = '*********** Doh! No Fonts Found ***********';
				addChild(text);
				offset += text.height;
			}
		}

		private function displayEmbeddedFont(fontname : String) : void {
			text = new TextField();
			text.embedFonts = true;
			text.autoSize = TextFieldAutoSize.LEFT;
			text.antiAliasType = AntiAliasType.ADVANCED;

			text.defaultTextFormat = new TextFormat(fontname, 20, textColor);
			text.text = fontname + " Font Is Pretty Cool";
			text.y = offset;
			text.selectable = textSelectable;
			
 
			//make it editable by physical keyboard, requires additional functionality, e.g. keyboard listeners on the text field ect. 
			//text.type = TextFieldType.INPUT;

			//show bounds
			//text.background = true;
			//text.backgroundColor = 0xffbbbb;
			addChild(text);
			offset += text.height;
		}
		
		public function setText( _text:String ) : void
		{
			text.text = _text;
		}
		
		public function getText() : String
		{
			return text.text;
		}
		
		public function getTextFieldWidth() : uint
		{
			var typedLength : uint = text.textWidth;
			return typedLength;
		}
		
	}
}