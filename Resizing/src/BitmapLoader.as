package {
	import flash.display.*;
	import flash.net.*;
	import flash.events.*;

	/**
	 * @author micha
	 */
	public class BitmapLoader extends Sprite {
		
		private var loader : Loader; 
		private var pathToAsset : String;
		
		public function BitmapLoader( pathToAsset : String) {
		
			this.pathToAsset = pathToAsset;
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.INIT, initListener);
			loader.load( new URLRequest( this.pathToAsset ));
		
		}
		
		private function onLoaderComplete( e:Event ) : void
		{
			
		}
		
		private function initListener( e:Event ) : void
		{
			addChild( loader.content );
		}
	}
}
