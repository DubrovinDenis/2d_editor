package {
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	public class CifrBlat extends Sprite {
		internal var telo:TextField = new TextField();
		internal var teloNadp:TextField = new TextField();
		
		public function CifrBlat ():void {
			with (teloNadp) {
				type = TextFieldType.DYNAMIC;
				selectable = false;
				height = 20;
				width = 70;
			}
			with (telo) {
				type = TextFieldType.INPUT;
				selectable = true;
				background = true;
				height = 15;
				width = 40;
				x = 0;
				y = 20;
			}
			addChild(telo);
			addChild(teloNadp);
		}
	}
}