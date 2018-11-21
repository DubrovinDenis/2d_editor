package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	public class Spisok extends Sprite {
		internal var nadpis:TextField = new TextField();
		internal var nazvanie:Array = new Array();
		internal var spisok:Array = new Array();
		internal var txFormat1:TextFormat = new TextFormat();
		internal var txFormat2:TextFormat = new TextFormat();
		internal var SpX:int;
		internal var SpY:int;
		
		public function Spisok(chislo:int, razmerX:int, razmerY:int, nazvaniya:Array):void {
			SpX = razmerX;
			SpY = razmerY;
			with (txFormat1) {
				size = 10;
				color = 0x020C62;
				font = "Arial Cyr";
				bold = true;
				italic = true;
			}
			with (txFormat2) {
				size = 10;
				color = 0x020C62;
				font = "Arial Cyr";
				bold = false;
			}
			with (nadpis) {
				type = TextFieldType.DYNAMIC;
				selectable = false;
				background = true;
				border = true;
				height = SpY;
				width = SpX;
				text = nazvaniya[0];
				setTextFormat(txFormat1);
				x = 0;
				y = 0;
			}
			addChild(nadpis);
			for (var i:int = 1; i <= chislo; i++) {
				nazvanie[i] = nazvaniya[i-1];
				spisok[i] = new TextField();
				with (spisok[i]) {
					type = TextFieldType.DYNAMIC;
					selectable = false;
					background = true;
					height = SpY;
					width = SpX+1;
					text = nazvaniya[i-1]
					setTextFormat(txFormat2);
					x = 0;
					y = 0;
					visible = false;
				}
				addChild(spisok[i]);
			}
			nadpis.addEventListener(MouseEvent.MOUSE_DOWN, razmerTela);
		}
		internal function razmerTela(e:MouseEvent):void {
			for (var i:int = 1; i < spisok.length; i++) {
				spisok[i].addEventListener(MouseEvent.MOUSE_DOWN, spPress);
				//1 добавляется из-за того, что рамка Надписи увеличивает её размер на 1
				spisok[i].y = i * SpY+1;
				spisok[i].visible = true;
			}
		}
		internal function spPress(e:MouseEvent):void {
			spisok[0] = e.target;
			nadpis.text = nazvanie[getChildIndex(spisok[0])];
			nadpis.setTextFormat(txFormat1);
			for (var i:int = 1; i < spisok.length; i++) {
				spisok[i].removeEventListener(MouseEvent.MOUSE_DOWN, spPress);
				spisok[i].y = 15000;
			}
		}
	}
}