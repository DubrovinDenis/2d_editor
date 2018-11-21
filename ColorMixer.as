package {
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	internal class ColorMixer extends Sprite {
		internal var a:Number = 0;
		internal var b:Number = 0;
		internal var c:Number = 0;
		internal var R:int = 0;
		internal var G:int = 0;
		internal var B:int = 0;
		//Текущие значения R, G, B используются при рисовании спектра
		internal var tekR:int = 0;
		internal var tekG:int = 0;
		internal var tekB:int = 0;
		//Переменные R1, G1, B1 нужны для правильного приведения типа в функции шестнадцать
		internal var R1:String = "";
		internal var G1:String = "";
		internal var B1:String = "";
		internal var colx:int = 0;
		internal var coly:int = 0;
		internal var shestRich:Vector.<String> = new Vector.<String>();
		internal var shestFormat:int = 16;
		internal var tekShest:String = "";
		internal var cvet:String = "FFFFFF";
		//Используется для вкл/выкл миксера в головном классе
		internal var per:int = 0;
		//Эти переменные используются для относительности координат цветового миксера.
		internal var teloX1:int = 0;
		internal var teloX2:int = 180;
		internal var kursorY1:int = 20;
		internal var kursorY2:int = 200;
		internal var treugX:int = 200;
		internal var treugY1:int = 20;
		internal var treugY2:int = 200;
		internal var Zalivka:CifrBlat = new CifrBlat();
		internal var Telo:Shape = new Shape();
		internal var Kursor:Sprite = new Sprite();
		internal var Treug:Sprite = new Sprite();
		internal var Spectr:Shape = new Shape();
		internal var Obrazec:Shape = new Shape();
		internal var teloNadp:TextField = new TextField();
		
		public function ColorMixer():void {
			shestRich[0] = "0";
			shestRich[1] = "1";
			shestRich[2] = "2";
			shestRich[3] = "3";
			shestRich[4] = "4";
			shestRich[5] = "5";
			shestRich[6] = "6";
			shestRich[7] = "7";
			shestRich[8] = "8";
			shestRich[9] = "9";
			shestRich[10] = "A";
			shestRich[11] = "B";
			shestRich[12] = "C";
			shestRich[13] = "D";
			shestRich[14] = "E"
			shestRich[15] = "F";
			with (teloNadp) {
				type = TextFieldType.DYNAMIC;
				selectable = false;
				height = 50;
				width = 100;
				text = "Цветовой" +" " + "миксер";
			}
			Telo.y = 20;
			//Рисование цветового миксера делится на шесть колонок
			//1
			for (var i:int = 0; i < 10; i++) {
				for (var j:int = 0; j < 60; j++) {
					colormix1(colx, coly);
					konvert();
					with(Telo.graphics){
						lineStyle(4, 0x008000, 0);
						beginFill("0x" + R1 + G1 + B1, 1);
						moveTo(colx, coly);
						lineTo(colx, coly+3);
						lineTo(colx+3, coly+3);
						lineTo(colx+3, coly);
						lineTo(colx, coly);
						endFill();
					}
					colormix2(colx, coly);
					konvert();
					with(Telo.graphics){
						lineStyle(4, 0x008000, 0);
						beginFill("0x" + R1 + G1 + B1, 1);
						moveTo(colx+30, coly);
						lineTo(colx+30, coly+3);
						lineTo(colx+33, coly+3);
						lineTo(colx+33, coly);
						lineTo(colx+30, coly);
						endFill();
					}
					colormix3(colx, coly);
					konvert();
					with(Telo.graphics){
						lineStyle(4, 0x008000, 0);
						beginFill("0x" + R1 + G1 + B1, 1);
						moveTo(colx+60, coly);
						lineTo(colx+60, coly+3);
						lineTo(colx+63, coly+3);
						lineTo(colx+63, coly);
						lineTo(colx+60, coly);
						endFill();
					}
					colormix4(colx, coly);
					konvert();
					with(Telo.graphics){
						lineStyle(4, 0x008000, 0);
						beginFill("0x" + R1 + G1 + B1, 1);
						moveTo(colx+90, coly);
						lineTo(colx+90, coly+3);
						lineTo(colx+93, coly+3);
						lineTo(colx+93, coly);
						lineTo(colx+90, coly);
						endFill();
					}
					colormix5(colx, coly);
					konvert();
					with(Telo.graphics){
						lineStyle(4, 0x008000, 0);
						beginFill("0x" + R1 + G1 + B1, 1);
						moveTo(colx+120, coly);
						lineTo(colx+120, coly+3);
						lineTo(colx+123, coly+3);
						lineTo(colx+123, coly);
						lineTo(colx+120, coly);
						endFill();
					}
					colormix6(colx, coly);
					konvert();
					with(Telo.graphics){
						lineStyle(4, 0x008000, 0);
						beginFill("0x" + R1 + G1 + B1, 1);
						moveTo(colx+150, coly);
						lineTo(colx+150, coly+3);
						lineTo(colx+153, coly+3);
						lineTo(colx+153, coly);
						lineTo(colx+150, coly);
						endFill();
					}
					coly += 3;
				}
				coly = 0;
				colx += 3;
			}
			
			with(Kursor.graphics){
				lineStyle(0.5, 0x000000, 1);
				moveTo(0, -5);
				lineTo(0, 5);
				moveTo(-5, 0);
				lineTo(5, 0);
				lineStyle(0.5, 0x000000, 0);
				beginFill(0x000000, 0);
				moveTo(-5, -5);
				lineTo(5, -5);
				lineTo(5, 5);
				lineTo(-5, 5);
				lineTo(-5, -5);
				endFill();
			}
			Kursor.y = 20;
			Spectr.x = 190;
			Spectr.y = 20;
			risSpectr();
			with(Treug.graphics){
				lineStyle(4, 0x008000, 0);
				beginFill(0x1510A0, 1);
				moveTo(0, 0);
				lineTo(4, -4);
				lineTo(9, -4);
				lineTo(9, 4);
				lineTo(4, 4);
				endFill();
			}
			Treug.x = Spectr.x + 10;
			Treug.y = 20;
			with(Obrazec.graphics){
				lineStyle(4, 0x008000, 0);
				beginFill("0x" + cvet, 1);
				moveTo(0, 0);
				lineTo(0, 20);
				lineTo(50, 20);
				lineTo(50, 0);
				lineTo(0, 0);
				endFill();
			}
			Obrazec.y = 210;
			Zalivka.telo.text = "FFFFFF";
			Zalivka.width = 80;
			Zalivka.x = 55;
			Zalivka.y = 190;
			Kursor.addEventListener(MouseEvent.MOUSE_DOWN, knPress);
			Kursor.addEventListener(MouseEvent.MOUSE_UP, knRelease);
			Treug.addEventListener(MouseEvent.MOUSE_DOWN, knPress);
			Treug.addEventListener(MouseEvent.MOUSE_UP, knRelease);
			Treug.addEventListener(MouseEvent.MOUSE_OUT, knRelease);
			addChild(Telo);
			addChild(teloNadp);
			addChild(Kursor);
			addChild(Spectr);
			addChild(Treug);
			addChild(Obrazec);
			addChild(Zalivka);
		}
		//Функции, изменяющие цвет заливки по шести столбам
		internal function colormix1(a:Number, b:Number):void {
			R = Math.round(255 - ((127 / 180) * b));
			G = Math.round((((128 - (255 / 30 * a)) / 180) * b) + (255 / 30 * a));
			B = Math.round((128 / 180) * b);
		}
		internal function colormix2(a:Number, b:Number):void {
			R = Math.round((((128-(255-((255/30)*a)))/180)*b)+(255-((255/30)*a)));
			G = Math.round(255-((127/180)*b));
			B = Math.round((128 / 180) * b);
		}
		internal function colormix3(a:Number, b:Number):void {
			R = Math.round((128 / 180) * b);
			G = Math.round(255-((127/180)*b));
			B = Math.round((((128 - (255 / 30 * a)) / 180) * b) + (255 / 30 * a));
		}
		internal function colormix4(a:Number, b:Number):void {
			R = Math.round((128 / 180) * b);
			G = Math.round((((128-(255-((255/30)*a)))/180)*b)+(255-((255/30)*a)));
			B = Math.round(255-((127/180)*b));
		}
		internal function colormix5(a:Number, b:Number):void {
			R = Math.round((((128 - (255 / 30 * a)) / 180) * b) + (255 / 30 * a));
			G = Math.round((128 / 180) * b);
			B = Math.round(255-((127/180)*b));
		}
		internal function colormix6(a:Number, b:Number):void {
			R = Math.round(255-((127/180)*b));
			G = Math.round((128 / 180) * b);
			B = Math.round((((128-(255-((255/30)*a)))/180)*b)+(255-((255/30)*a)));
		}
		//Функция, конвертирующая число в шестнадцатиричный формат
		internal function shestnad(a:Number):String {
			b = Math.round(a / shestFormat);
			if (b * shestFormat > a) {
				b -= 1;
			}
			c = a - b * shestFormat;
			tekShest = shestRich[b] + shestRich[c];
			return tekShest;
		}
		//Функция, конвертирующая цвет в шестнадцатиричный формат.
		internal function konvert():void {
			R1 = shestnad(R);
			G1 = shestnad(G);
			B1 = shestnad(B);
		}
		//Функция отрисовывающая столбик спектра
		internal function risSpectr():void {
			Spectr.graphics.clear();
			colx = 0;
			coly = 0;
			if (Kursor.x <= 30) {
				//Kursor.y-20 - отнимается величина прибавленная к значению "у" Курсора при загрузке
				colormix1(Kursor.x, Kursor.y-20);
				tekR = R;
				tekG = G;
				tekB = B;
			}else 
			if (Kursor.x <= 60) {
				colormix2(Kursor.x - 30, Kursor.y-20);
				tekR = R;
				tekG = G;
				tekB = B;
			}else
			if (Kursor.x <= 90) {
				colormix3(Kursor.x - 60, Kursor.y-20);
				tekR = R;
				tekG = G;
				tekB = B;
			}else
			if (Kursor.x <= 120) {
				colormix4(Kursor.x - 90, Kursor.y-20);
				tekR = R;
				tekG = G;
				tekB = B;
			}else
			if (Kursor.x <= 150) {
				colormix5(Kursor.x - 120, Kursor.y-20);
				tekR = R;
				tekG = G;
				tekB = B;
			}else
			if (Kursor.x <= 180) {
				colormix6(Kursor.x - 150, Kursor.y-20);
				tekR = R;
				tekG = G;
				tekB = B;
			}
			
			for (var i:int = 0; i < 18; i++) {
				R = Math.round(255 - coly * (255 - tekR) / 90);
				G = Math.round(255 - coly * (255 - tekG) / 90);
				B = Math.round(255 - coly * (255 - tekB) / 90);
				konvert();
				with(Spectr.graphics){
					lineStyle(4, 0x008000, 0);
					beginFill("0x" + R1 + G1 + B1, 1);
					moveTo(colx, coly);
					lineTo(colx, coly+5);
					lineTo(colx+10, coly+5);
					lineTo(colx+10, coly);
					lineTo(colx, coly);
					endFill();
				}
				coly += 5;
			}
			coly = 90;
			for (i = 0; i < 18; i++) {
				R = Math.round(tekR - (coly - 90) * tekR / 90);
				G = Math.round(tekG - (coly - 90) * tekG / 90);
				B = Math.round(tekB - (coly - 90) * tekB / 90);
				konvert();
				with(Spectr.graphics){
					lineStyle(4, 0x008000, 0);
					beginFill("0x" + R1 + G1 + B1, 1);
					moveTo(colx, coly);
					lineTo(colx, coly+5);
					lineTo(colx+10, coly+5);
					lineTo(colx+10, coly);
					lineTo(colx, coly);
					endFill();
				}
				coly += 5;
			}
		}
		internal function ottenok():void {
			if (Treug.y >= 20 && Treug.y < 110) {
				R = Math.round(255 - (Treug.y-20) * (255 - tekR) / 90);
				G = Math.round(255 - (Treug.y-20)  * (255 - tekG) / 90);
				B = Math.round(255 - (Treug.y-20) * (255 - tekB) / 90);
				konvert();
			}else
			if (Treug.y >= 110) {
				R = Math.round(tekR - ((Treug.y-20)  - 90) * tekR / 90);
				G = Math.round(tekG - ((Treug.y-20)  - 90) * tekG / 90);
				B = Math.round(tekB - ((Treug.y-20)  - 90) * tekB / 90);
				konvert();
			}
			cvet = R1 + G1 + B1;
			with (Obrazec.graphics) {
				clear();
				lineStyle(4, 0x008000, 0);
				beginFill("0x" + cvet, 1);
				moveTo(0, 0);
				lineTo(0, 20);
				lineTo(50, 20);
				lineTo(50, 0);
				lineTo(0, 0);
				endFill();
			}
		}
		internal function knPress(e:MouseEvent):void {
			per = 1;
			e.target.startDrag();
		}
		internal function knRelease(e:MouseEvent):void {
			per = 0;
			e.target.stopDrag();
			Treug.x = treugX;
		}
	}
}