package {
	
	import flash.display.Sprite;
	import flash.display.GradientType;
	import flash.display.InterpolationMethod;
	import flash.display.SpreadMethod;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	import flash.geom.Matrix;
	
	public class GradFill extends Sprite {
		internal var per:int = 0;
		internal var perSozd:int = 0;
		internal var nachX:Number;
		internal var konX:Number;
		internal var vremSprt:Sprite;
		internal var ramka:Sprite = new Sprite();
		internal var udalM:Sprite = new Sprite();
		internal var udalVse:Sprite = new Sprite();
		internal var zadCvet:Sprite = new Sprite();
		internal var zadAlfa:Sprite = new Sprite();
		internal var indxSprite:int;
		internal var MarkerSprite:Sprite = new Sprite();
		//В этом массиве хранятся удалённые маркеры для последующего использования
		internal var udMarkery:Array = new Array();
		internal var markers:Array = new Array();
		internal var types:String=GradientType.LINEAR;
		internal var colors:Array = new Array();
		internal var alfas:Array = new Array();
		internal var ratios:Array = new Array();
		internal var matrixes:Matrix = new Matrix();
		internal var vremMatrica:Matrix;
		internal var spMes:String;
		internal var intMes:String;
		internal var fPes:Number;
		internal var Telo:Sprite = new Sprite();
		internal var TeloGradienta:Sprite = new Sprite();
		internal var txFormat:TextFormat = new TextFormat();
		internal var TypNadp:TextField = new TextField();
		internal var SpNadp:TextField = new TextField();
		internal var IntNadp:TextField = new TextField();
		internal var Typ:Spisok = new Spisok(2,42,15,["LINEAR","RADIAL"]);
		internal var SpMetod:Spisok = new Spisok(3,50,15,["PAD","REFLECT","REPEAT"]);
		internal var IntMetod:Spisok = new Spisok(2, 70, 15, ["LINEAR_RGB", "RGB"]);
		internal var Matrica:Spisok = new Spisok(2, 70, 15, ["MATRIX", "MATR_NONE"]);
		internal var Alf:CifrBlat = new CifrBlat();
		internal var Fpp:CifrBlat = new CifrBlat();
		internal var TabloM1:TextField = new TextField();
		internal var TabloM2:TextField = new TextField();
		internal var TabloM3:TextField = new TextField();
		internal var TabloM4:TextField = new TextField();
		internal var TabloM5:TextField = new TextField();
		
		public function GradFill():void {
			vremMatrica = matrixes;
			with (txFormat) {
				size = 11;
				color = 0x020C62;
				font = "Arial Cyr";
				bold = false;
			}
			with (Telo.graphics) {
				beginFill(0xA29FF9, 1);
				drawRoundRect(0, 0, 205, 135, 10, 10);
			}
			with (TypNadp) {
				type = TextFieldType.DYNAMIC;
				selectable = false;
				height = 20;
				width = 70;
				text = "type";
				setTextFormat(Typ.txFormat1);
				x = 5;
			}
			with (SpNadp) {
				type = TextFieldType.DYNAMIC;
				selectable = false;
				height = 20;
				width = 70;
				text = "spMetod";
				setTextFormat(Typ.txFormat1);
				x = 50;
			}
			with (IntNadp) {
				type = TextFieldType.DYNAMIC;
				selectable = false;
				height = 20;
				width = 70;
				text = "intMetod";
				setTextFormat(Typ.txFormat1);
				x = 105;
			}
			Typ.x = 5;
			Typ.y = 20;
			SpMetod.x = 50;
			SpMetod.y = 20;
			IntMetod.x = 105;
			IntMetod.y = 20;
			Matrica.x = 105;
			Matrica.y = 50;
			with (Alf) {
				x = 5;
				y = 35;
				telo.y = 15;
				telo.text="1"
				telo.height = 17;
				teloNadp.text = "Alfa";
				telo.setTextFormat(Typ.txFormat1);
				teloNadp.setTextFormat(Typ.txFormat1);
			}
			with (Fpp) {
				x = 55;
				y = 35;
				telo.y = 15;
				telo.text="1"
				telo.height = 17;
				teloNadp.text = "Fpp";
				telo.setTextFormat(Typ.txFormat1);
				teloNadp.setTextFormat(Typ.txFormat1);
			}
			with (TabloM1) {
				type = TextFieldType.INPUT;
				height = 17;
				width = 30;
				background = true;
				x = 5;
				y = 80;
				text = 20;
				setTextFormat(Typ.txFormat1);
			}
			with (TabloM2) {
				type = TextFieldType.INPUT;
				height = 17;
				width = 30;
				background = true;
				x = 39;
				y = 80;
				text = 20;
				setTextFormat(Typ.txFormat1);
			}
			with (TabloM3) {
				type = TextFieldType.INPUT;
				height = 17;
				width = 30;
				background = true;
				x = 73;
				y = 80;
				text = 20;
				setTextFormat(Typ.txFormat1);
			}
			with (TabloM4) {
				type = TextFieldType.INPUT;
				height = 17;
				width = 30;
				background = true;
				x = 107;
				y = 80;
				text = 20;
				setTextFormat(Typ.txFormat1);
			}
			with (TabloM5) {
				type = TextFieldType.INPUT;
				height = 17;
				width = 30;
				background = true;
				x = 141;
				y = 80;
				text = 20;
				setTextFormat(Typ.txFormat1);
			}
			with (TeloGradienta.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xEF10D2, 1);
				moveTo(0, 0);
				lineTo(0, 10);
				lineTo(170, 10);
				lineTo(170, 0);
				endFill();
			}
			TeloGradienta.x = 5;
			TeloGradienta.y = 105;
			TeloGradienta.addEventListener(MouseEvent.MOUSE_DOWN, sozdanieMarkera);
			with (udalM.graphics) {
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x000000, 1);
				moveTo(7, 2);
				lineTo(7, 13);
				lineStyle(2, 0xFF1111, 1);
				moveTo(13, 2);
				lineTo(2, 13);
			}
			udalM.x = 185;
			udalM.y = 20;
			udalM.addEventListener(MouseEvent.MOUSE_DOWN, udalMPress);
			udalM.addEventListener(MouseEvent.MOUSE_UP, udalMRelease);
			with (udalVse.graphics) {
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x000000, 1);
				moveTo(5, 2);
				lineTo(5, 13);
				moveTo(9, 2);
				lineTo(9, 13);
				lineStyle(2, 0xFF1111, 1);
				moveTo(13, 2);
				lineTo(2, 13);
			}
			udalVse.x = 185;
			udalVse.y = 40;
			udalVse.addEventListener(MouseEvent.MOUSE_DOWN, udalVsePress);
			udalVse.addEventListener(MouseEvent.MOUSE_UP, udalVseRelease);
			with (zadAlfa.graphics) {
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x000000, 0.3);
				beginFill(0xFF0000, 0.3);
				drawRect(2, 2, 11, 11);
			}
			zadAlfa.x = 185;
			zadAlfa.y = 60;
			zadAlfa.addEventListener(MouseEvent.MOUSE_DOWN, zadAlfaPress);
			zadAlfa.addEventListener(MouseEvent.MOUSE_UP, zadAlfaRelease);
			with (zadCvet.graphics) {
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x000000, 1);
				beginFill(0x00FF00, 1);
				drawRect(2, 2, 11, 11);
			}
			zadCvet.x = 185;
			zadCvet.y = 80;
			zadCvet.addEventListener(MouseEvent.MOUSE_DOWN, zadCvetPress);
			zadCvet.addEventListener(MouseEvent.MOUSE_UP, zadCvetRelease);
			with (ramka.graphics) {
				lineStyle(1, 0x000000, 1);
				moveTo( -5, -3);
				lineTo(5, -3);
				lineTo(5, 16);
				lineTo( -5, 16);
				lineTo(-5, -3);
			}
			ramka.visible = false;
			ramka.y = TeloGradienta.y + 11;
			addChild(Telo);
			addChild(TypNadp);
			addChild(SpNadp);
			addChild(IntNadp);
			addChild(Alf);
			addChild(Fpp);
			addChild(TabloM1);
			addChild(TabloM2);
			addChild(TabloM3);
			addChild(TabloM4);
			addChild(TabloM5);
			addChild(Matrica);
			addChild(Typ);
			addChild(SpMetod);
			addChild(IntMetod);
			addChild(TeloGradienta);
			addChild(MarkerSprite);
			addChild(udalM);
			addChild(udalVse);
			addChild(zadAlfa);
			addChild(zadCvet);
			addChild(ramka);
		}
		internal function udalMPress(e:MouseEvent):void {
			with (udalM.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x000000, 1);
				moveTo(7, 2);
				lineTo(7, 13);
				lineStyle(2, 0xFF1111, 1);
				moveTo(13, 2);
				lineTo(2, 13);
				lineStyle(2, 0xFF1111, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
			}
			udalenieMarkera();
			ramka.visible = false;
		}
		internal function udalMRelease(e:MouseEvent):void {
			with (udalM.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x000000, 1);
				moveTo(7, 2);
				lineTo(7, 13);
				lineStyle(2, 0xFF1111, 1);
				moveTo(13, 2);
				lineTo(2, 13);
			}
		}
		internal function udalVsePress(e:MouseEvent):void {
			with (udalVse.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x000000, 1);
				moveTo(5, 2);
				lineTo(5, 13);
				moveTo(9, 2);
				lineTo(9, 13);
				lineStyle(2, 0xFF1111, 1);
				moveTo(13, 2);
				lineTo(2, 13);
				lineStyle(2, 0xFF1111, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
			}
			for (var i:int = 0; i < markers.length; i++) {
				markers[i].removeEventListener(MouseEvent.MOUSE_DOWN, MarPress);
				markers[i].removeEventListener(MouseEvent.MOUSE_UP, MarRelease);
				markers[i].graphics.clear();
				MarkerSprite.removeChild(markers[i]);
				parent.parent.udTochki.push(markers[i]);
			}
			markers.length = 0;
			colors.length = 0;
			alfas.length = 0;
			ratios.length = 0;
			ramka.visible = false;
		}
		internal function udalVseRelease(e:MouseEvent):void {
			with (udalVse.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x000000, 1);
				moveTo(5, 2);
				lineTo(5, 13);
				moveTo(9, 2);
				lineTo(9, 13);
				lineStyle(2, 0xFF1111, 1);
				moveTo(13, 2);
				lineTo(2, 13);
			}
		}
		internal function zadAlfaPress(e:MouseEvent):void {
			with (zadAlfa.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x000000, 0.3);
				beginFill(0xFF0000, 0.3);
				drawRect(2, 2, 11, 11);
				lineStyle(2, 0xFF1111, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
			}
			parent.parent.tekNomFormy = int(parent.parent.NomerFormy.telo.text);
			parent.parent.tekPoryadok = int(parent.parent.Poryadok.telo.text);
			if (parent.parent.tekPoryadok < 2) {
				parent.parent.tekPoryadok = 2;
			}
			alfas[indxSprite] = Alf.telo.text;
			Alf.telo.setTextFormat(Typ.txFormat1);
			if (parent.parent.forms.length > 0) {
				if(parent.parent.forms[parent.parent.tekNomFormy]!=undefined){
					if(parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1]!=undefined){
						if (parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][0] == "bgGrFl") {
							parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][4][indxSprite] = Alf.telo.text;
						}
					}
				}
			}
		}
		internal function zadAlfaRelease(e:MouseEvent):void {
			with (zadAlfa.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x000000, 0.3);
				beginFill(0xFF0000, 0.3);
				drawRect(2, 2, 11, 11);
			}
		}
		internal function zadCvetPress(e:MouseEvent):void {
			with (zadCvet.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x000000, 1);
				beginFill(0x00FF00, 1);
				drawRect(2, 2, 11, 11);
				lineStyle(2, 0xFF1111, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
			}
			parent.parent.tekNomFormy = int(parent.parent.NomerFormy.telo.text);
			parent.parent.tekPoryadok = int(parent.parent.Poryadok.telo.text);
			if (parent.parent.tekPoryadok < 2) {
				parent.parent.tekPoryadok = 2;
			}
			colors[indxSprite] = "0x" + parent.parent.ColM.cvet;
			if(markers[indxSprite]!=undefined){
				with (markers[indxSprite].graphics) {
					clear();
					lineStyle(1, 0xFBF548, 0);
					beginFill("0x" + parent.parent.ColM.cvet, 1);
					moveTo( -2.5, 5);
					lineTo(0, 0);
					lineTo(2.5, 5);
					moveTo( -2.5, 5);
					lineTo(-2.5, 13);
					lineTo(2.5, 13);
					lineTo(2.5, 5);
					endFill();
				}
			}
			if (parent.parent.forms.length > 0) {
				if(parent.parent.forms[parent.parent.tekNomFormy]!=undefined){
					if(parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1]!=undefined){
						if (parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][0] == "bgGrFl") {
							parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][3][indxSprite] = "0x" + parent.parent.ColM.cvet;
						}
					}
				}
			}
		}
		internal function zadCvetRelease(e:MouseEvent):void {
			with (zadCvet.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x000000, 1);
				beginFill(0x00FF00, 1);
				drawRect(2, 2, 11, 11);
			}
		}
		internal function sozdanieMarkera(e:MouseEvent):void {
			perSozd = 1;
			//В случае, если создаётся первый маркер
			if (markers.length == 0 && perSozd == 1) {
				if (udMarkery.length > 0) {
					markers[markers.length] = udMarkery[udMarkery.length - 1];
					udMarkery.length = udMarkery.length - 1;
				}else{
					markers[markers.length] = new Sprite();
				}
				MarkerSprite.addChild(markers[markers.length - 1]);
				with (markers[markers.length-1].graphics) {
					lineStyle(1, 0xFBF548, 0);
					beginFill("0x" + parent.parent.ColM.cvet, 1);
					moveTo( -2.5, 5);
					lineTo(0, 0);
					lineTo(2.5, 5);
					moveTo( -2.5, 5);
					lineTo(-2.5, 13);
					lineTo(2.5, 13);
					lineTo(2.5, 5);
					endFill();
				}
				markers[markers.length-1].x = e.localX+TeloGradienta.x;
				markers[markers.length - 1].y = TeloGradienta.y + 11;
				markers[markers.length - 1].addEventListener(MouseEvent.MOUSE_DOWN, MarPress);
				markers[markers.length - 1].addEventListener(MouseEvent.MOUSE_UP, MarRelease);
				if (Typ.nadpis.text == "LINEAR") {
					types = GradientType.LINEAR;
				}
				if (Typ.nadpis.text == "RADIAL") {
					types = GradientType.RADIAL;
				}
				colors[markers.length - 1] = "0x" + parent.parent.ColM.cvet;
				alfas[markers.length - 1] = Alf.telo.text;
				//172 вместо 170 ставится здесь и в двух последующих случаях во избежании значения ратиос больше 255
				ratios[markers.length - 1] = Math.round((255 / 172) * (markers[markers.length - 1].x - TeloGradienta.x));
				matrixes = null;
				if (Matrica.nadpis.text == "MATRIX") {
					matrixes = vremMatrica;
					matrixes.createGradientBox(TabloM1.text, TabloM2.text, TabloM3.text, TabloM4.text, TabloM5.text);
				}
				spMes = SpreadMethod.PAD;
				if (SpMetod.nadpis.text == "REFLECT") {
					spMes = SpreadMethod.REFLECT;
				}
				if (SpMetod.nadpis.text == "REPEAT") {
					spMes = SpreadMethod.REPEAT;
				}
				intMes = InterpolationMethod.RGB;
				if (IntMetod.nadpis.text == "LINEAR_RGB") {
					intMes = InterpolationMethod.LINEAR_RGB;
				}
				fPes = 0;
				fPes = Fpp.telo.text;
				with (TeloGradienta.graphics) {
					clear();
					lineStyle(1, 0xFBF548, 0);
					beginGradientFill(types, colors, alfas, ratios, matrixes, spMes, intMes, fPes);
					moveTo(0, 0);
					lineTo(0, 10);
					lineTo(170, 10);
					lineTo(170, 0);
					endFill();
				}
				perSozd = 0;
			}
			//Другие два случая случая
			if (markers[markers.length - 1].x != undefined && perSozd == 1) {
				for (var j:int = 0; i < markers.length; j++) {
					//В случае, если маркер должен быть поставлен в начало вместо первого маркера
					if (e.localX + TeloGradienta.x <= markers[j].x) {
						for (var i:int = colors.length - 1; i >= j; i--) {
							markers[i+1] = markers[i];
							colors[i+1] = colors[i];
							alfas[i+1] = alfas[i];
							ratios[i+1] = ratios[i];
							colors[i] = undefined;
							alfas[i] = undefined;
							ratios[i] = undefined;
							markers[i] = undefined;
						}
						if (udMarkery.length > 0) {
							markers[j] = udMarkery[udMarkery.length - 1];
							udMarkery.length = udMarkery.length - 1;
						}else{
							markers[j] = new Sprite();
						}
						MarkerSprite.addChild(markers[j]);
						MarkerSprite.setChildIndex(markers[j], j);
						with (markers[j].graphics) {
							lineStyle(1, 0xFBF548, 0);
							beginFill("0x" + parent.parent.ColM.cvet, 1);
							moveTo( -2.5, 5);
							lineTo(0, 0);
							lineTo(2.5, 5);
							moveTo( -2.5, 5);
							lineTo(-2.5, 13);
							lineTo(2.5, 13);
							lineTo(2.5, 5);
							endFill();
						}
						markers[j].x = e.localX + TeloGradienta.x;
						markers[j].y = TeloGradienta.y + 11;
						markers[j].addEventListener(MouseEvent.MOUSE_DOWN, MarPress);
						markers[j].addEventListener(MouseEvent.MOUSE_UP, MarRelease);
						if (Typ.nadpis.text == "LINEAR") {
						types= GradientType.LINEAR;
						}
						if (Typ.nadpis.text == "RADIAL") {
							types = GradientType.RADIAL;
						}
						colors[j] = "0x" + parent.parent.ColM.cvet;
						alfas[j] = Alf.telo.text;
						ratios[j] = Math.round((255 / 172) * (markers[j].x - TeloGradienta.x));
						matrixes = null;
						if (Matrica.nadpis.text == "MATRIX") {
							matrixes = vremMatrica;
							matrixes.createGradientBox(TabloM1.text, TabloM2.text, TabloM3.text, TabloM4.text, TabloM5.text);
						}
						spMes = SpreadMethod.PAD;
						if (SpMetod.nadpis.text == "REFLECT") {
							spMes = SpreadMethod.REFLECT;
						}
						if (SpMetod.nadpis.text == "REPEAT") {
							spMes = SpreadMethod.REPEAT;
						}
						intMes = InterpolationMethod.RGB;
						if (IntMetod.nadpis.text == "LINEAR_RGB") {
							intMes = InterpolationMethod.LINEAR_RGB;
						}
						fPes = 0;
						fPes = Fpp.telo.text;
						with (TeloGradienta.graphics) {
							clear();
							lineStyle(1, 0xFBF548, 0);
							beginGradientFill(types, colors, alfas, ratios, matrixes, spMes, intMes, fPes);
							moveTo(0, 0);
							lineTo(0, 10);
							lineTo(170, 10);
							lineTo(170, 0);
							endFill();
						}
						break;
					}
					//В случае, если маркер ставится в середину ряда
					if (e.localX + TeloGradienta.x > markers[j].x && (markers[j + 1]==undefined||markers[j + 1]==null||(e.localX + TeloGradienta.x < markers[j + 1].x))) {
						if (markers[j + 1] != undefined || markers[j + 1] != null) {
							for (i= colors.length - 1; i > j; i--) {
								markers[i+1] = markers[i];
								colors[i+1] = colors[i];
								alfas[i+1] = alfas[i];
								ratios[i+1] = ratios[i];
								colors[i] = undefined;
								alfas[i] = undefined;
								ratios[i] = undefined;
								markers[i] = undefined;
							}
							if (udMarkery.length > 0) {
								markers[j + 1] = udMarkery[udMarkery.length - 1];
								udMarkery.length = udMarkery.length - 1;
							}else{
								markers[j + 1] = new Sprite();
							}
							MarkerSprite.addChild(markers[j + 1]);
							MarkerSprite.setChildIndex(markers[j + 1], j + 1);
						}
						if (markers[j + 1] == undefined || markers[j + 1] == null) {
							if (udMarkery.length > 0) {
								markers[j + 1] = udMarkery[udMarkery.length - 1];
								udMarkery.length = udMarkery.length - 1;
							}else{
								markers[j + 1] = new Sprite();
							}
							MarkerSprite.addChild(markers[j + 1]);
						}
						with (markers[j + 1].graphics) {
							lineStyle(1, 0xFBF548, 0);
							beginFill("0x" + parent.parent.ColM.cvet, 1);
							moveTo( -2.5, 5);
							lineTo(0, 0);
							lineTo(2.5, 5);
							moveTo( -2.5, 5);
							lineTo(-2.5, 13);
							lineTo(2.5, 13);
							lineTo(2.5, 5);
							endFill();
						}
						markers[j + 1].x = e.localX + TeloGradienta.x;
						markers[j + 1].y = TeloGradienta.y + 11;
						markers[j + 1].addEventListener(MouseEvent.MOUSE_DOWN, MarPress);
						markers[j + 1].addEventListener(MouseEvent.MOUSE_UP, MarRelease);
						if (Typ.nadpis.text == "LINEAR") {
							types = GradientType.LINEAR;
						}
						if (Typ.nadpis.text == "RADIAL") {
							types = GradientType.RADIAL;
						}
						colors[j + 1] = "0x" + parent.parent.ColM.cvet;
						alfas[j + 1] = Alf.telo.text;
						ratios[j + 1] = Math.round((255 / 172) * (markers[j + 1].x - TeloGradienta.x));
						matrixes = null;
						if (Matrica.nadpis.text == "MATRIX") {
							matrixes = vremMatrica;
							matrixes.createGradientBox(TabloM1.text, TabloM2.text, TabloM3.text, TabloM4.text, TabloM5.text);
						}
						spMes = SpreadMethod.PAD;
						if (SpMetod.nadpis.text == "REFLECT") {
							spMes = SpreadMethod.REFLECT;
						}
						if (SpMetod.nadpis.text == "REPEAT") {
							spMes = SpreadMethod.REPEAT;
						}
						intMes = InterpolationMethod.RGB;
						if (IntMetod.nadpis.text == "LINEAR_RGB") {
							intMes = InterpolationMethod.LINEAR_RGB;
						}
						fPes = 0;
						fPes = Fpp.telo.text;
						with (TeloGradienta.graphics) {
							clear();
							lineStyle(1, 0xFBF548, 0);
							beginGradientFill(types, colors, alfas, ratios, matrixes, spMes, intMes, fPes);
							moveTo(0, 0);
							lineTo(0, 10);
							lineTo(170, 10);
							lineTo(170, 0);
							endFill();
						}
						break;
					}
				}
				perSozd = 0;
			}
		}
		internal function udalenieMarkera():void {
			if (vremSprt is Sprite) {
				indxSprite = MarkerSprite.getChildIndex(vremSprt);
				vremSprt = undefined;
				parent.parent.tekNomFormy = int(parent.parent.NomerFormy.telo.text);
				parent.parent.tekPoryadok = int(parent.parent.Poryadok.telo.text);
				if (parent.parent.tekPoryadok < 2) {
					parent.parent.tekPoryadok = 2;
				}
				colors[indxSprite] = undefined;
				alfas[indxSprite] = undefined;
				ratios[indxSprite] = undefined;
				markers[indxSprite].removeEventListener(MouseEvent.MOUSE_DOWN, MarPress);
				markers[indxSprite].removeEventListener(MouseEvent.MOUSE_UP, MarRelease);
				markers[indxSprite].graphics.clear();
				udMarkery.push(markers[indxSprite]);
				MarkerSprite.removeChild(markers[indxSprite]);
				for (var i:int = indxSprite; i < colors.length - 1; i++) {
					markers[i] = markers[i + 1];
					colors[i] = colors[i + 1];
					alfas[i] = alfas[i + 1];
					ratios[i] = ratios[i + 1];
					colors[i + 1] = undefined;
					alfas[i + 1] = undefined;
					ratios[i + 1] = undefined;
					markers[i + 1] = undefined;
					if (parent.parent.forms.length > 0) {
						if(parent.parent.forms[parent.parent.tekNomFormy]!=undefined){
							if(parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1]!=undefined){
								if (parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][0] == "bgGrFl") {
									parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][3][i] = parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][3][i + 1];
									parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][4][i] = parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][4][i + 1];
									parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][5][i] = parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][5][i + 1];
									parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][3][i + 1] = undefined;
									parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][4][i + 1] = undefined;
									parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][5][i + 1] = undefined;
								}
							}
						}
					}
				}
				markers.length = markers.length - 1;
				colors.length -= 1;
				alfas.length -= 1;
				ratios.length -= 1;
				if (parent.parent.forms.length > 0) {
					if(parent.parent.forms[parent.parent.tekNomFormy]!=undefined){
						if(parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1]!=undefined){
							if (parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][0] == "bgGrFl") {
								parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][3].length -= 1;
								parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][4].length -= 1;
								parent.parent.forms[parent.parent.tekNomFormy][parent.parent.tekPoryadok - 1][5].length -= 1;
							}
						}
					}
				}
			}
		}
		internal function MarPress(e:MouseEvent):void {
			vremSprt = e.target;
			indxSprite = MarkerSprite.getChildIndex(e.target);
			ramka.visible = true;
			ramka.x = markers[indxSprite].x;
			Alf.telo.text = alfas[indxSprite];
			Alf.telo.setTextFormat(Typ.txFormat1);
			e.target.startDrag();
			if ((markers[indxSprite-1] == undefined || markers[indxSprite-1] == null) && (markers[indxSprite + 1] == undefined || markers[indxSprite + 1] == null)) {
				nachX = TeloGradienta.x;
				konX = TeloGradienta.x + TeloGradienta.width;
			}
			if ((markers[indxSprite-1] == undefined || markers[indxSprite-1] == null) && (markers[indxSprite + 1] != undefined ||markers[indxSprite + 1] != null)) {
				nachX = TeloGradienta.x;
				konX = markers[indxSprite + 1].x-3;
			}
			if ((markers[indxSprite-1] != undefined || markers[indxSprite-1] != null) && (markers[indxSprite + 1] != undefined || markers[indxSprite + 1] != null)) {
				nachX = markers[indxSprite-1].x+3;
				konX = markers[indxSprite + 1].x-3;
			}
			if ((markers[indxSprite-1] != undefined || markers[indxSprite-1] != null) && (markers[indxSprite + 1] == undefined || markers[indxSprite + 1] == null)) {
				nachX = markers[indxSprite-1].x+3;
				konX = TeloGradienta.x + TeloGradienta.width;
			}
			per = 1;
		}
		internal function MarRelease(e:MouseEvent):void {
			e.target.stopDrag();
			per = 0;
			e.target.x = markers[indxSprite].x;
			e.target.y = markers[indxSprite].y;
		}
	}
}