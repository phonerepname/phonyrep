package
{
	import mx.core.FontAsset;
	import flash.display.Sprite;
	import flash.system.Security;
	import flash.text.Font;
	import flash.utils.describeType;

	public class daFonts extends Sprite
	{
		[Embed(systemFont="Arial", mimeType="application/x-font", fontName="arial", unicodeRange="U+0020,U+0041-U+005A")] // Uppercase [A..Z] ; chars=""
		public  var arial:Class;

		public function daFonts()
		{
			FontAsset;
			Security.allowDomain("*");
			var xml:XML = describeType(this);
			for (var i:uint = 0; i < xml.variable.length(); i++)
			{
				Font.registerFont(this[xml.variable[i].@name]);
			}
		}
	}
}