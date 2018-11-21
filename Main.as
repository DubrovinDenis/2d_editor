package {
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	import flash.display.GradientType;
	import flash.display.InterpolationMethod;
	import flash.display.SpreadMethod;
	import flash.display.LineScaleMode;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	
	public class Main extends Sprite {
		internal var linSt5True:Boolean = true;
		internal var linSt5False:Boolean = false;
		internal var linSt6Norm:String=LineScaleMode.NORMAL;
		internal var linSt6None:String=LineScaleMode.NONE;
		internal var linSt6Vert:String=LineScaleMode.VERTICAL;
		internal var linSt6Hor:String=LineScaleMode.HORIZONTAL;
		internal var linSt7Rd:String=CapsStyle.ROUND;
		internal var linSt7None:String=CapsStyle.NONE;
		internal var linSt7Sq:String=CapsStyle.SQUARE;
		internal var linSt8Bev:String = JointStyle.BEVEL; 
		internal var linSt8Rd:String=JointStyle.ROUND;
		internal var linSt8Mit:String=JointStyle.MITER;
		internal var gr2Lin:String=GradientType.LINEAR;
		internal var gr2Rad:String=GradientType.RADIAL
		internal var matrica:Matrix = new Matrix();
		internal var gr7Pad:String=SpreadMethod.PAD;
		internal var gr7Ref:String=SpreadMethod.REFLECT;
		internal var gr7Rep:String=SpreadMethod.REPEAT;
		internal var gr8Rgb:String=InterpolationMethod.RGB;
		internal var gr8LinRgb:String=InterpolationMethod.LINEAR_RGB;
		//Здесь хранятся удалённые Спрайты для последующего использования в будущем
		internal var udTochki:Array = new Array();
		internal var udMassivy:Array = new Array();
		private var PoleInstrumentov:Sprite = new Sprite();
		private var Risunok:Sprite = new Sprite();
		private var NazInstr:TextField = new TextField();
		private var NazRedakt:TextField = new TextField();
		private var NazVivod:TextField = new TextField();
		private var NazStyle:TextField = new TextField();
		private var NazPozic:TextField = new TextField();
		private var NazAnim:TextField = new TextField();
		private var NazSohr:TextField = new TextField();
		private var lnST:Sprite = new Sprite();
		private var vstavkaForm:Sprite = new Sprite();
		private var bgFL:Sprite = new Sprite();
		private var bgGrFL:Sprite = new Sprite();
		private var enFL:Sprite = new Sprite();
		private var movT:Sprite = new Sprite();
		private var linT:Sprite = new Sprite();
		private var curT:Sprite = new Sprite();
		private var udalTochki:Sprite = new Sprite();
		private var udalFormy:Sprite = new Sprite();
		private var peremeshFormy:Sprite = new Sprite();
		private var kopirForm:Sprite = new Sprite();
		private var nomKopir:TextField = new TextField();
		private var NadpKopir:TextField = new TextField();
		private var vremKopir:int = 0;
		private var povFormy1:Sprite = new Sprite();
		private var povFormy2:Sprite = new Sprite();
		private var zadPozic:Sprite = new Sprite();
		private var zadVisible:Sprite = new Sprite();
		private var zadVisiblePer:Boolean = true;
		internal var rot:Number;
		internal var ugolRot:Number=0;
		internal var perRotation:Number = 0;
		internal var tochkaRot:Point = new Point();
		internal var RotSprt:Sprite = new Sprite();
		internal var TabloRot:TextField = new TextField();
		private var strochkaPlus:Sprite = new Sprite();
		private var strochkaMinus:Sprite = new Sprite();
		private var stranicaPlus:Sprite = new Sprite();
		private var stranicaMinus:Sprite = new Sprite();
		private var vvUG:Sprite = new Sprite();
		private var centr:Sprite = new Sprite();
		private var SohrRis:Sprite = new Sprite();
		private var SohrShape0:Sprite = new Sprite();
		private var SohrShape1:Shape = new Shape();
		private var SohrShape2:Shape = new Shape();
		private var SohrShape3:Shape = new Shape();
		private var SohrShape4:Shape = new Shape();
		private var SohrShape5:Shape = new Shape();
		private var VostRis:Sprite = new Sprite();
		private var VostShape0:Sprite = new Sprite();
		private var VostShape1:Shape = new Shape();
		private var VostShape2:Shape = new Shape();
		private var VostShape3:Shape = new Shape();
		private var vostStr:String="";
		private var vostPer:int = 0;
		private var vostTekPoz:int = -1;
		private var vost1ind:String="";
		private var vost2ind:String="";
		private var vostElemMas:String = "";
		private var vostTypMas:String = "";
		private var vostPoryadok:int = 0;
		private var vostPorGrad:int = -3;
		private var vostPerTochek:int = 0;
		private var vostTekForma:String = "";
		private var vostPerekluch:int = 0;
		private var vostVklFunc:int = 0;
		private var txFormat1:TextFormat = new TextFormat();
		private var txFormat2:TextFormat = new TextFormat();
		private var Tolsh:CifrBlat = new CifrBlat();
		private var Alfa:CifrBlat = new CifrBlat();
		private var PiNadp:TextField = new TextField();
		private var PiH:Spisok = new Spisok(2, 30, 15, ["true", "false"]);
		private var ScNadp:TextField = new TextField();
		private var ScMode:Spisok = new Spisok(4, 55, 15, ["normal", "none", "vertical", "horizontal"]);
		private var CapsNadp:TextField = new TextField();
		private var CapsSt:Spisok = new Spisok(3, 40, 15, ["none", "round", "square"]);
		private var JointNadp:TextField = new TextField();
		private var JointSt:Spisok = new Spisok(3, 35, 15, ["bevel", "miter", "round"]);
		private var MitLimit:CifrBlat = new CifrBlat();
		private var CtrlX:CifrBlat = new CifrBlat();
		private var CtrlY:CifrBlat = new CifrBlat();
		private var X:CifrBlat = new CifrBlat();
		private var Y:CifrBlat = new CifrBlat();
		internal var Poryadok:CifrBlat = new CifrBlat();
		internal var NomerFormy:CifrBlat = new CifrBlat();
		internal var KnAnimNach:Shape = new Shape();
		internal var KnAnimVst1:Shape = new Shape();
		internal var KnAnimVst2:Shape = new Shape();
		internal var KnAnimUd1:Shape = new Shape();
		internal var KnAnimUd2:Shape = new Shape();
		internal var KnAnimUdCherta:Shape = new Shape();
		internal var KnAnimPl:Shape = new Shape();
		internal var KnAnimOch:Shape = new Shape();
		internal var KnAnimOchCherta:Shape = new Shape();
		internal var ChisloSek:CifrBlat = new CifrBlat();
		internal var NazvRisunka:CifrBlat = new CifrBlat();
		private var NachAnim:Sprite = new Sprite();
		private var VstAnim:Sprite = new Sprite();
		private var UdalAnim:Sprite = new Sprite();
		private var PlayAnim:Sprite = new Sprite();
		private var OchistAnim:Sprite = new Sprite();
		private var VivodAnim:Sprite = new Sprite();
		private var Out:CifrBlat = new CifrBlat();
		internal var ColM:ColorMixer = new ColorMixer();
		internal var GrFill:GradFill = new GradFill();
		//Основные массивы
		internal var forms:Array = new Array();
		private var formsIsxKod:Array = new Array();
		private var formsX0:Array = new Array();
		private var formsY0:Array = new Array();
		private var formsGrBox:Array = new Array();
		private var formsVivX:Array = new Array();
		private var formsVivY:Array = new Array();
		private var formsVivKod:Array = new Array();
		//Используется в функциях центрования всех форм
		private var vremLinStMas:Array = new Array();
		private var vremGrFillMas:Array = new Array();
		internal var tekNomFormy:int = 0;
		internal var tekPoryadok:int = 1;
		private var animRisunok:Array = new Array();
		private var animMas:Array = new Array();
		private var animIsxKod:Array = new Array();
		//Переменная отменяет вычисление центра формы для избежания проблем во время анимации
		private var animPer:int = 0;
		private var animDvizX:Number;
		private var animDvizY:Number;
		private var animNaprX:int;
		private var animNaprY:int;
		private var animImyaRisunka:String;
		private var animImyaMassiva:String;
		private var animNomerFormy:int;
		private var animNomerAnimacii:int;
		private var animObshSek:Number = 0;
		private var animTekNomMas:int;
		private var animSchetKon:int = 0;
		private var animSchetchik:int = -1;
		private var animChisloForm:int = 0;
		//Переменная используется во время анимации во время перемещения и поворота, включает центрование объекта в рисовании
		private var animaciya:Boolean = false;
		//ДлинаФормы используется в удаленииФормы во избежании проблемы в первом цикле
		private var dlinaFormy:int = 0;
		//Включает код изменения порядка в списке отображения
		private var izmPoryadka:int = 0;
		//Переменная используется в функции вставки точек для определения нажатия именно кривой линии
		private var knopCurv:int = 0;
		private var vremSprt:Sprite;
		//Используется для удаления градиента перед его отрисовкой во время редактирования
		private var udalGradienta:int = 0;
		private var vosstanovlenie:int = 0;
		private var peremeshKurs:Sprite = new Sprite();
		private var perPeremesh:int = 0;
		private var raznPeremeshX:Number = 0;
		private var raznPeremeshY:Number = 0;
		internal var risov:int = 0;
		//Используются в функции привязки к углам
		internal var minX:Number;
		internal var minY:Number;
		internal var maxX:Number;
		internal var maxY:Number;
		internal var X0:Number;
		internal var Y0:Number;
		
		public function Main():void  {
			
			with (txFormat1) {
				size = 15;
				color = 0x020C62;
				font = "Arial Cyr";
				bold = true;
				italic = true;
			}
			with (txFormat2) {
				size = 10;
				color = 0x020C62;
				font = "Arial Cyr";
				bold = true;
				italic = true;
			}
			/**************************Рисование кнопок********************************/
			
			with (PoleInstrumentov.graphics) {
				lineStyle(2, 0x1510A0, 1);
				drawRoundRect(5, 20, 50, 95, 10);
			}
			with (NazInstr) {
				height = 25;
				width = 40;
				type = TextFieldType.DYNAMIC;
				selectable = false;
				text = "Инстр";
				setTextFormat(txFormat2);
				x = 10;
				y = 5;
			}
			with (vstavkaForm.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
			}
			vstavkaForm.x = 10;
			vstavkaForm.y = 25;
			with (lnST.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 5);
				lineTo(4, 13);
				lineTo(8, 13);
				moveTo(16, 5);
				lineTo(12, 5);
				lineTo(12, 9);
				lineTo(16, 9);
				lineTo(16, 13);
				lineTo(12, 13);
			}
			lnST.x = 31;
			lnST.y = 25;
			with (bgFL.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				beginFill(0xE7165A, 1);
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
				endFill();
			}
			bgFL.x = 10;
			bgFL.y = 46;
			with (bgGrFL.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				beginFill(0xFF1111, 1);
				lineStyle(2, 0x1510A0, 0);
				drawRect(3, 3, 7, 14);
				beginFill(0x52CB01, 1);
				drawRect(10, 3, 7, 14);
				endFill();
			}
			bgGrFL.x = 31;
			bgGrFL.y = 46;
			with (enFL.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				beginFill(0xE7165A, 1);
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
				endFill();
				lineStyle(2, 0xFF1111, 1);
				moveTo(18, 2);
				lineTo(2, 18);
			}
			enFL.x = 10;
			enFL.y = 67;
			with (movT.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 10);
				lineTo(16, 10);
				moveTo(10, 4);
				lineTo(10, 16);
			}
			movT.x = 31;
			movT.y = 67;
			with (linT.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 16);
				lineTo(16, 4);
			}
			linT.x = 10;
			linT.y = 88;
			with (curT.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 16);
				curveTo(2, 3, 16, 4);
			}
			curT.x = 31;
			curT.y = 88;
			
			with (NazRedakt) {
				height = 25;
				width = 45;
				type = TextFieldType.DYNAMIC;
				selectable = false;
				text = "Редакт";
				setTextFormat(txFormat2);
				x = 8;
				y = 120;
			}
			with (PoleInstrumentov.graphics) {
				lineStyle(2, 0x1510A0, 1);
				drawRoundRect(5, 135, 50, 125, 10);
			}
			with (udalTochki.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 10);
				lineTo(16, 10);
				moveTo(10, 4);
				lineTo(10, 16);
				lineStyle(2, 0xFF1111, 1);
				moveTo(18, 2);
				lineTo(2, 18);
			}
			udalTochki.x = 10;
			udalTochki.y = 139;
			with (udalFormy.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
				lineStyle(2, 0xFF1111, 1);
				moveTo(18, 2);
				lineTo(2, 18);
			}
			udalFormy.x = 31;
			udalFormy.y = 139;
			with (peremeshFormy.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 10);
				lineTo(16, 10);
				moveTo(10, 4);
				lineTo(10, 16);
				moveTo(6, 12);
				lineTo(4, 10);
				moveTo(4, 10);
				lineTo(6, 8);
				moveTo(14, 8);
				lineTo(16, 10);
				moveTo(16, 10);
				lineTo(14, 12);
				moveTo(8, 6);
				lineTo(10, 4);
				moveTo(10, 4);
				lineTo(12, 6);
				moveTo(8, 14);
				lineTo(10, 16);
				moveTo(10, 16);
				lineTo(12, 14);
			}
			peremeshFormy.x = 10;
			peremeshFormy.y = 160;
			with (peremeshKurs.graphics) {
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
			peremeshKurs.x = -100;
			with (kopirForm.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				beginFill(0x6DF2AC, 1);
				lineStyle(2, 0x1510A0, 1);
				drawRect(1, 3, 7, 12);
				beginFill(0x6DF2AC, 1);
				drawRect(11, 3, 7, 12);
				endFill();
			}
			kopirForm.x = 31;
			kopirForm.y = 160;
			with (NadpKopir) {
				type = TextFieldType.DYNAMIC;
				selectable = false;
				height = 15;
				width = 20;
				x = 10;
				y = 182;
				text = "№";
				setTextFormat(txFormat2);
			}
			with (nomKopir) {
				type = TextFieldType.INPUT;
				background = true;
				height = 15;
				width = 26;
				x = 25;
				y = 182;
				text = 0;
				setTextFormat(txFormat2);
			}
			with (povFormy1.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(6, 16);
				curveTo(4, 2, 16, 6);
				moveTo(4, 14);
				lineTo(6, 16);
				moveTo(6, 16);
				lineTo(8, 14);
			}
			povFormy1.x = 10;
			povFormy1.y = 200;
			with (povFormy2.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(14, 16);
				curveTo(16, 2, 4, 6);
				moveTo(16, 14);
				lineTo(14, 16);
				moveTo(14, 16);
				lineTo(12, 14);
			}
			povFormy2.x = 31;
			povFormy2.y = 200;
			with (PoleInstrumentov.graphics) {
				lineStyle(2, 0x1510A0, 1);
				drawCircle(18, 225, 2);
			}
			with (TabloRot) {
				type = TextFieldType.INPUT;
				background = true;
				height = 15;
				width = 26;
				text = 4;
				setTextFormat(txFormat2);
				x = 25;
				y = 220;
			}
			with (zadPozic.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRoundRect(10, 5, 5, 10, 10);
				moveTo(5, 5);
				lineTo(5, 15);
				moveTo(2, 10);
				lineTo(5, 5);
			}
			zadPozic.x = 10;
			zadPozic.y = 237;
			with (zadVisible.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 0.4);
				moveTo(4, 10);
				lineTo(16, 10);
				moveTo(10, 4);
				lineTo(10, 16);
			}
			zadVisible.x = 31;
			zadVisible.y = 237;
			with (NazVivod) {
				height = 25;
				width = 40;
				type = TextFieldType.DYNAMIC;
				selectable = false;
				text = "Вывод";
				setTextFormat(txFormat2);
				x = 10;
				y = 265;
			}
			with (PoleInstrumentov.graphics) {
				lineStyle(2, 0x1510A0, 1);
				drawRoundRect(5, 280, 50, 25, 10);
			}
			with (vvUG.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(0.5, 0x000000, 1);
				moveTo(5, 0);
				lineTo(5, 10);
				moveTo(0, 5);
				lineTo(10, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
			}
			vvUG.x = 10;
			vvUG.y = 283;
			with (centr.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(0.5, 0x000000, 1);
				moveTo(10, 5);
				lineTo(10, 15);
				moveTo(5, 10);
				lineTo(15, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
			}
			centr.x = 31;
			centr.y = 283;
			with (NazAnim) {
				height = 25;
				width = 45;
				type = TextFieldType.DYNAMIC;
				selectable = false;
				text = "Анимац";
				setTextFormat(txFormat2);
				x = 8;
				y = 315;
			}
			with (PoleInstrumentov.graphics) {
				lineStyle(2, 0x1510A0, 1);
				drawRoundRect(5, 330, 50, 140, 10);
			}
			with (KnAnimNach.graphics) {
				lineStyle(10, 0x516BF0, 1);
				moveTo(16, -117);
				lineTo(17, 36);
				moveTo(17, 36);
				lineTo(-66, 118);
				moveTo(-62, 116);
				lineTo(-162, 91);
				moveTo(17, 36);
				lineTo(116, 101);
				moveTo(114, 96);
				lineTo(64, 170);
				moveTo(17, -95);
				lineTo(-91, -59);
				moveTo(-87, -62);
				lineTo(-68, 11);
				moveTo(17, -95);
				lineTo(89, -34);
				moveTo(86, -36);
				lineTo(162, -66);
				moveTo(16, -116);
				curveTo(-10, -122, -9, -146);
				curveTo(-9, -170, 16, -171);
				curveTo(41, -171, 41, -145);
				curveTo(41, -123, 16, -116);
			}
			KnAnimNach.height = 12;
			KnAnimNach.width = 12;
			KnAnimNach.x = 19;
			KnAnimNach.y = 414;
			with (NachAnim.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0xE02AC2, 1);
				drawRect(3, 3, 14, 14);
			}
			NachAnim.x = 10;
			NachAnim.y = 405;
			with(KnAnimVst1.graphics){
				lineStyle(10, 0x516BF0, 1);
				moveTo(16, -117);
				lineTo(17, 36);
				moveTo(17, 36);
				lineTo(-66, 118);
				moveTo(-62, 116);
				lineTo(-162, 91);
				moveTo(17, 36);
				lineTo(116, 101);
				moveTo(114, 96);
				lineTo(64, 170);
				moveTo(17, -95);
				lineTo(-91, -59);
				moveTo(-87, -62);
				lineTo(-68, 11);
				moveTo(17, -95);
				lineTo(89, -34);
				moveTo(86, -36);
				lineTo(162, -66);
				moveTo(16, -116);
				curveTo(-10, -122, -9, -146);
				curveTo(-9, -170, 16, -171);
				curveTo(41, -171, 41, -145);
				curveTo(41, -123, 16, -116);
			}
			with(KnAnimVst2.graphics){
				lineStyle(10, 0x1FEC26, 1);
				moveTo(16, -117);
				lineTo(17, 36);
				moveTo(17, 36);
				lineTo(-66, 118);
				moveTo(-62, 116);
				lineTo(-162, 91);
				moveTo(17, 36);
				lineTo(116, 101);
				moveTo(114, 96);
				lineTo(64, 170);
				moveTo(17, -95);
				lineTo(-91, -59);
				moveTo(-87, -62);
				lineTo(-68, 11);
				moveTo(17, -95);
				lineTo(89, -34);
				moveTo(86, -36);
				lineTo(162, -66);
				moveTo(16, -116);
				curveTo(-10, -122, -9, -146);
				curveTo(-9, -170, 16, -171);
				curveTo(41, -171, 41, -145);
				curveTo(41, -123, 16, -116);
			}
			KnAnimVst1.height = 12;
			KnAnimVst1.width = 12;
			KnAnimVst1.x = 38;
			KnAnimVst1.y = 414;
			KnAnimVst2.height = 12;
			KnAnimVst2.width = 12;
			KnAnimVst2.x = 43;
			KnAnimVst2.y = 414;
			with (VstAnim.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			VstAnim.x = 31;
			VstAnim.y = 405;
			with(KnAnimUd1.graphics){
				lineStyle(10, 0x516BF0, 1);
				moveTo(16, -117);
				lineTo(17, 36);
				moveTo(17, 36);
				lineTo(-66, 118);
				moveTo(-62, 116);
				lineTo(-162, 91);
				moveTo(17, 36);
				lineTo(116, 101);
				moveTo(114, 96);
				lineTo(64, 170);
				moveTo(17, -95);
				lineTo(-91, -59);
				moveTo(-87, -62);
				lineTo(-68, 11);
				moveTo(17, -95);
				lineTo(89, -34);
				moveTo(86, -36);
				lineTo(162, -66);
				moveTo(16, -116);
				curveTo(-10, -122, -9, -146);
				curveTo(-9, -170, 16, -171);
				curveTo(41, -171, 41, -145);
				curveTo(41, -123, 16, -116);
			}
			with(KnAnimUd2.graphics){
				lineStyle(10, 0x1FEC26, 1);
				moveTo(16, -117);
				lineTo(17, 36);
				moveTo(17, 36);
				lineTo(-66, 118);
				moveTo(-62, 116);
				lineTo(-162, 91);
				moveTo(17, 36);
				lineTo(116, 101);
				moveTo(114, 96);
				lineTo(64, 170);
				moveTo(17, -95);
				lineTo(-91, -59);
				moveTo(-87, -62);
				lineTo(-68, 11);
				moveTo(17, -95);
				lineTo(89, -34);
				moveTo(86, -36);
				lineTo(162, -66);
				moveTo(16, -116);
				curveTo(-10, -122, -9, -146);
				curveTo(-9, -170, 16, -171);
				curveTo(41, -171, 41, -145);
				curveTo(41, -123, 16, -116);
			}
			KnAnimUd1.height = 12;
			KnAnimUd1.width = 12;
			KnAnimUd1.x = 18;
			KnAnimUd1.y = 435;
			KnAnimUd2.height = 12;
			KnAnimUd2.width = 12;
			KnAnimUd2.x = 23;
			KnAnimUd2.y = 435;
			with (KnAnimUdCherta.graphics) {
				lineStyle(2, 0xFF1111, 1);
				moveTo(18, 2);
				lineTo(2, 18);
			}
			KnAnimUdCherta.x = 10;
			KnAnimUdCherta.y = 426;
			with (UdalAnim.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			UdalAnim.x = 10;
			UdalAnim.y = 426;
			with (KnAnimPl.graphics) {
				lineStyle(10, 0x2F3BDE, 1);
				beginFill(0x16F716, 1);
				moveTo(-89, -115);
				lineTo(-89, 116);
				lineTo(90, 6);
				lineTo(-91, -117);
			}
			KnAnimPl.height = 12;
			KnAnimPl.width = 12;
			KnAnimPl.x = 43;
			KnAnimPl.y = 435;
			with (PlayAnim.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			PlayAnim.x = 31;
			PlayAnim.y = 426;
			with (KnAnimOch.graphics) {
				lineStyle(10, 0x516BF0, 1);
				moveTo(16, -117);
				lineTo(17, 36);
				moveTo(17, 36);
				lineTo(-66, 118);
				moveTo(-62, 116);
				lineTo(-162, 91);
				moveTo(17, 36);
				lineTo(116, 101);
				moveTo(114, 96);
				lineTo(64, 170);
				moveTo(17, -95);
				lineTo(-91, -59);
				moveTo(-87, -62);
				lineTo(-68, 11);
				moveTo(17, -95);
				lineTo(89, -34);
				moveTo(86, -36);
				lineTo(162, -66);
				moveTo(16, -116);
				curveTo(-10, -122, -9, -146);
				curveTo(-9, -170, 16, -171);
				curveTo(41, -171, 41, -145);
				curveTo(41, -123, 16, -116);
			}
			KnAnimOch.height = 12;
			KnAnimOch.width = 12;
			KnAnimOch.x = 19;
			KnAnimOch.y = 456;
			with (KnAnimOchCherta.graphics) {
				lineStyle(2, 0xFF1111, 1);
				moveTo(18, 2);
				lineTo(2, 18);
			}
			KnAnimOchCherta.x = 10;
			KnAnimOchCherta.y = 447;
			with (OchistAnim.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0xE02AC2, 1);
				drawRect(3, 3, 14, 14);
			}
			OchistAnim.x = 10;
			OchistAnim.y = 447;
			with (VivodAnim.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(0.5, 0x000000, 1);
				moveTo(10, 5);
				lineTo(10, 15);
				moveTo(5, 10);
				lineTo(15, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
			}
			VivodAnim.x = 31;
			VivodAnim.y = 447;
			with (NazSohr) {
				height = 25;
				width = 42;
				type = TextFieldType.DYNAMIC;
				selectable = false;
				text = "Сохран";
				setTextFormat(txFormat2);
				x = 10;
				y = 475;
			}
			with (PoleInstrumentov.graphics) {
				lineStyle(2, 0x1510A0, 1);
				drawRoundRect(5, 490, 50, 25, 10);
			}
			with (SohrRis.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			SohrRis.x = 10;
			SohrRis.y = 492;
			SohrRis.addChild(SohrShape0);
			SohrShape0.x = 2;
			SohrShape0.y = 2;
			SohrShape0.addChild(SohrShape1);
			SohrShape0.addChild(SohrShape2);
			SohrShape0.addChild(SohrShape3);
			SohrShape0.addChild(SohrShape4);
			SohrShape0.addChild(SohrShape5);
			with (SohrShape1.graphics) {
				lineStyle(1, 0x1E25EF, 1, linSt5True, linSt6Norm, linSt7None, linSt8Bev, undefined);
				beginFill(0x1E25EF, 1);
				moveTo(-125, -140);
				lineTo(-125, 140);
				lineTo(125, 140);
				lineTo(125, -140);
			}
			SohrShape1.x=125;
			SohrShape1.y=140;
			with (SohrShape2.graphics) {
				lineStyle(1, 0xFCFCFF, 1, linSt5True, linSt6Norm, linSt7None, linSt8Bev, undefined);
				beginFill(0xE7E8FD, 1);
				moveTo(-80, -45);
				lineTo(-80, 45);
				lineTo(80, 45);
				lineTo(80, -45);
			}
			SohrShape2.x=125;
			SohrShape2.y=235;
			with (SohrShape3.graphics) {
				lineStyle(1, 0x040638, 1, linSt5True, linSt6Norm, linSt7None, linSt8Bev, undefined);
				moveTo(-65, -23);
				lineTo(65, -23);
				moveTo(-65, -8);
				lineTo(65, -8);
				moveTo(-65, 7);
				lineTo(65, 7);
				moveTo(-65, 22);
				lineTo(65, 22);
			}
			SohrShape3.x=125;
			SohrShape3.y=238;
			with (SohrShape4.graphics) {
				beginFill(0xC3D0CF, 1);
				moveTo(-90, -40);
				lineTo(-90, 40);
				lineTo(90, 40);
				lineTo(90, -40);
			}
			SohrShape4.x=125;
			SohrShape4.y=40;
			with (SohrShape5.graphics) {
				lineStyle(1, 0x0E1211, 1, linSt5True, linSt6Norm, linSt7None, linSt8Bev, undefined);
				beginFill(0x0E1211, 1);
				moveTo(-13, -40);
				lineTo(-13, 40);
				lineTo(12, 40);
				lineTo(12, -40);
			}
			SohrShape5.x=178;
			SohrShape5.y = 40;
			SohrShape0.height = 15;
			SohrShape0.width = 15;
			with (VostRis.graphics) {
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			VostRis.x = 31;
			VostRis.y = 492;
			VostRis.addChild(VostShape0);
			VostShape0.x = 2;
			VostShape0.y = 2;
			VostShape0.addChild(VostShape1);
			VostShape0.addChild(VostShape2);
			VostShape0.addChild(VostShape3);
			with (VostShape1.graphics) {
				beginFill(0xE743A0, 1);
				moveTo(-85, -95);
				lineTo(-85, 95);
				lineTo(85, 95);
				lineTo(85, -95);
			}
			VostShape1.x=85;
			VostShape1.y=112;
			with (VostShape2.graphics) {
				beginFill(0xCE1A80, 1);
				moveTo(-70, -75);
				lineTo(-105, 75);
				lineTo(65, 75);
				lineTo(105, -75);
			}
			VostShape2.x=105;
			VostShape2.y = 132;
			VostShape0.height = 15;
			VostShape0.width = 15;
			with (VostShape3.graphics) {
				beginFill(0x25C20D, 1);
				moveTo(-87, -7);
				curveTo(-52, -64, -4, -66);
				curveTo(48, -67, 45, 10);
				lineTo(87, -9);
				lineTo(52, 66);
				lineTo(-57, 40);
				lineTo(-5, 19);
				curveTo(-18, -15, -31, -7);
			}
			VostShape3.x=138;
			VostShape3.y = 67;
			with (strochkaPlus.graphics) {
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(7, 3);
				lineTo(7, 11);
				moveTo(3, 7);
				lineTo(11, 7);
			}
			strochkaPlus.x = 1126;
			strochkaPlus.y = 375;
			with (strochkaMinus.graphics) {
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(3, 7);
				lineTo(11, 7);
			}
			strochkaMinus.x = 1144;
			strochkaMinus.y = 375;
			with (stranicaPlus.graphics) {
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(3, 4);
				lineTo(3, 10);
				moveTo(1, 7);
				lineTo(6, 7);
				moveTo(11.5, 4);
				lineTo(11.5, 10);
				moveTo(9, 7);
				lineTo(14, 7);
			}
			stranicaPlus.x = 1162;
			stranicaPlus.y = 375;
			with (stranicaMinus.graphics) {
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(1, 7);
				lineTo(6, 7);
				moveTo(9, 7);
				lineTo(14, 7);
			}
			stranicaMinus.x = 1180;
			stranicaMinus.y = 375;
			/**************************Установка текстовых полей********************************/
			with (NazStyle) {
				height = 25;
				width = 75;
				type = TextFieldType.DYNAMIC;
				selectable = false;
				text = "Стиль линии";
				setTextFormat(txFormat2);
				x = 200;
				y = 5;
			}
			with (PoleInstrumentov.graphics) {
				lineStyle(2, 0x1510A0, 1);
				drawRoundRect(85, 20, 272, 40, 10);
			}
			PiNadp.x = 95;
			PiNadp.y = 20;
			PiNadp.text = "pH";
			with (PiNadp) {
				height = 25;
				width = 65;
				type = TextFieldType.DYNAMIC;
				selectable = false;
			}
			PiNadp.setTextFormat(txFormat2);
			PiH.x = 90;
			PiH.y = 40;
			ScNadp.x = 140;
			ScNadp.y = 20;
			ScNadp.text = "sM";
			with (ScNadp) {
				height = 25;
				width = 65;
				type = TextFieldType.DYNAMIC;
				selectable = false;
			}
			ScNadp.setTextFormat(txFormat2);
			ScMode.x = 125;
			ScMode.y = 40;
			CapsNadp.x = 195;
			CapsNadp.y = 20;
			CapsNadp.text = "cSt";
			with (CapsNadp) {
				height = 25;
				width = 65;
				type = TextFieldType.DYNAMIC;
				selectable = false;
			}
			CapsNadp.setTextFormat(txFormat2);
			CapsSt.x = 185;
			CapsSt.y = 40;
			JointNadp.x = 238;
			JointNadp.y = 20;
			JointNadp.text = "jSt";
			with (JointNadp) {
				height = 25;
				width = 65;
				type = TextFieldType.DYNAMIC;
				selectable = false;
			}
			JointNadp.setTextFormat(txFormat2);
			JointSt.x = 230;
			JointSt.y = 40;
			with (MitLimit) {
				teloNadp.x = 0;
				teloNadp.text = "mL";
				teloNadp.setTextFormat(txFormat2);
				x = 270;
				y = 20;
				telo.text = 3;
				telo.width = 22;
				telo.setTextFormat(txFormat2);
			}
			with (Tolsh) {
				teloNadp.x = 5;
				teloNadp.text = "Т";
				teloNadp.setTextFormat(txFormat2);
				x = 296;
				y = 20;
				telo.width = 27;
				telo.text = 1;
				telo.setTextFormat(txFormat2);
			}
			with (Alfa) {
				teloNadp.x = 5;
				teloNadp.text = "А";
				teloNadp.setTextFormat(txFormat2);
				x = 327;
				y = 20;
				telo.width = 25;
				telo.text = 1;
				telo.setTextFormat(txFormat2);
			}
			with (NazPozic) {
				height = 25;
				width = 50;
				type = TextFieldType.DYNAMIC;
				selectable = false;
				text = "Позиции";
				setTextFormat(txFormat2);
				x = 470;
				y = 5;
			}
			with (PoleInstrumentov.graphics) {
				lineStyle(2, 0x1510A0, 1);
				drawRoundRect(370, 20, 245, 40, 10);
			}
			with (CtrlX) {
				teloNadp.x = 2;
				teloNadp.text = "CtrlX";
				teloNadp.setTextFormat(txFormat2);
				x = 375;
				y = 20;
				telo.width = 35;
				telo.text = 230;
				telo.setTextFormat(txFormat2);
			}
			with (CtrlY) {
				teloNadp.x = 2;
				teloNadp.text = "CtrlY";
				teloNadp.setTextFormat(txFormat2);
				x = 415;
				y = 20;
				telo.width = 35;
				telo.text = 230;
				telo.setTextFormat(txFormat2);
			}
			with (X) {
				teloNadp.x = 10;
				teloNadp.text = "X";
				teloNadp.setTextFormat(txFormat2);
				x = 455;
				y = 20;
				telo.width = 35;
				telo.text = 130;
				telo.setTextFormat(txFormat2);
			}
			with (Y) {
				teloNadp.x = 10;
				teloNadp.text = "Y";
				teloNadp.setTextFormat(txFormat2);
				x = 495;
				y = 20;
				telo.width = 35;
				telo.text = 130;
				telo.setTextFormat(txFormat2);
			}
			with (NomerFormy) {
				teloNadp.x = 4;
				teloNadp.text = "№ Ф";
				teloNadp.setTextFormat(txFormat2);
				x = 535;
				y = 20;
				telo.width = 35;
				telo.text = 0;
				telo.setTextFormat(txFormat2);
			}
			with (Poryadok) {
				teloNadp.x = 5;
				teloNadp.text = "Пор";
				teloNadp.setTextFormat(txFormat2);
				x = 575;
				y = 20;
				telo.width = 35;
				telo.text = 1;
				telo.setTextFormat(txFormat2);
			}
			with (ChisloSek) {
				teloNadp.x = 5;
				teloNadp.text = "Сек";
				teloNadp.setTextFormat(txFormat2);
				x = 10;
				y = 330;
				telo.width = 35;
				telo.text = 1;
				telo.setTextFormat(txFormat2);
			}
			with (NazvRisunka) {
				teloNadp.x = 5;
				teloNadp.text = "Имя";
				teloNadp.setTextFormat(txFormat2);
				x = 10;
				y = 365;
				telo.width = 40;
				telo.text = "risun1";
				telo.setTextFormat(txFormat2);
			}
			with (Out) {
				teloNadp.text = "Исходный код";
				teloNadp.width = 110;
				teloNadp.setTextFormat(txFormat2);
				x = 990;
				y = 375;
				telo.height = 320;
				telo.width = 205;
				telo.setTextFormat(txFormat2);
			}
			ColM.x = 990;
			ColM.teloNadp.setTextFormat(txFormat2);
			ColM.Zalivka.telo.setTextFormat(txFormat2);
			GrFill.x = 990;
			GrFill.y = 235;
			vstavkaForm.addEventListener(MouseEvent.MOUSE_DOWN, vstPress);
			vstavkaForm.addEventListener(MouseEvent.MOUSE_UP, vstRelease);
			lnST.addEventListener(MouseEvent.MOUSE_DOWN, linStPress);
			lnST.addEventListener(MouseEvent.MOUSE_UP, linStRelease);
			bgFL.addEventListener(MouseEvent.MOUSE_DOWN, bgFLPress);
			bgFL.addEventListener(MouseEvent.MOUSE_UP, bgFLRelease);
			bgGrFL.addEventListener(MouseEvent.MOUSE_DOWN, bgGrFlPress);
			bgGrFL.addEventListener(MouseEvent.MOUSE_UP, bgGrFlRelease);
			enFL.addEventListener(MouseEvent.MOUSE_DOWN, edFllPress);
			enFL.addEventListener(MouseEvent.MOUSE_UP, edFllRelease);
			movT.addEventListener(MouseEvent.MOUSE_DOWN, movTPress);
			movT.addEventListener(MouseEvent.MOUSE_UP, movTRelease);
			linT.addEventListener(MouseEvent.MOUSE_DOWN, linTPress);
			linT.addEventListener(MouseEvent.MOUSE_UP, linTRelease);
			curT.addEventListener(MouseEvent.MOUSE_DOWN, curvTPress);
			curT.addEventListener(MouseEvent.MOUSE_UP, curvTRelease);
			udalTochki.addEventListener(MouseEvent.MOUSE_DOWN, udalTochkiPress);
			udalTochki.addEventListener(MouseEvent.MOUSE_UP, udalTochkiRelease);
			udalFormy.addEventListener(MouseEvent.MOUSE_DOWN, udalFormyPress);
			udalFormy.addEventListener(MouseEvent.MOUSE_UP, udalFormyRelease);
			peremeshFormy.addEventListener(MouseEvent.MOUSE_DOWN, perForPress);
			peremeshFormy.addEventListener(MouseEvent.MOUSE_UP, perForRelease);
			peremeshKurs.addEventListener(MouseEvent.MOUSE_DOWN, perKurPress);
			peremeshKurs.addEventListener(MouseEvent.MOUSE_UP, perKurRelease);
			kopirForm.addEventListener(MouseEvent.MOUSE_DOWN, kopirPress);
			kopirForm.addEventListener(MouseEvent.MOUSE_UP, kopirRelease);
			povFormy1.addEventListener(MouseEvent.MOUSE_DOWN, povFormy1Press);
			povFormy1.addEventListener(MouseEvent.MOUSE_UP, povFormy1Release);
			povFormy2.addEventListener(MouseEvent.MOUSE_DOWN, povFormy2Press);
			povFormy2.addEventListener(MouseEvent.MOUSE_UP, povFormy2Release);
			zadPozic.addEventListener(MouseEvent.MOUSE_DOWN, zadPozicPress);
			zadPozic.addEventListener(MouseEvent.MOUSE_UP, zadPozicRelease);
			zadVisible.addEventListener(MouseEvent.MOUSE_DOWN, zadVisiblePress);
			zadVisible.addEventListener(MouseEvent.MOUSE_UP, zadVisibleRelease);
			vvUG.addEventListener(MouseEvent.MOUSE_DOWN, vvUGPress);
			vvUG.addEventListener(MouseEvent.MOUSE_UP, vvUGRelease);
			centr.addEventListener(MouseEvent.MOUSE_DOWN, centrPress);
			centr.addEventListener(MouseEvent.MOUSE_UP, centrRelease);
			SohrRis.addEventListener(MouseEvent.MOUSE_DOWN, SohrRisPress);
			SohrRis.addEventListener(MouseEvent.MOUSE_UP, SohrRisRelease);
			VostRis.addEventListener(MouseEvent.MOUSE_DOWN, VostRisPress);
			VostRis.addEventListener(MouseEvent.MOUSE_UP, VostRisRelease);
			NachAnim.addEventListener(MouseEvent.MOUSE_DOWN, nachAnimPress);
			NachAnim.addEventListener(MouseEvent.MOUSE_UP, nachAnimRelease);
			VstAnim.addEventListener(MouseEvent.MOUSE_DOWN, vstAnimPress);
			VstAnim.addEventListener(MouseEvent.MOUSE_UP, vstAnimRelease);
			UdalAnim.addEventListener(MouseEvent.MOUSE_DOWN, udAnimPress);
			UdalAnim.addEventListener(MouseEvent.MOUSE_UP, udAnimRelease);
			PlayAnim.addEventListener(MouseEvent.MOUSE_DOWN, plAnimPress);
			PlayAnim.addEventListener(MouseEvent.MOUSE_UP, plAnimRelease);
			OchistAnim.addEventListener(MouseEvent.MOUSE_DOWN, ochAnimPress);
			OchistAnim.addEventListener(MouseEvent.MOUSE_UP, ochAnimRelease);
			VivodAnim.addEventListener(MouseEvent.MOUSE_DOWN, vivAnimPress);
			VivodAnim.addEventListener(MouseEvent.MOUSE_UP, vivAnimRelease);
			strochkaPlus.addEventListener(MouseEvent.MOUSE_DOWN, strochPlusPress);
			strochkaPlus.addEventListener(MouseEvent.MOUSE_UP, strochPlusRelease);
			strochkaMinus.addEventListener(MouseEvent.MOUSE_DOWN, strochMinusPress);
			strochkaMinus.addEventListener(MouseEvent.MOUSE_UP, strochMinusRelease);
			stranicaPlus.addEventListener(MouseEvent.MOUSE_DOWN, stranPlusPress);
			stranicaPlus.addEventListener(MouseEvent.MOUSE_UP, stranPlusRelease);
			stranicaMinus.addEventListener(MouseEvent.MOUSE_DOWN, stranMinusPress);
			stranicaMinus.addEventListener(MouseEvent.MOUSE_UP, stranMinusRelease);
			Risunok.addEventListener(Event.ENTER_FRAME, entFrame);
			addChild(Risunok);
			addChild(PoleInstrumentov);
			PoleInstrumentov.addChild(NazInstr);
			PoleInstrumentov.addChild(vstavkaForm);
			PoleInstrumentov.addChild(lnST);
			PoleInstrumentov.addChild(bgFL);
			PoleInstrumentov.addChild(bgGrFL);
			PoleInstrumentov.addChild(enFL);
			PoleInstrumentov.addChild(movT);
			PoleInstrumentov.addChild(linT);
			PoleInstrumentov.addChild(curT);
			PoleInstrumentov.addChild(NazRedakt);
			PoleInstrumentov.addChild(udalTochki);
			PoleInstrumentov.addChild(udalFormy);
			PoleInstrumentov.addChild(peremeshFormy);
			PoleInstrumentov.addChild(kopirForm);
			PoleInstrumentov.addChild(nomKopir);
			PoleInstrumentov.addChild(NadpKopir);
			PoleInstrumentov.addChild(povFormy1);
			PoleInstrumentov.addChild(povFormy2);
			PoleInstrumentov.addChild(zadPozic);
			PoleInstrumentov.addChild(zadVisible);
			PoleInstrumentov.addChild(TabloRot);
			PoleInstrumentov.addChild(NazVivod);
			PoleInstrumentov.addChild(vvUG);
			PoleInstrumentov.addChild(centr);
			PoleInstrumentov.addChild(NazStyle);
			PoleInstrumentov.addChild(PiNadp);
			PoleInstrumentov.addChild(PiH);
			PoleInstrumentov.addChild(ScNadp);
			PoleInstrumentov.addChild(ScMode);
			PoleInstrumentov.addChild(CapsNadp);
			PoleInstrumentov.addChild(CapsSt);
			PoleInstrumentov.addChild(JointNadp);
			PoleInstrumentov.addChild(JointSt);
			PoleInstrumentov.addChild(MitLimit);
			PoleInstrumentov.addChild(Tolsh);
			PoleInstrumentov.addChild(Alfa);
			PoleInstrumentov.addChild(NazPozic);
			PoleInstrumentov.addChild(CtrlX);
			PoleInstrumentov.addChild(CtrlY);
			PoleInstrumentov.addChild(X);
			PoleInstrumentov.addChild(Y);
			PoleInstrumentov.addChild(NomerFormy);
			PoleInstrumentov.addChild(Poryadok);
			PoleInstrumentov.addChild(NazAnim);
			PoleInstrumentov.addChild(ChisloSek);
			PoleInstrumentov.addChild(NazvRisunka);
			PoleInstrumentov.addChild(NachAnim);
			PoleInstrumentov.addChild(KnAnimNach);
			PoleInstrumentov.addChild(VstAnim);
			PoleInstrumentov.addChild(KnAnimVst1);
			PoleInstrumentov.addChild(KnAnimVst2);
			PoleInstrumentov.addChild(UdalAnim);
			PoleInstrumentov.addChild(KnAnimUd1);
			PoleInstrumentov.addChild(KnAnimUd2);
			PoleInstrumentov.addChild(KnAnimUdCherta);
			PoleInstrumentov.addChild(PlayAnim);
			PoleInstrumentov.addChild(KnAnimPl);
			PoleInstrumentov.addChild(OchistAnim);
			PoleInstrumentov.addChild(KnAnimOch);
			PoleInstrumentov.addChild(KnAnimOchCherta);
			PoleInstrumentov.addChild(VivodAnim);
			PoleInstrumentov.addChild(NazSohr);
			PoleInstrumentov.addChild(SohrRis);
			PoleInstrumentov.addChild(VostRis);
			PoleInstrumentov.addChild(ColM);
			PoleInstrumentov.addChild(GrFill);
			PoleInstrumentov.addChild(Out);
			PoleInstrumentov.addChild(strochkaPlus);
			PoleInstrumentov.addChild(strochkaMinus);
			PoleInstrumentov.addChild(stranicaPlus);
			PoleInstrumentov.addChild(stranicaMinus);
			PoleInstrumentov.addChild(peremeshKurs);
		}
		internal function vstavkaTochek():void {
			perPeremesh = 0;
			peremeshKurs.x = -1000;
			tekNomFormy = int(NomerFormy.telo.text);
			tekPoryadok = int(Poryadok.telo.text);
			//В случае когда последняя точка - кривая, порядок соответствует точке кривой, а не контрольной точке.
			//Во избежании срабатывания вставки в середину
			if (forms[tekNomFormy][tekPoryadok -1] != undefined) {
				if (tekPoryadok + 1 == forms[tekNomFormy].length && forms[tekNomFormy][tekPoryadok -1][0]=="curvT") {
					tekPoryadok += 1;
				}
			}
			//Вставка точки в конец массива + исправление возможных ошибок
			if (tekPoryadok == forms[tekNomFormy].length || tekPoryadok < 0 || tekPoryadok == 0 || tekPoryadok > forms[tekNomFormy].length) {
				tekPoryadok = forms[tekNomFormy].length;
			}
			//Вставка в середину массива
			if (tekPoryadok < forms[tekNomFormy].length) {
				//В случае, если порядок совпадает с контрольной точкой кривой
				if (forms[tekNomFormy][tekPoryadok - 1][0] == "contrl") {
					tekPoryadok -= 1;
				}
				//В случае, если вставляется кривая линия
				if (knopCurv == 1) {
					for (var i:int = forms[tekNomFormy].length - 1; i > tekPoryadok - 2; i--) {
					forms[tekNomFormy][i + 2] = forms[tekNomFormy][i];
					forms[tekNomFormy][i] = undefined;
					}
				}else{
					for (i = forms[tekNomFormy].length - 1; i > tekPoryadok - 2; i--) {
						forms[tekNomFormy][i + 1] = forms[tekNomFormy][i];
						forms[tekNomFormy][i] = undefined;
					}
				}
				tekPoryadok -= 1;
				izmPoryadka = 1;
			}
		}
		internal function udalenieTochki():void {
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				if (int(NomerFormy.telo.text)>forms.length - 1) {
					NomerFormy.telo.text = forms.length - 1;
				}
				if (int(NomerFormy.telo.text) < 0) {
					NomerFormy.telo.text = 0;
				}
				tekNomFormy = int(NomerFormy.telo.text);
				if (int(Poryadok.telo.text) > forms[tekNomFormy].length) {
					Poryadok.telo.text = forms[tekNomFormy].length;
				}
				if (int(Poryadok.telo.text) <2) {
					Poryadok.telo.text = 2;
				}
				tekPoryadok = int(Poryadok.telo.text);
				if (forms[tekNomFormy][tekPoryadok - 1][0] == "contrl") {
					tekPoryadok -= 1;
				}
				Poryadok.telo.text = tekPoryadok;
				Poryadok.telo.setTextFormat(txFormat2);
				vosstTochek();
				vosstanovlenie = 0;
				if (forms[tekNomFormy][tekPoryadok - 1][0] == "curvT") {
					forms[tekNomFormy][tekPoryadok - 1][1].removeEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
					forms[tekNomFormy][tekPoryadok - 1][1].removeEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
					forms[tekNomFormy][tekPoryadok - 1][2].removeEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
					forms[tekNomFormy][tekPoryadok - 1][2].removeEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
					forms[tekNomFormy][tekPoryadok - 1][1].graphics.clear();
					forms[tekNomFormy][tekPoryadok - 1][2].graphics.clear();
					udTochki.push(forms[tekNomFormy][tekPoryadok - 1][1]);
					udTochki.push(forms[tekNomFormy][tekPoryadok - 1][2]);
					forms[tekNomFormy][0].removeChild(forms[tekNomFormy][tekPoryadok - 1][1]);
					forms[tekNomFormy][0].removeChild(forms[tekNomFormy][tekPoryadok - 1][2]);
					forms[tekNomFormy][tekPoryadok - 1].length = 0;
					forms[tekNomFormy][tekPoryadok].length = 0;
					udMassivy.push(forms[tekNomFormy][tekPoryadok - 1]);
					udMassivy.push(forms[tekNomFormy][tekPoryadok]);
					forms[tekNomFormy][tekPoryadok - 1] = undefined;
					forms[tekNomFormy][tekPoryadok] = undefined;
					knopCurv = 1;
				}else {
					if (forms[tekNomFormy][tekPoryadok - 1][0] == "bgGrFl") {
						forms[tekNomFormy][tekPoryadok - 1][3].length = 0;
						forms[tekNomFormy][tekPoryadok - 1][4].length = 0;
						forms[tekNomFormy][tekPoryadok - 1][5].length = 0;
						udMassivy.push(forms[tekNomFormy][tekPoryadok - 1][3]);
						udMassivy.push(forms[tekNomFormy][tekPoryadok - 1][4]);
						udMassivy.push(forms[tekNomFormy][tekPoryadok - 1][5]);
					}
					forms[tekNomFormy][tekPoryadok - 1][1].removeEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
					forms[tekNomFormy][tekPoryadok - 1][1].removeEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
					forms[tekNomFormy][tekPoryadok - 1][1].graphics.clear();
					udTochki.push(forms[tekNomFormy][tekPoryadok - 1][1]);
					forms[tekNomFormy][0].removeChild(forms[tekNomFormy][tekPoryadok - 1][1]);
					forms[tekNomFormy][tekPoryadok - 1].length = 0;
					udMassivy.push(forms[tekNomFormy][tekPoryadok - 1]);
					forms[tekNomFormy][tekPoryadok - 1] = undefined;
				}
				for (var i:int = tekPoryadok - 1; i < forms[tekNomFormy].length - 1; i++) {
					if (knopCurv == 1) {
						forms[tekNomFormy][i] = forms[tekNomFormy][i + 2];
					}else{
						forms[tekNomFormy][i] = forms[tekNomFormy][i + 1];
					}
				}
				if (knopCurv == 1) {
					forms[tekNomFormy].length -= 2;
					tekPoryadok -= 2;
				}else{
					forms[tekNomFormy].length -= 1;
					tekPoryadok -= 1;
				}
				knopCurv = 0;
				risovanie();
			}
		}
		internal function udalenieFormy():void {
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				tekNomFormy = int(NomerFormy.telo.text);
				if (tekNomFormy < 0) {
					NomerFormy.telo.text = 0;
					NomerFormy.telo.setTextFormat(txFormat2);
				}
				if (tekNomFormy > forms.length - 1 && tekNomFormy != 0) {
					NomerFormy.telo.text = forms.length-1;
					NomerFormy.telo.setTextFormat(txFormat2);
				}
				tekNomFormy = int(NomerFormy.telo.text);
				//dlinaFormy необходима, чтобы условие не глючило.
				dlinaFormy = forms[tekNomFormy].length;
				for (var i:int = 1; i <dlinaFormy ; i++) {
					if (forms[tekNomFormy][i][0] == "linSt" || forms[tekNomFormy][i][0] == "bgFl" || forms[tekNomFormy][i][0] == "bgGrFl" || forms[tekNomFormy][i][0] == "movT" || forms[tekNomFormy][i][0] == "linT" || forms[tekNomFormy][i][0] == "endFl") {
						forms[tekNomFormy][i][1].removeEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
						forms[tekNomFormy][i][1].removeEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
						forms[tekNomFormy][i][1].graphics.clear();
						udTochki.push(forms[tekNomFormy][i][1]);
						forms[tekNomFormy][0].removeChild(forms[tekNomFormy][i][1]);
						forms[tekNomFormy][i][1] = undefined;
						forms[tekNomFormy][i].length = 0;
						udMassivy.push(forms[tekNomFormy][i]);
					}
					if (forms[tekNomFormy][i][0] == "curvT") {
						forms[tekNomFormy][i][1].removeEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
						forms[tekNomFormy][i][1].removeEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
						forms[tekNomFormy][i][2].removeEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
						forms[tekNomFormy][i][2].removeEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
						forms[tekNomFormy][i][1].graphics.clear();
						forms[tekNomFormy][i][2].graphics.clear();
						udTochki.push(forms[tekNomFormy][i][1]);
						udTochki.push(forms[tekNomFormy][i][2]);
						forms[tekNomFormy][0].removeChild(forms[tekNomFormy][i][1]);
						forms[tekNomFormy][0].removeChild(forms[tekNomFormy][i][2]);
						forms[tekNomFormy][i].length = 0;
						forms[tekNomFormy][i+1].length = 0;
						udMassivy.push(forms[tekNomFormy][i]);
						udMassivy.push(forms[tekNomFormy][i + 1]);
					}
				}
				forms[tekNomFormy][0].graphics.clear();
				Risunok.removeChild(forms[tekNomFormy][0]);
				udTochki.push(forms[tekNomFormy][0]);
				forms[tekNomFormy][0] = undefined;
				forms[tekNomFormy].length = 0;
				if(formsGrBox[tekNomFormy]!=undefined){
					formsGrBox[tekNomFormy].length = 0;
					udMassivy.push(formsGrBox[tekNomFormy]);
				}
				udMassivy.push(forms[tekNomFormy]);
				for (var j:int = tekNomFormy; j < forms.length - 1; j++) {
					forms[j] = forms[j + 1];
					formsX0[j] = formsX0[j + 1];
					formsY0[j] = formsY0[j + 1];
					formsIsxKod[j] = formsIsxKod[j + 1];
					formsGrBox[j] = formsGrBox[j + 1];
				}
				forms.length -= 1;
				formsX0.length -= 1;
				formsY0.length -= 1;
				formsIsxKod.length -= 1;
				formsGrBox.length -= 1;
				nomKopir.text = forms.length;
				nomKopir.setTextFormat(txFormat2);
			}
			if(animPer==0){
				Out.telo.text = "";
				for (j = 0; j < forms.length; j++) {
					Out.telo.appendText("Форма" + " " + j + "\n" + formsIsxKod[j] + "\n");
				}
				Out.telo.setTextFormat(txFormat2);
			}
		}
		internal function vstPress(e:MouseEvent):void {
			with (vstavkaForm.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(2, 0, 18, 18, 10);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
			}
			perPeremesh = 0;
			peremeshKurs.x = -1000;
			if (int(NomerFormy.telo.text)>forms.length - 1) {
				NomerFormy.telo.text = forms.length - 1;
			}
			if (int(NomerFormy.telo.text) < 0) {
				NomerFormy.telo.text = 0;
			}
			tekNomFormy = int(NomerFormy.telo.text);
			nomKopir.text = forms.length + 1;
			nomKopir.setTextFormat(txFormat2);
			if (forms[tekNomFormy] == undefined || forms[tekNomFormy] == null || tekNomFormy + 1 == forms.length) {
				if (udMassivy.length > 0) {
					forms[forms.length] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					forms[forms.length] = new Array();
				}
				if (udTochki.length > 0) {
					forms[forms.length - 1][0] = udTochki[udTochki.length - 1];
					udTochki.length -= 1;
				}else {
					forms[forms.length - 1][0] = new Sprite();
				}
				Risunok.addChild(forms[forms.length - 1][0]);
				NomerFormy.telo.text = forms.length - 1;
				NomerFormy.telo.setTextFormat(txFormat2);
			}else {
				for (var i:int = forms.length - 1; i >= tekNomFormy; i--) {
					forms[i + 1] = forms[i];
					formsX0[i + 1] = formsX0[i];
					formsY0[i + 1] = formsY0[i];
					formsIsxKod[i + 1] = formsIsxKod[i];
					formsGrBox[i + 1] = formsGrBox[i];
				}
				if (udMassivy.length > 0) {
					forms[tekNomFormy] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					forms[tekNomFormy] = new Array();
				}
				if (udTochki.length > 0) {
					forms[tekNomFormy][0] = udTochki[udTochki.length - 1];
					udTochki.length -= 1;
				}else {
					forms[tekNomFormy][0] = new Sprite();
				}
				Risunok.addChild(forms[tekNomFormy][0]);
				Risunok.setChildIndex(forms[tekNomFormy][0], tekNomFormy);
				NomerFormy.telo.text = tekNomFormy;
				NomerFormy.telo.setTextFormat(txFormat2);
			}
		}
		internal function vstRelease(e:MouseEvent):void {
			with (vstavkaForm.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
			}
		}
		internal function linStPress(e:MouseEvent):void {
			with (lnST.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(2, 0, 18, 18, 10);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 5);
				lineTo(4, 13);
				lineTo(8, 13);
				moveTo(16, 5);
				lineTo(12, 5);
				lineTo(12, 9);
				lineTo(16, 9);
				lineTo(16, 13);
				lineTo(12, 13);
			}
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				vosstTochek();
				vosstanovlenie = 0;
				vstavkaTochek();
				if (udMassivy.length > 0) {
					forms[tekNomFormy][tekPoryadok] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok] = new Array();
				}
				if (udTochki.length > 0) {
					forms[tekNomFormy][tekPoryadok][1] = udTochki[udTochki.length - 1];
					udTochki.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok][1] = new Sprite();
				}
				forms[tekNomFormy][tekPoryadok][0] = "linSt";
				forms[tekNomFormy][tekPoryadok][2] = Tolsh.telo.text;
				forms[tekNomFormy][tekPoryadok][3] = "0x"+ColM.cvet;
				forms[tekNomFormy][tekPoryadok][4] = Alfa.telo.text;
				forms[tekNomFormy][tekPoryadok][5] = false;
				if (PiH.nadpis.text == "true") {
					forms[tekNomFormy][tekPoryadok][5] = true;
				}
				forms[tekNomFormy][tekPoryadok][6] = LineScaleMode.NORMAL;
				if (ScMode.nadpis.text == "none") {
					forms[tekNomFormy][tekPoryadok][6] = LineScaleMode.NONE;
				}
				if (ScMode.nadpis.text == "vertical") {
					forms[tekNomFormy][tekPoryadok][6] = LineScaleMode.VERTICAL;
				}
				if (ScMode.nadpis.text == "horizontal") {
					forms[tekNomFormy][tekPoryadok][6] = LineScaleMode.HORIZONTAL;
				}
				forms[tekNomFormy][tekPoryadok][7] = CapsStyle.ROUND;
				if (CapsSt.nadpis.text == "none") {
					forms[tekNomFormy][tekPoryadok][7] = CapsStyle.NONE;
				}
				if (CapsSt.nadpis.text == "square") {
					forms[tekNomFormy][tekPoryadok][7] = CapsStyle.SQUARE;
				}
				forms[tekNomFormy][tekPoryadok][8] = JointStyle.ROUND;
				if (JointSt.nadpis.text == "bevel") {
					forms[tekNomFormy][tekPoryadok][8] = JointStyle.BEVEL;
				}
				if (JointSt.nadpis.text == "miter") {
					forms[tekNomFormy][tekPoryadok][8] = JointStyle.MITER;
					forms[tekNomFormy][tekPoryadok][9] = Number(MitLimit.telo.text);
				}
				forms[tekNomFormy][0].addChild(forms[tekNomFormy][tekPoryadok][1]);
				if (izmPoryadka == 1) {
					forms[tekNomFormy][0].setChildIndex(forms[tekNomFormy][tekPoryadok][1], tekPoryadok - 1);
					izmPoryadka = 0;
				}
				Poryadok.telo.text = tekPoryadok+1;
				Poryadok.telo.setTextFormat(txFormat2);
				risovanie();
			}
		}
		internal function linStRelease(e:MouseEvent):void {
			with (lnST.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 5);
				lineTo(4, 13);
				lineTo(8, 13);
				moveTo(16, 5);
				lineTo(12, 5);
				lineTo(12, 9);
				lineTo(16, 9);
				lineTo(16, 13);
				lineTo(12, 13);
			}
		}
		internal function bgFLPress(e:MouseEvent):void {
			with (bgFL.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(2, 0, 18, 18, 10);
				beginFill(0xE7165A, 1);
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				vosstTochek();
				vosstanovlenie = 0;
				vstavkaTochek();
				if (udMassivy.length > 0) {
					forms[tekNomFormy][tekPoryadok] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok] = new Array();
				}
				if (udTochki.length > 0) {
					forms[tekNomFormy][tekPoryadok][1] = udTochki[udTochki.length - 1];
					udTochki.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok][1] = new Sprite();
				}
				forms[tekNomFormy][tekPoryadok][0] = "bgFl";
				forms[tekNomFormy][tekPoryadok][2] = "0x" + ColM.Zalivka.telo.text;
				forms[tekNomFormy][tekPoryadok][3] = Alfa.telo.text;
				forms[tekNomFormy][0].addChild(forms[tekNomFormy][tekPoryadok][1]);
				if (izmPoryadka == 1) {
					forms[tekNomFormy][0].setChildIndex(forms[tekNomFormy][tekPoryadok][1], tekPoryadok - 1);
					izmPoryadka = 0;
				}
				Poryadok.telo.text = tekPoryadok+1;
				Poryadok.telo.setTextFormat(txFormat2);
				risovanie();
			}
		}
		internal function bgFLRelease(e:MouseEvent):void {
			with (bgFL.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				beginFill(0xE7165A, 1);
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
				endFill();
			}
		}
		internal function bgGrFlPress(e:MouseEvent):void {
			with (bgGrFL.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				beginFill(0xFF1111, 1);
				lineStyle(2, 0x1510A0, 0);
				drawRect(3, 3, 7, 14);
				beginFill(0x52CB01, 1);
				drawRect(10, 3, 7, 14);
				endFill();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				vosstTochek();
				vosstanovlenie = 0;
				vstavkaTochek();
				if (udMassivy.length > 0) {
					forms[tekNomFormy][tekPoryadok] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok] = new Array();
				}
				if (udTochki.length > 0) {
					forms[tekNomFormy][tekPoryadok][1] = udTochki[udTochki.length - 1];
					udTochki.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok][1] = new Sprite();
				}
				forms[tekNomFormy][tekPoryadok][0] = "bgGrFl";
				forms[tekNomFormy][tekPoryadok][2] = GrFill.types;
				forms[tekNomFormy][tekPoryadok][3] = GrFill.colors.slice(0, GrFill.colors.length);
				forms[tekNomFormy][tekPoryadok][4] = GrFill.alfas.slice(0, GrFill.alfas.length);
				forms[tekNomFormy][tekPoryadok][5] = GrFill.ratios.slice(0, GrFill.ratios.length);
				forms[tekNomFormy][tekPoryadok][6] = GrFill.matrixes;
				if (udMassivy.length > 0) {
					formsGrBox[tekNomFormy] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					formsGrBox[tekNomFormy] = new Array();
				}
				formsGrBox[tekNomFormy][0] = GrFill.TabloM1.text; 
				formsGrBox[tekNomFormy][1] = GrFill.TabloM2.text; 
				formsGrBox[tekNomFormy][2] = GrFill.TabloM3.text; 
				formsGrBox[tekNomFormy][3] = GrFill.TabloM4.text; 
				formsGrBox[tekNomFormy][4] = GrFill.TabloM5.text;
				forms[tekNomFormy][tekPoryadok][7] = GrFill.spMes;
				forms[tekNomFormy][tekPoryadok][8] = GrFill.intMes;
				forms[tekNomFormy][tekPoryadok][9] = GrFill.fPes;
				forms[tekNomFormy][0].addChild(forms[tekNomFormy][tekPoryadok][1]);
				if (izmPoryadka == 1) {
					forms[tekNomFormy][0].setChildIndex(forms[tekNomFormy][tekPoryadok][1], tekPoryadok - 1);
					izmPoryadka = 0;
				}
				Poryadok.telo.text = tekPoryadok+1;
				Poryadok.telo.setTextFormat(txFormat2);
				risovanie();
			}
		}
		internal function bgGrFlRelease(e:MouseEvent):void {
			with (bgGrFL.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				beginFill(0xFF1111, 1);
				lineStyle(2, 0x1510A0, 0);
				drawRect(3, 3, 7, 14);
				beginFill(0x52CB01, 1);
				drawRect(10, 3, 7, 14);
				endFill();
			}
		}
		internal function edFllPress(e:MouseEvent):void {
			with (enFL.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				beginFill(0xE7165A, 1);
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
				endFill();
				lineStyle(2, 0xFF1111, 1);
				moveTo(18, 2);
				lineTo(2, 18);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				vosstTochek();
				vosstanovlenie = 0;
				vstavkaTochek();
				if (udMassivy.length > 0) {
					forms[tekNomFormy][tekPoryadok] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok] = new Array();
				}
				if (udTochki.length > 0) {
					forms[tekNomFormy][tekPoryadok][1] = udTochki[udTochki.length - 1];
					udTochki.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok][1] = new Sprite();
				}
				forms[tekNomFormy][tekPoryadok][0] = "endFl";
				forms[tekNomFormy][0].addChild(forms[tekNomFormy][tekPoryadok][1]);
				if (izmPoryadka == 1) {
					forms[tekNomFormy][0].setChildIndex(forms[tekNomFormy][tekPoryadok][1], tekPoryadok - 1);
					izmPoryadka = 0;
				}
				Poryadok.telo.text = tekPoryadok+1;
				Poryadok.telo.setTextFormat(txFormat2);
				risovanie();
			}
		}
		internal function edFllRelease(e:MouseEvent):void {
			with (enFL.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				beginFill(0xE7165A, 1);
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
				endFill();
				lineStyle(2, 0xFF1111, 1);
				moveTo(18, 2);
				lineTo(2, 18);
			}
		}
		internal function movTPress(e:MouseEvent):void {
			with (movT.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 10);
				lineTo(16, 10);
				moveTo(10, 4);
				lineTo(10, 16);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				vstavkaTochek();
				vosstTochek();
				vosstanovlenie = 0;
				if (udMassivy.length > 0) {
					forms[tekNomFormy][tekPoryadok] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok] = new Array();
				}
				if (udTochki.length > 0) {
					forms[tekNomFormy][tekPoryadok][1] = udTochki[udTochki.length - 1];
					udTochki.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok][1] = new Sprite();
				}
				forms[tekNomFormy][tekPoryadok][0] = "movT";
				with(forms[tekNomFormy][tekPoryadok][1].graphics){
					lineStyle(2, 0x004080, 1);
					moveTo(0, -2);
					lineTo(0, 2);
					moveTo(-2, 0);
					lineTo(2, 0);
					lineStyle(2, 0x004080, 0);
					beginFill(0x000000, 0);
					moveTo(-2, -2);
					lineTo(2, -2);
					lineTo(2, 2);
					lineTo( -2, 2);
					endFill();
				}
				forms[tekNomFormy][0].addChild(forms[tekNomFormy][tekPoryadok][1]);
				forms[tekNomFormy][tekPoryadok][1].x = Number(X.telo.text)+10;
				forms[tekNomFormy][tekPoryadok][1].y = Number(Y.telo.text)+10;
				forms[tekNomFormy][tekPoryadok][1].addEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
				forms[tekNomFormy][tekPoryadok][1].addEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
				if (izmPoryadka == 1) {
					forms[tekNomFormy][0].setChildIndex(forms[tekNomFormy][tekPoryadok][1], tekPoryadok - 1);
					izmPoryadka = 0;
				}
				Poryadok.telo.text = tekPoryadok+1;
				Poryadok.telo.setTextFormat(txFormat2);
				risovanie();
			}
		}
		internal function movTRelease(e:MouseEvent):void {
			with (movT.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 10);
				lineTo(16, 10);
				moveTo(10, 4);
				lineTo(10, 16);
			}
		}
		internal function linTPress(e:MouseEvent):void {
			with (linT.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 16);
				lineTo(16, 4);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				vstavkaTochek();
				vosstTochek();
				vosstanovlenie = 0;
				if (udMassivy.length > 0) {
					forms[tekNomFormy][tekPoryadok] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok] = new Array();
				}
				if (udTochki.length > 0) {
					trace(forms[tekNomFormy][tekPoryadok]);
					forms[tekNomFormy][tekPoryadok][1] = udTochki[udTochki.length - 1];
					udTochki.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok][1] = new Sprite();
				}
				forms[tekNomFormy][tekPoryadok][0] = "linT";
				with(forms[tekNomFormy][tekPoryadok][1].graphics){
					lineStyle(2, 0x2B9411, 1);
					moveTo(0, -2);
					lineTo(0, 2);
					moveTo(-2, 0);
					lineTo(2, 0);
					lineStyle(2, 0x004080, 0);
					beginFill(0x000000, 0);
					moveTo(-2, -2);
					lineTo(2, -2);
					lineTo(2, 2);
					lineTo( -2, 2);
					endFill();
				}
				forms[tekNomFormy][0].addChild(forms[tekNomFormy][tekPoryadok][1]);
				forms[tekNomFormy][tekPoryadok][1].x = Number(X.telo.text) + 10;
				forms[tekNomFormy][tekPoryadok][1].y = Number(Y.telo.text) + 10;
				forms[tekNomFormy][tekPoryadok][1].addEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
				forms[tekNomFormy][tekPoryadok][1].addEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
				if (izmPoryadka == 1) {
					forms[tekNomFormy][0].setChildIndex(forms[tekNomFormy][tekPoryadok][1], tekPoryadok - 1);
					izmPoryadka = 0;
				}
				Poryadok.telo.text = tekPoryadok+1;
				Poryadok.telo.setTextFormat(txFormat2);
				risovanie();
			}
		}
		internal function linTRelease(e:MouseEvent):void {
			with (linT.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 16);
				lineTo(16, 4);
			}
		}
		internal function curvTPress(e:MouseEvent):void {
			with (curT.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 16);
				curveTo(2, 3, 16, 4);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				knopCurv = 1;
				vstavkaTochek();
				vosstTochek();
				vosstanovlenie = 0;
				if (udMassivy.length > 0) {
					forms[tekNomFormy][tekPoryadok] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok] = new Array();
				}
				if (udTochki.length > 0) {
					forms[tekNomFormy][tekPoryadok][1] = udTochki[udTochki.length - 1];
					udTochki.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok][1] = new Sprite();
				}
				if (udMassivy.length > 0) {
					forms[tekNomFormy][tekPoryadok+1] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok+1] = new Array();
				}
				if (udTochki.length > 0) {
					forms[tekNomFormy][tekPoryadok][2] = udTochki[udTochki.length - 1];
					udTochki.length -= 1;
				}else {
					forms[tekNomFormy][tekPoryadok][2] = new Sprite();
				}
				forms[tekNomFormy][tekPoryadok][0] = "curvT";
				forms[tekNomFormy][tekPoryadok+1][0] = "contrl";
				with(forms[tekNomFormy][tekPoryadok][1].graphics){
					lineStyle(2, 0xB411D4, 1);
					moveTo(0, -2);
					lineTo(0, 2);
					moveTo(-2, 0);
					lineTo(2, 0);
					lineStyle(2, 0x004080, 0);
					beginFill(0x000000, 0);
					moveTo(-2, -2);
					lineTo(2, -2);
					lineTo(2, 2);
					lineTo( -2, 2);
					endFill();
				}
				with(forms[tekNomFormy][tekPoryadok][2].graphics){
					lineStyle(2, 0xFF1212, 100);
					moveTo(0, -2);
					lineTo(0, 2);
					moveTo(-2, 0);
					lineTo(2, 0);
					lineStyle(2, 0x004080, 0);
					beginFill(0x000000, 0);
					moveTo(-2, -2);
					lineTo(2, -2);
					lineTo(2, 2);
					lineTo( -2, 2);
					endFill();
				}
				forms[tekNomFormy][tekPoryadok][1].x = Number(X.telo.text)+10;
				forms[tekNomFormy][tekPoryadok][1].y = Number(Y.telo.text)+10;
				forms[tekNomFormy][tekPoryadok][2].x = Number(CtrlX.telo.text)+10;
				forms[tekNomFormy][tekPoryadok][2].y = Number(CtrlY.telo.text)+10;
				forms[tekNomFormy][0].addChild(forms[tekNomFormy][tekPoryadok][1]);
				forms[tekNomFormy][0].addChild(forms[tekNomFormy][tekPoryadok][2]);
				forms[tekNomFormy][tekPoryadok][1].addEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
				forms[tekNomFormy][tekPoryadok][1].addEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
				forms[tekNomFormy][tekPoryadok][2].addEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
				forms[tekNomFormy][tekPoryadok][2].addEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
				if (izmPoryadka == 1) {
					forms[tekNomFormy][0].setChildIndex(forms[tekNomFormy][tekPoryadok][1], tekPoryadok - 1);
					forms[tekNomFormy][0].setChildIndex(forms[tekNomFormy][tekPoryadok][2], tekPoryadok);
					izmPoryadka = 0;
				}
				Poryadok.telo.text = tekPoryadok+2;
				Poryadok.telo.setTextFormat(txFormat2);
				knopCurv = 0;
				risovanie();
			}
		}
		internal function curvTRelease(e:MouseEvent):void {
			with (curT.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 16);
				curveTo(2, 3, 16, 4);
			}
		}
		internal function udalTochkiPress(e:MouseEvent):void {
			with (udalTochki.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 10);
				lineTo(16, 10);
				moveTo(10, 4);
				lineTo(10, 16);
				lineStyle(2, 0xFF1111, 1);
				moveTo(18, 2);
				lineTo(2, 18);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			udalenieTochki();
		}
		internal function udalTochkiRelease(e:MouseEvent):void {
			with (udalTochki.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 10);
				lineTo(16, 10);
				moveTo(10, 4);
				lineTo(10, 16);
				lineStyle(2, 0xFF1111, 1);
				moveTo(18, 2);
				lineTo(2, 18);
			}
		}
		internal function udalFormyPress(e:MouseEvent):void {
			with (udalFormy.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
				lineStyle(2, 0xFF1111, 1);
				moveTo(18, 2);
				lineTo(2, 18);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			udalenieFormy();
		}
		internal function udalFormyRelease(e:MouseEvent):void {
			with (udalFormy.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
				lineStyle(2, 0xFF1111, 1);
				moveTo(18, 2);
				lineTo(2, 18);
			}
		}
		internal function perForPress(e:MouseEvent):void {
			with (peremeshFormy.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 10);
				lineTo(16, 10);
				moveTo(10, 4);
				lineTo(10, 16);
				moveTo(6, 12);
				lineTo(4, 10);
				moveTo(4, 10);
				lineTo(6, 8);
				moveTo(14, 8);
				lineTo(16, 10);
				moveTo(16, 10);
				lineTo(14, 12);
				moveTo(8, 6);
				lineTo(10, 4);
				moveTo(10, 4);
				lineTo(12, 6);
				moveTo(8, 14);
				lineTo(10, 16);
				moveTo(10, 16);
				lineTo(12, 14);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				peremeshKurs.x = formsX0[tekNomFormy];
				peremeshKurs.y = formsY0[tekNomFormy];
			}
		}
		internal function perForRelease(e:MouseEvent):void {
			with (peremeshFormy.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(4, 10);
				lineTo(16, 10);
				moveTo(10, 4);
				lineTo(10, 16);
				moveTo(6, 12);
				lineTo(4, 10);
				moveTo(4, 10);
				lineTo(6, 8);
				moveTo(14, 8);
				lineTo(16, 10);
				moveTo(16, 10);
				lineTo(14, 12);
				moveTo(8, 6);
				lineTo(10, 4);
				moveTo(10, 4);
				lineTo(12, 6);
				moveTo(8, 14);
				lineTo(10, 16);
				moveTo(10, 16);
				lineTo(12, 14);
			}
		}
		internal function perKurPress(e:MouseEvent):void {
			if (forms.length > 0) {
				perPeremesh = 1;
				e.target.startDrag();
			}
		}
		internal function perKurRelease(e:MouseEvent):void {
			if (forms.length > 0) {
				e.target.stopDrag();
				perPeremesh = 0;
			}
		}
		internal function kopirPress(e:MouseEvent):void {
			with (kopirForm.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				beginFill(0x6DF2AC, 1);
				lineStyle(2, 0x1510A0, 1);
				drawRect(1, 3, 7, 12);
				beginFill(0x6DF2AC, 1);
				drawRect(11, 3, 7, 12);
				endFill();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				
				if (int(NomerFormy.telo.text)>forms.length - 1) {
					NomerFormy.telo.text = forms.length - 1;
				}
				if (int(NomerFormy.telo.text) < 0) {
					NomerFormy.telo.text = 0;
				}
				if (int(nomKopir.text)>forms.length) {
					nomKopir.text = forms.length;
				}
				if (int(nomKopir.text) <= 0) {
					nomKopir.text = 0;
				}
				vremKopir = int(NomerFormy.telo.text);
				NomerFormy.telo.text = nomKopir.text;
				//Функция вставки формы начало
				tekNomFormy = int(NomerFormy.telo.text);
				if (forms[nomKopir.text] == undefined || forms[nomKopir.text] == null) {
					if (udMassivy.length > 0) {
						forms[forms.length] = udMassivy[udMassivy.length - 1];
						udMassivy.length -= 1;
					}else {
						forms[forms.length] = new Array();
					}
					if (udTochki.length > 0) {
						forms[forms.length - 1][0] = udTochki[udTochki.length - 1];
						udTochki.length -= 1;
					}else {
						forms[forms.length - 1][0] = new Sprite();
					}
					Risunok.addChild(forms[forms.length - 1][0]);
					NomerFormy.telo.text = forms.length - 1;
					NomerFormy.telo.setTextFormat(txFormat2);
				}else {
					if (vremKopir >= tekNomFormy) {
						vremKopir += 1;
					}
					for (var i:int = forms.length - 1; i >= tekNomFormy; i--) {
						forms[i + 1] = forms[i];
						formsX0[i + 1] = formsX0[i];
						formsY0[i + 1] = formsY0[i];
						formsIsxKod[i + 1] = formsIsxKod[i];
					}
					if (udMassivy.length > 0) {
						forms[tekNomFormy] = udMassivy[udMassivy.length - 1];
						udMassivy.length -= 1;
					}else {
						forms[tekNomFormy] = new Array();
					}
					if (udTochki.length > 0) {
						forms[tekNomFormy][0] = udTochki[udTochki.length - 1];
						udTochki.length -= 1;
					}else {
						forms[tekNomFormy][0] = new Sprite();
					}
					Risunok.addChild(forms[tekNomFormy][0]);
					Risunok.setChildIndex(forms[tekNomFormy][0], tekNomFormy);
					NomerFormy.telo.text = forms.length-1;
					NomerFormy.telo.setTextFormat(txFormat2);
				}
				//Функция вставки формы конец
				for (i = 1; i < forms[vremKopir].length; i++) {
					if (forms[vremKopir][i][0] == "linSt") {
						if (udMassivy.length > 0) {
							forms[tekNomFormy][i] = udMassivy[udMassivy.length - 1];
							udMassivy.length -= 1;
						}else {
							forms[tekNomFormy][i] = new Array();
						}
						forms[tekNomFormy][i][0] = "linSt";
						if (udTochki.length > 0) {
							forms[tekNomFormy][i][1] = udTochki[udTochki.length - 1];
							udTochki.length -= 1;
						}else {
							forms[tekNomFormy][i][1] = new Sprite();
						}
						forms[tekNomFormy][i][2] = forms[vremKopir][i][2];
						forms[tekNomFormy][i][3] = forms[vremKopir][i][3];
						forms[tekNomFormy][i][4] = forms[vremKopir][i][4];
						forms[tekNomFormy][i][5] = forms[vremKopir][i][5];
						forms[tekNomFormy][i][6] = LineScaleMode.NORMAL;
						if (forms[vremKopir][i][6] == LineScaleMode.NONE) {
							forms[tekNomFormy][i][6] = LineScaleMode.NONE;
						}
						if (forms[vremKopir][i][6] == LineScaleMode.VERTICAL) {
							forms[tekNomFormy][i][6] = LineScaleMode.VERTICAL;
						}
						if (forms[vremKopir][i][6] == LineScaleMode.HORIZONTAL) {
							forms[tekNomFormy][i][6] = LineScaleMode.HORIZONTAL;
						}
						forms[tekNomFormy][i][7] = CapsStyle.ROUND;
						if (forms[vremKopir][i][7] == CapsStyle.NONE) {
							forms[tekNomFormy][i][7] = CapsStyle.NONE;
						}
						if (forms[vremKopir][i][7] == CapsStyle.SQUARE) {
							forms[tekNomFormy][i][7] = CapsStyle.SQUARE;
						}
						forms[tekNomFormy][i][8] = JointStyle.ROUND;
						if (forms[vremKopir][i][8] == JointStyle.BEVEL) {
							forms[tekNomFormy][i][8] = JointStyle.BEVEL;
						}
						if (forms[vremKopir][i][8] == JointStyle.MITER) {
							forms[tekNomFormy][i][8] = JointStyle.MITER;
							forms[tekNomFormy][i][9] = forms[vremKopir][i][9];
						}
						forms[tekNomFormy][0].addChild(forms[tekNomFormy][i][1]);
					}
					if (forms[vremKopir][i][0] == "bgFl") {
						if (udMassivy.length > 0) {
							forms[tekNomFormy][i] = udMassivy[udMassivy.length - 1];
							udMassivy.length -= 1;
						}else {
							forms[tekNomFormy][i] = new Array();
						}
						if (udTochki.length > 0) {
							forms[tekNomFormy][i][1] = udTochki[udTochki.length - 1];
							udTochki.length -= 1;
						}else {
							forms[tekNomFormy][i][1] = new Sprite();
						}
						forms[tekNomFormy][i][0] = "bgFl";
						forms[tekNomFormy][i][2] = forms[vremKopir][i][2];
						forms[tekNomFormy][i][3] = forms[vremKopir][i][3];
						forms[tekNomFormy][0].addChild(forms[tekNomFormy][i][1]);
					}
					if (forms[vremKopir][i][0] == "bgGrFl") {
						if (udMassivy.length > 0) {
							forms[tekNomFormy][i] = udMassivy[udMassivy.length - 1];
							udMassivy.length -= 1;
						}else {
							forms[tekNomFormy][i] = new Array();
						}
						if (udMassivy.length > 0) {
							formsGrBox[tekNomFormy] = udMassivy[udMassivy.length - 1];
							udMassivy.length -= 1;
						}else {
							formsGrBox[tekNomFormy] = new Array();
						}
						if (udTochki.length > 0) {
							forms[tekNomFormy][i][1] = udTochki[udTochki.length - 1];
							udTochki.length -= 1;
						}else {
							forms[tekNomFormy][i][1] = new Sprite();
						}
						forms[tekNomFormy][i][0] = "bgGrFl";
						forms[tekNomFormy][i][2] = forms[vremKopir][i][2];
						forms[tekNomFormy][i][3] = forms[vremKopir][i][3];
						forms[tekNomFormy][i][4] = forms[vremKopir][i][4];
						forms[tekNomFormy][i][5] = forms[vremKopir][i][5];
						forms[tekNomFormy][i][6] = forms[vremKopir][i][6];
						forms[tekNomFormy][i][7] = forms[vremKopir][i][7];
						forms[tekNomFormy][i][8] = forms[vremKopir][i][8];
						forms[tekNomFormy][i][9] = forms[vremKopir][i][9];
						formsGrBox[tekNomFormy][0] = formsGrBox[vremKopir][0];
						formsGrBox[tekNomFormy][1] = formsGrBox[vremKopir][1];
						formsGrBox[tekNomFormy][2] = formsGrBox[vremKopir][2];
						formsGrBox[tekNomFormy][3] = formsGrBox[vremKopir][3];
						formsGrBox[tekNomFormy][4] = formsGrBox[vremKopir][4];
						forms[tekNomFormy][0].addChild(forms[tekNomFormy][i][1]);
					}
					if (forms[vremKopir][i][0] == "movT") {
						if (udMassivy.length > 0) {
							forms[tekNomFormy][i] = udMassivy[udMassivy.length - 1];
							udMassivy.length -= 1;
						}else {
							forms[tekNomFormy][i] = new Array();
						}
						if (udTochki.length > 0) {
							forms[tekNomFormy][i][1] = udTochki[udTochki.length - 1];
							udTochki.length -= 1;
						}else {
							forms[tekNomFormy][i][1] = new Sprite();
						}
						forms[tekNomFormy][i][0] = "movT";
						with(forms[tekNomFormy][i][1].graphics){
							lineStyle(2, 0x004080, 1);
							moveTo(0, -2);
							lineTo(0, 2);
							moveTo(-2, 0);
							lineTo(2, 0);
							lineStyle(2, 0x004080, 0);
							beginFill(0x000000, 0);
							moveTo(-2, -2);
							lineTo(2, -2);
							lineTo(2, 2);
							lineTo( -2, 2);
							endFill();
						}
						forms[tekNomFormy][0].addChild(forms[tekNomFormy][i][1]);
						forms[tekNomFormy][i][1].x = forms[vremKopir][i][1].x;
						forms[tekNomFormy][i][1].y = forms[vremKopir][i][1].y;
						forms[tekNomFormy][i][1].addEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
						forms[tekNomFormy][i][1].addEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
					}
					if (forms[vremKopir][i][0] == "linT") {
						if (udMassivy.length > 0) {
							forms[tekNomFormy][i] = udMassivy[udMassivy.length - 1];
							udMassivy.length -= 1;
						}else {
							forms[tekNomFormy][i] = new Array();
						}
						if (udTochki.length > 0) {
							forms[tekNomFormy][i][1] = udTochki[udTochki.length - 1];
							udTochki.length -= 1;
						}else {
							forms[tekNomFormy][i][1] = new Sprite();
						}
						forms[tekNomFormy][i][0] = "linT";
						with(forms[tekNomFormy][i][1].graphics){
							lineStyle(2, 0x2B9411, 1);
							moveTo(0, -2);
							lineTo(0, 2);
							moveTo(-2, 0);
							lineTo(2, 0);
							lineStyle(2, 0x004080, 0);
							beginFill(0x000000, 0);
							moveTo(-2, -2);
							lineTo(2, -2);
							lineTo(2, 2);
							lineTo( -2, 2);
							endFill();
						}
						forms[tekNomFormy][0].addChild(forms[tekNomFormy][i][1]);
						forms[tekNomFormy][i][1].x = forms[vremKopir][i][1].x;
						forms[tekNomFormy][i][1].y = forms[vremKopir][i][1].y;
						forms[tekNomFormy][i][1].addEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
						forms[tekNomFormy][i][1].addEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
					}
					if (forms[vremKopir][i][0] == "curvT") {
						if (udMassivy.length > 0) {
							forms[tekNomFormy][i] = udMassivy[udMassivy.length - 1];
							udMassivy.length -= 1;
						}else {
							forms[tekNomFormy][i] = new Array();
						}
						if (udTochki.length > 0) {
							forms[tekNomFormy][i][1] = udTochki[udTochki.length - 1];
							udTochki.length -= 1;
						}else {
							forms[tekNomFormy][i][1] = new Sprite();
						}
						if (udMassivy.length > 0) {
							forms[tekNomFormy][i+1] = udMassivy[udMassivy.length - 1];
							udMassivy.length -= 1;
						}else {
							forms[tekNomFormy][i+1] = new Array();
						}
						if (udTochki.length > 0) {
							forms[tekNomFormy][i][2] = udTochki[udTochki.length - 1];
							udTochki.length -= 1;
						}else {
							forms[tekNomFormy][i][2] = new Sprite();
						}
						forms[tekNomFormy][i][0] = "curvT";
						forms[tekNomFormy][i+1][0] = "contrl";
						with(forms[tekNomFormy][i][1].graphics){
							lineStyle(2, 0xB411D4, 1);
							moveTo(0, -2);
							lineTo(0, 2);
							moveTo(-2, 0);
							lineTo(2, 0);
							lineStyle(2, 0x004080, 0);
							beginFill(0x000000, 0);
							moveTo(-2, -2);
							lineTo(2, -2);
							lineTo(2, 2);
							lineTo( -2, 2);
							endFill();
						}
						with(forms[tekNomFormy][i][2].graphics){
							lineStyle(2, 0xFF1212, 100);
							moveTo(0, -2);
							lineTo(0, 2);
							moveTo(-2, 0);
							lineTo(2, 0);
							lineStyle(2, 0x004080, 0);
							beginFill(0x000000, 0);
							moveTo(-2, -2);
							lineTo(2, -2);
							lineTo(2, 2);
							lineTo( -2, 2);
							endFill();
						}
						forms[tekNomFormy][i][1].x = forms[vremKopir][i][1].x;
						forms[tekNomFormy][i][1].y = forms[vremKopir][i][1].y;
						forms[tekNomFormy][i][2].x = forms[vremKopir][i][2].x;
						forms[tekNomFormy][i][2].y = forms[vremKopir][i][2].y;
						forms[tekNomFormy][0].addChild(forms[tekNomFormy][i][1]);
						forms[tekNomFormy][0].addChild(forms[tekNomFormy][i][2]);
						forms[tekNomFormy][i][1].addEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
						forms[tekNomFormy][i][1].addEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
						forms[tekNomFormy][i][2].addEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
						forms[tekNomFormy][i][2].addEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
					}
					if (forms[vremKopir][i][0] == "endFl") {
						if (udMassivy.length > 0) {
							forms[tekNomFormy][i] = udMassivy[udMassivy.length - 1];
							udMassivy.length -= 1;
						}else {
							forms[tekNomFormy][i] = new Array();
						}
						if (udTochki.length > 0) {
							forms[tekNomFormy][i][1] = udTochki[udTochki.length - 1];
							udTochki.length -= 1;
						}else {
							forms[tekNomFormy][i][1] = new Sprite();
						}
						forms[tekNomFormy][i][0] = "endFl";
						forms[tekNomFormy][0].addChild(forms[tekNomFormy][i][1]);
					}
				}
				NomerFormy.telo.text = tekNomFormy;
				NomerFormy.telo.setTextFormat(txFormat2);
				risovanie();
				nomKopir.text = forms.length;
				nomKopir.setTextFormat(txFormat2);
			}
		}
		internal function kopirRelease(e:MouseEvent):void {
			with (kopirForm.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				beginFill(0x6DF2AC, 1);
				lineStyle(2, 0x1510A0, 1);
				drawRect(1, 3, 7, 12);
				beginFill(0x6DF2AC, 1);
				drawRect(11, 3, 7, 12);
				endFill();
			}
		}
		internal function povFormy1Press(e:MouseEvent):void {
			with (povFormy1.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(6, 16);
				curveTo(4, 2, 16, 6);
				moveTo(4, 14);
				lineTo(6, 16);
				moveTo(6, 16);
				lineTo(8, 14);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				vosstTochek();
				vosstanovlenie = 0;
				perRotation = 1;
				ugolRot = Number(TabloRot.text);
				rot = 2 * Math.PI * (-ugolRot / 360);
				matrica.createBox(1.0, 1.0, rot, 0, 0);
				RotSprt.transform.matrix = matrica;
				if (animaciya == true) {
					animPer = 0;
				}
				risovanie();
				if (animaciya == true) {
					animPer = 1;
				}
				perRotation = 0;
			}
		}
		internal function povFormy1Release(e:MouseEvent):void {
			with (povFormy1.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(6, 16);
				curveTo(4, 2, 16, 6);
				moveTo(4, 14);
				lineTo(6, 16);
				moveTo(6, 16);
				lineTo(8, 14);
			}
		}
		internal function povFormy2Press(e:MouseEvent):void {
			with (povFormy2.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(14, 16);
				curveTo(16, 2, 4, 6);
				moveTo(16, 14);
				lineTo(14, 16);
				moveTo(14, 16);
				lineTo(12, 14);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				vosstTochek();
				vosstanovlenie = 0;
				perRotation = 1;
				ugolRot = Number(TabloRot.text);
				rot = 2 * Math.PI * (ugolRot / 360);
				matrica.createBox(1.0, 1.0, rot, 0, 0);
				RotSprt.transform.matrix = matrica;
				if (animaciya == true) {
					animPer = 0;
				}
				risovanie();
				if (animaciya == true) {
					animPer = 1;
				}
				perRotation = 0;
			}
		}
		internal function povFormy2Release(e:MouseEvent):void {
			with (povFormy2.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(14, 16);
				curveTo(16, 2, 4, 6);
				moveTo(16, 14);
				lineTo(14, 16);
				moveTo(14, 16);
				lineTo(12, 14);
			}
		}
		internal function zadPozicPress(e:MouseEvent):void {
			with (zadPozic.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRoundRect(10, 5, 5, 10, 10);
				moveTo(5, 5);
				lineTo(5, 15);
				moveTo(2, 10);
				lineTo(5, 5);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				if (int(NomerFormy.telo.text)>forms.length - 1) {
					NomerFormy.telo.text = forms.length - 1;
				}
				if (int(NomerFormy.telo.text) < 0) {
					NomerFormy.telo.text = 0;
				}
				tekNomFormy = int(NomerFormy.telo.text);
				if (int(Poryadok.telo.text) > forms[tekNomFormy].length) {
					Poryadok.telo.text = forms[tekNomFormy].length;
				}
				if (int(Poryadok.telo.text) <2) {
					Poryadok.telo.text = 2;
				}
				tekPoryadok = int(Poryadok.telo.text);
				vosstTochek();
				vosstanovlenie = 0;
				if(forms[tekNomFormy]!=undefined){
					if (forms[tekNomFormy][tekPoryadok - 1] != undefined) {
						if (forms[tekNomFormy][tekPoryadok - 1][0] == "movT"||forms[tekNomFormy][tekPoryadok - 1][0] == "linT") {
							forms[tekNomFormy][tekPoryadok - 1][1].x = X.telo.text;
							forms[tekNomFormy][tekPoryadok - 1][1].y = Y.telo.text;
						}
						if (forms[tekNomFormy][tekPoryadok - 1][0] == "curvT") {
							forms[tekNomFormy][tekPoryadok - 1][1].x = X.telo.text;
							forms[tekNomFormy][tekPoryadok - 1][1].y = Y.telo.text;
						}
						if (forms[tekNomFormy][tekPoryadok - 1][0] == "contrl") {
							forms[tekNomFormy][tekPoryadok - 2][2].x = CtrlX.telo.text;
							forms[tekNomFormy][tekPoryadok - 2][2].y = CtrlY.telo.text;
						}
					}
				}
				risovanie();
			}
		}
		internal function zadPozicRelease(e:MouseEvent):void {
			with (zadPozic.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRoundRect(10, 5, 5, 10, 10);
				moveTo(5, 5);
				lineTo(5, 15);
				moveTo(2, 10);
				lineTo(5, 5);
			}
		}
		internal function zadVisiblePress(e:MouseEvent):void {
			with (zadVisible.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 0.4);
				moveTo(4, 10);
				lineTo(16, 10);
				moveTo(10, 4);
				lineTo(10, 16);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			zadVisiblePer = !zadVisiblePer;
			if (forms.length > 0) {
				for (var i:int = 0; i < forms.length; i++) {
					for (var j:int = 0; j < forms[i][0].numChildren; j++) {
						forms[i][0].getChildAt(j).visible = zadVisiblePer;
					}
				}
			}
		}
		internal function zadVisibleRelease(e:MouseEvent):void {
			with (zadVisible.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0x1510A0, 0.4);
				moveTo(4, 10);
				lineTo(16, 10);
				moveTo(10, 4);
				lineTo(10, 16);
			}
		}
		internal function vvUGPress(e:MouseEvent):void {
			with (vvUG.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(0.5, 0x000000, 1);
				moveTo(5, 0);
				lineTo(5, 10);
				moveTo(0, 5);
				lineTo(10, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				X0 = 10000;
				Y0 = 10000;
				for (var i:int = 0; i < forms.length; i++) {
					for (j = 1; j < forms[i].length; j++) {
						if (forms[i][j] != undefined) {
							if (forms[i][j][0] == "movT" || forms[i][j][0] == "linT") {
								if (forms[i][j][1].x < 0) {
									formsVivX[0] = formsX0[i] - ((-1)*forms[i][j][1].x);
								}else {
									formsVivX[0] = formsX0[i] + forms[i][j][1].x;
								}
								if (forms[i][j][1].y < 0) {
									formsVivY[0] = formsY0[i] - ((-1)*forms[i][j][1].y);
								}else {
									formsVivY[0] = formsY0[i] + forms[i][j][1].y;
								}
								X0 = Math.min(X0, formsVivX[0]);
								Y0 = Math.min(Y0, formsVivY[0]);
							}
							if (forms[i][j][0] == "curvT") {
								if (forms[i][j][1].x < 0) {
									formsVivX[0] = formsX0[i] - ((-1)*forms[i][j][1].x);
								}else {
									formsVivX[0] = formsX0[i] + forms[i][j][1].x;
								}
								if (forms[i][j][1].y < 0) {
									formsVivY[0] = formsY0[i] - ((-1)*forms[i][j][1].y);
								}else {
									formsVivY[0] = formsY0[i] + forms[i][j][1].y;
								}
								X0 = Math.min(X0, formsVivX[0]);
								Y0 = Math.min(Y0, formsVivY[0]);
								if (forms[i][j][2].x < 0) {
									formsVivX[0] = formsX0[i] - ((-1)*forms[i][j][2].x);
								}else {
									formsVivX[0] = formsX0[i] + forms[i][j][2].x;
								}
								if (forms[i][j][2].y < 0) {
									formsVivY[0] = formsY0[i] - ((-1)*forms[i][j][2].y);
								}else {
									formsVivY[0] = formsY0[i] + forms[i][j][2].y;
								}
								X0 = Math.min(X0, formsVivX[0]);
								Y0 = Math.min(Y0, formsVivY[0]);
							}
						}
					}
				}
				formsVivX.length = 0;
				formsVivY.length = 0;
				for (j = 0; j < forms.length; j++) {
					formsVivX[j] = Math.round(formsX0[j] - X0);
					formsVivY[j] = Math.round(formsY0[j] - Y0);
				}
				
				for (i = 0; i < forms.length;i++){
					formsVivKod[i] = "";
					if (i == 0) {
						formsVivKod[0] +="import flash.display.Shape;"+ "\n"+
						"import flash.display.Sprite;"+ "\n"+
						"import flash.geom.Matrix;"+ "\n"+
						"import flash.geom.Point;"+ "\n"+
						"import flash.display.GradientType;"+ "\n"+
						"import flash.display.InterpolationMethod;"+ "\n"+
						"import flash.display.SpreadMethod;"+ "\n"+
						"import flash.display.LineScaleMode;"+ "\n"+
						"import flash.display.CapsStyle;"+ "\n"+
						"import flash.display.JointStyle;" + "\n" + "\n";
						formsVivKod[0] += "internal var "+NazvRisunka.telo.text+":Sprite = new Sprite();" + "\n";
						for (var l:int = 0; l < forms.length; l++) {
							formsVivKod[0] += "internal var "+NazvRisunka.telo.text+"form" + l + ":Shape = new Shape();" + "\n";
						}
						formsVivKod[0] += "internal var linSt5True:Boolean = true;" + "\n";
						formsVivKod[0] += "internal var linSt5False:Boolean = false;" + "\n";
						formsVivKod[0] += "internal var linSt6Norm:String=LineScaleMode.NORMAL;" + "\n";
						formsVivKod[0] += "internal var linSt6None:String=LineScaleMode.NONE;" + "\n";
						formsVivKod[0] += "internal var linSt6Vert:String=LineScaleMode.VERTICAL;" + "\n";
						formsVivKod[0] += "internal var linSt6Hor:String=LineScaleMode.HORIZONTAL;" + "\n";
						formsVivKod[0] += "internal var linSt7Rd:String=CapsStyle.ROUND;" + "\n";
						formsVivKod[0] += "internal var linSt7None:String=CapsStyle.NONE;" + "\n";
						formsVivKod[0] += "internal var linSt7Sq:String=CapsStyle.SQUARE;" + "\n";
						formsVivKod[0] += "internal var linSt8Bev:String = JointStyle.BEVEL; " + "\n";
						formsVivKod[0] += "internal var linSt8Rd:String=JointStyle.ROUND;" + "\n";
						formsVivKod[0] += "internal var linSt8Mit:String=JointStyle.MITER;" + "\n";
						formsVivKod[0] += "internal var gr2Lin:String=GradientType.LINEAR;" + "\n";
						formsVivKod[0] += "internal var gr2Rad:String=GradientType.RADIAL" + "\n";
						formsVivKod[0] += "internal var matrica:Matrix = new Matrix();" + "\n";
						formsVivKod[0] += "internal var gr7Pad:String=SpreadMethod.PAD;" + "\n";
						formsVivKod[0] += "internal var gr7Ref:String=SpreadMethod.REFLECT;" + "\n";
						formsVivKod[0] += "internal var gr7Rep:String=SpreadMethod.REPEAT;" + "\n";
						formsVivKod[0] += "internal var gr8Rgb:String=InterpolationMethod.RGB;" + "\n";
						formsVivKod[0] += "internal var gr8LinRgb:String=InterpolationMethod.LINEAR_RGB;" + "\n"+ "\n";
					}
					for (var k:int = 1; k < forms[i].length; k++) {
						if (forms[i][k][0] == "bgGrFl") { 
							vremGrFillMas[3] = "[";
							vremGrFillMas[4] = "[";
							vremGrFillMas[5] = "[";
							for (var m:int = 0; m < forms[i][k][3].length; m++) {
								vremGrFillMas[3]+= forms[i][k][3][m];
								vremGrFillMas[4]+= forms[i][k][4][m];
								vremGrFillMas[5] += forms[i][k][5][m];
								if (m < forms[i][k][3].length - 1) {
									vremGrFillMas[3] += ",";
									vremGrFillMas[4] += ",";
									vremGrFillMas[5] += ",";
								}
							}
							vremGrFillMas[3] += "]";
							vremGrFillMas[4] += "]";
							vremGrFillMas[5] += "]";
							if (forms[i][k][6] != null) {
								vremGrFillMas[6] = "matrica.createGradientBox(" + formsGrBox[i][0] + "," + formsGrBox[i][1] + "," + formsGrBox[i][2] + "," + formsGrBox[i][3] + "," + formsGrBox[i][4]+ ");";
								formsVivKod[i] += vremGrFillMas[6]+ "\n";
							}else {
								vremGrFillMas[6] = "null";
							}
						}
					}
					formsVivKod[i] += "with("+NazvRisunka.telo.text+"form" + i +".graphics){" + "\n";
					for (j = 1; j < forms[i].length; j++) {
						if (forms[i][j][0] == "linSt") { 
							vremLinStMas.length = 0;
							if (forms[i][j][5] == true) {
								vremLinStMas[5] = "linSt5True";
							}
							if (forms[i][j][5] == false) {
								vremLinStMas[5] = "linSt5False";
							}
							if (forms[i][j][6] == LineScaleMode.NORMAL) {
								vremLinStMas[6] = "linSt6Norm";
							}
							if (forms[i][j][6] == LineScaleMode.NONE) {
								vremLinStMas[6] = "linSt6None";
							}
							if (forms[i][j][6] == LineScaleMode.VERTICAL) {
								vremLinStMas[6] = "linSt6Vert";
							}
							if (forms[i][j][6] == LineScaleMode.HORIZONTAL) {
								vremLinStMas[6] = "linSt6Hor";
							}
							if (forms[i][j][7] == CapsStyle.NONE) {
								vremLinStMas[7] = "linSt7None";
							}
							if (forms[i][j][7] == CapsStyle.ROUND) {
								vremLinStMas[7] = "linSt7Rd";
							}
							if (forms[i][j][7] == CapsStyle.SQUARE) {
								vremLinStMas[7] = "linSt7Sq";
							}
							if (forms[i][j][8] == JointStyle.BEVEL) {
								vremLinStMas[8] = "linSt8Bev";
							}
							if (forms[i][j][8] == JointStyle.ROUND) {
								vremLinStMas[8] = "linSt8Rd";
							}
							if (forms[i][j][8] == JointStyle.MITER) {
								vremLinStMas[8] = "linSt8Mit";
								vremLinStMas[9] = forms[i][j][9];
							}
							formsVivKod[i] +="lineStyle(" +forms[i][j][2] + "," + " " + forms[i][j][3] + "," + " " + forms[i][j][4] + "," + " " + vremLinStMas[5] + "," + " " + vremLinStMas[6] + "," + " " + vremLinStMas[7] + "," + " " + vremLinStMas[8] + "," + " " + vremLinStMas[9] + ")" + ";" + "\n";
						}
						if (forms[i][j][0] == "bgFl") { 
							formsVivKod[i] +="beginFill(" + forms[i][j][2] + "," + " " + forms[i][j][3] + ")" +  ";" + "\n";
						}
						if (forms[i][j][0] == "bgGrFl") { 
							if (forms[i][j][2] == GradientType.LINEAR) {
								vremGrFillMas[2] = "gr2Lin";
							}
							if (forms[i][j][2] == GradientType.RADIAL) {
								vremGrFillMas[2] = "gr2Rad";
							}
							if (forms[i][j][6] != null) {
								vremGrFillMas[6] = "matrica"
							}else {
								vremGrFillMas[6] = "null";
							}
							if (forms[i][j][7] == SpreadMethod.PAD) {
								vremGrFillMas[7]="gr7Pad"
							}
							if (forms[i][j][7] == SpreadMethod.REFLECT) {
								vremGrFillMas[7]="gr7Ref"
							}
							if (forms[i][j][7] == SpreadMethod.REPEAT) {
								vremGrFillMas[7]="gr7Rep"
							}
							if (forms[i][j][8] == InterpolationMethod.LINEAR_RGB) {
								vremGrFillMas[8] = "gr8LinRgb";
							}
							if (forms[i][j][8] == InterpolationMethod.RGB) {
								vremGrFillMas[8] = "gr8Rgb";
							}
							vremGrFillMas[9] = forms[i][j][9];
							formsVivKod[i] += "beginGradientFill(" + vremGrFillMas[2] + "," + " " + vremGrFillMas[3] + "," + " " + vremGrFillMas[4] + "," + " " + vremGrFillMas[5] + "," + " " + vremGrFillMas[6] + "," + " " + vremGrFillMas[7] + "," + " " + vremGrFillMas[8] + "," + " " + vremGrFillMas[9] + ")" + ";" + "\n";
						}
						if (forms[i][j][0] == "movT") { 
							formsVivKod[i] +="moveTo(" + forms[i][j][1].x + "," + " " + forms[i][j][1].y + ")" +  ";" + "\n";
						}
						if (forms[i][j][0] == "linT") {
							formsVivKod[i] +="lineTo(" + forms[i][j][1].x + "," + " " + forms[i][j][1].y + ")" +  ";" + "\n";
						}
						if (forms[i][j][0] == "curvT") {
							formsVivKod[i] +="curveTo(" + forms[i][j][2].x + "," + " " +forms[i][j][2].y + "," + " " +forms[i][j][1].x + "," + " " +forms[i][j][1].y + ")" +  ";" + "\n";
						}
						if (forms[i][j][0] == "endFl") { 
							formsVivKod[i] +="endFill()" + ";" + "\n";
						}
					}
					formsVivKod[i] += "}" + "\n";
					formsVivKod[i] += NazvRisunka.telo.text+".addChild("+NazvRisunka.telo.text+"form" + i + ");" + "\n";
					formsVivKod[i] += NazvRisunka.telo.text+"form" + i + ".x=" + formsVivX[i] + ";" + "\n";
					formsVivKod[i] += NazvRisunka.telo.text+"form" + i + ".y=" + formsVivY[i] + ";" + "\n";
				}
				Out.telo.text = "";
				for (j = 0; j < forms.length; j++) {
					Out.telo.appendText(formsVivKod[j] + "\n");
				}
				Out.telo.setTextFormat(txFormat2);
			}
		}
		internal function vvUGRelease(e:MouseEvent):void {
			with (vvUG.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(0.5, 0x000000, 1);
				moveTo(5, 0);
				lineTo(5, 10);
				moveTo(0, 5);
				lineTo(10, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
			}
		}
		internal function centrPress(e:MouseEvent):void {
			with (centr.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(0.5, 0x000000, 1);
				moveTo(10, 5);
				lineTo(10, 15);
				moveTo(5, 10);
				lineTo(15, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				minX = 10000;
				minY = 10000;
				maxX = -10000;
				maxY = -10000;
				X0 = 0;
				Y0 = 0;
				for (var i:int = 0; i < forms.length; i++) {
					minX = Math.min(minX, formsX0[i]);
					minY = Math.min(minY, formsY0[i]);
					maxX = Math.max(maxX, formsX0[i]);
					maxY = Math.max(maxY, formsY0[i]);
				}
				minX = Math.round(minX);
				minY = Math.round(minY);
				maxX = Math.round(maxX);
				maxY = Math.round(maxY);
				X0 = Math.round((maxX - minX) / 2 + minX);
				Y0 = Math.round((maxY - minY) / 2 + minY);
				formsVivX.length = 0;
				formsVivY.length = 0;
				for (j = 0; j < forms.length; j++) {
					if (formsX0[j] < X0) {
						formsVivX[j] = Math.round( -1 * (X0 - formsX0[j]));
					}else  if (formsX0[j] >= X0) {
						formsVivX[j] = Math.round(formsX0[j] - X0);
					}
					if (formsY0[j] < Y0) {
						formsVivY[j] = Math.round(-1 * (Y0 - formsY0[j]));
					}else  if (formsY0[j] >= Y0) {
						formsVivY[j] = Math.round(formsY0[j] - Y0);
					}
				}
				
				for (i = 0; i < forms.length;i++){
					formsVivKod[i] = "";
					if (i == 0) {
						formsVivKod[0] +="import flash.display.Shape;"+ "\n"+
						"import flash.display.Sprite;"+ "\n"+
						"import flash.geom.Matrix;"+ "\n"+
						"import flash.geom.Point;"+ "\n"+
						"import flash.display.GradientType;"+ "\n"+
						"import flash.display.InterpolationMethod;"+ "\n"+
						"import flash.display.SpreadMethod;"+ "\n"+
						"import flash.display.LineScaleMode;"+ "\n"+
						"import flash.display.CapsStyle;"+ "\n"+
						"import flash.display.JointStyle;" + "\n" + "\n";
						formsVivKod[0] += "internal var " +NazvRisunka.telo.text+":Sprite = new Sprite();" + "\n";
						for (var l:int = 0; l < forms.length; l++) {
							formsVivKod[0] += "internal var "+NazvRisunka.telo.text+"form" + l + ":Shape = new Shape();" + "\n";
						}
						formsVivKod[0] += "internal var linSt5True:Boolean = true;" + "\n";
						formsVivKod[0] += "internal var linSt5False:Boolean = false;" + "\n";
						formsVivKod[0] += "internal var linSt6Norm:String=LineScaleMode.NORMAL;" + "\n";
						formsVivKod[0] += "internal var linSt6None:String=LineScaleMode.NONE;" + "\n";
						formsVivKod[0] += "internal var linSt6Vert:String=LineScaleMode.VERTICAL;" + "\n";
						formsVivKod[0] += "internal var linSt6Hor:String=LineScaleMode.HORIZONTAL;" + "\n";
						formsVivKod[0] += "internal var linSt7Rd:String=CapsStyle.ROUND;" + "\n";
						formsVivKod[0] += "internal var linSt7None:String=CapsStyle.NONE;" + "\n";
						formsVivKod[0] += "internal var linSt7Sq:String=CapsStyle.SQUARE;" + "\n";
						formsVivKod[0] += "internal var linSt8Bev:String = JointStyle.BEVEL; " + "\n";
						formsVivKod[0] += "internal var linSt8Rd:String=JointStyle.ROUND;" + "\n";
						formsVivKod[0] += "internal var linSt8Mit:String=JointStyle.MITER;" + "\n";
						formsVivKod[0] += "internal var gr2Lin:String=GradientType.LINEAR;" + "\n";
						formsVivKod[0] += "internal var gr2Rad:String=GradientType.RADIAL" + "\n";
						formsVivKod[0] += "internal var matrica:Matrix = new Matrix();" + "\n";
						formsVivKod[0] += "internal var gr7Pad:String=SpreadMethod.PAD;" + "\n";
						formsVivKod[0] += "internal var gr7Ref:String=SpreadMethod.REFLECT;" + "\n";
						formsVivKod[0] += "internal var gr7Rep:String=SpreadMethod.REPEAT;" + "\n";
						formsVivKod[0] += "internal var gr8Rgb:String=InterpolationMethod.RGB;" + "\n";
						formsVivKod[0] += "internal var gr8LinRgb:String=InterpolationMethod.LINEAR_RGB;" + "\n"+ "\n";
					}
					for (var k:int = 1; k < forms[i].length; k++) {
						if (forms[i][k][0] == "bgGrFl") { 
							vremGrFillMas[3] = "[";
							vremGrFillMas[4] = "[";
							vremGrFillMas[5] = "[";
							for (var m:int = 0; m < forms[i][k][3].length; m++) {
								vremGrFillMas[3]+= forms[i][k][3][m];
								vremGrFillMas[4]+= forms[i][k][4][m];
								vremGrFillMas[5] += forms[i][k][5][m];
								if (m < forms[i][k][3].length - 1) {
									vremGrFillMas[3] += ",";
									vremGrFillMas[4] += ",";
									vremGrFillMas[5] += ",";
								}
							}
							vremGrFillMas[3] += "]";
							vremGrFillMas[4] += "]";
							vremGrFillMas[5] += "]";
							if (forms[i][k][6] != null) {
								vremGrFillMas[6] = "matrica.createGradientBox(" + formsGrBox[i][0] + "," + formsGrBox[i][1] + "," + formsGrBox[i][2] + "," + formsGrBox[i][3] + "," + formsGrBox[i][4]+ ");";
								formsVivKod[i] += vremGrFillMas[6]+ "\n";
							}else {
								vremGrFillMas[6] = "null";
							}
						}
					}
					formsVivKod[i] += "with("+NazvRisunka.telo.text+"form" + i +".graphics){" + "\n";
					for (j = 1; j < forms[i].length; j++) {
						if (forms[i][j][0] == "linSt") { 
							vremLinStMas.length = 0;
							if (forms[i][j][5] == true) {
								vremLinStMas[5] = "linSt5True";
							}
							if (forms[i][j][5] == false) {
								vremLinStMas[5] = "linSt5False";
							}
							if (forms[i][j][6] == LineScaleMode.NORMAL) {
								vremLinStMas[6] = "linSt6Norm";
							}
							if (forms[i][j][6] == LineScaleMode.NONE) {
								vremLinStMas[6] = "linSt6None";
							}
							if (forms[i][j][6] == LineScaleMode.VERTICAL) {
								vremLinStMas[6] = "linSt6Vert";
							}
							if (forms[i][j][6] == LineScaleMode.HORIZONTAL) {
								vremLinStMas[6] = "linSt6Hor";
							}
							if (forms[i][j][7] == CapsStyle.NONE) {
								vremLinStMas[7] = "linSt7None";
							}
							if (forms[i][j][7] == CapsStyle.ROUND) {
								vremLinStMas[7] = "linSt7Rd";
							}
							if (forms[i][j][7] == CapsStyle.SQUARE) {
								vremLinStMas[7] = "linSt7Sq";
							}
							if (forms[i][j][8] == JointStyle.BEVEL) {
								vremLinStMas[8] = "linSt8Bev";
							}
							if (forms[i][j][8] == JointStyle.ROUND) {
								vremLinStMas[8] = "linSt8Rd";
							}
							if (forms[i][j][8] == JointStyle.MITER) {
								vremLinStMas[8] = "linSt8Mit";
								vremLinStMas[9] = forms[i][j][9];
							}
							formsVivKod[i] +="lineStyle(" +forms[i][j][2] + "," + " " + forms[i][j][3] + "," + " " + forms[i][j][4] + "," + " " + vremLinStMas[5] + "," + " " + vremLinStMas[6] + "," + " " + vremLinStMas[7] + "," + " " + vremLinStMas[8] + "," + " " + vremLinStMas[9] + ")" + ";" + "\n";
						}
						if (forms[i][j][0] == "bgFl") { 
							formsVivKod[i] +="beginFill(" + forms[i][j][2] + "," + " " + forms[i][j][3] + ")" +  ";" + "\n";
						}
						if (forms[i][j][0] == "bgGrFl") { 
							if (forms[i][j][2] == GradientType.LINEAR) {
								vremGrFillMas[2] = "gr2Lin";
							}
							if (forms[i][j][2] == GradientType.RADIAL) {
								vremGrFillMas[2] = "gr2Rad";
							}
							if (forms[i][j][6] != null) {
								vremGrFillMas[6] = "matrica"
							}else {
								vremGrFillMas[6] = "null";
							}
							if (forms[i][j][7] == SpreadMethod.PAD) {
								vremGrFillMas[7]="gr7Pad"
							}
							if (forms[i][j][7] == SpreadMethod.REFLECT) {
								vremGrFillMas[7]="gr7Ref"
							}
							if (forms[i][j][7] == SpreadMethod.REPEAT) {
								vremGrFillMas[7]="gr7Rep"
							}
							if (forms[i][j][8] == InterpolationMethod.LINEAR_RGB) {
								vremGrFillMas[8] = "gr8LinRgb";
							}
							if (forms[i][j][8] == InterpolationMethod.RGB) {
								vremGrFillMas[8] = "gr8Rgb";
							}
							vremGrFillMas[9] = forms[i][j][9];
							formsVivKod[i] += "beginGradientFill(" + vremGrFillMas[2] + "," + " " + vremGrFillMas[3] + "," + " " + vremGrFillMas[4] + "," + " " + vremGrFillMas[5] + "," + " " + vremGrFillMas[6] + "," + " " + vremGrFillMas[7] + "," + " " + vremGrFillMas[8] + "," + " " + vremGrFillMas[9] + ")" + ";" + "\n";
						}
						if (forms[i][j][0] == "movT") { 
							formsVivKod[i] +="moveTo(" + forms[i][j][1].x + "," + " " + forms[i][j][1].y + ")" +  ";" + "\n";
						}
						if (forms[i][j][0] == "linT") {
							formsVivKod[i] +="lineTo(" + forms[i][j][1].x + "," + " " + forms[i][j][1].y + ")" +  ";" + "\n";
						}
						if (forms[i][j][0] == "curvT") {
							formsVivKod[i] +="curveTo(" + forms[i][j][2].x + "," + " " +forms[i][j][2].y + "," + " " +forms[i][j][1].x + "," + " " +forms[i][j][1].y + ")" +  ";" + "\n";
						}
						if (forms[i][j][0] == "endFl") { 
							formsVivKod[i] +="endFill()" + ";" + "\n";
						}
					}
					formsVivKod[i] += "}" + "\n";
					formsVivKod[i] += NazvRisunka.telo.text+".addChild("+NazvRisunka.telo.text+"form" + i + ");" + "\n";
					formsVivKod[i] += NazvRisunka.telo.text+"form" + i + ".x=" + formsVivX[i] + ";" + "\n";
					formsVivKod[i] += NazvRisunka.telo.text+"form" + i + ".y=" + formsVivY[i] + ";" + "\n";
				}
				Out.telo.text = "";
				for (j = 0; j < forms.length; j++) {
					Out.telo.appendText(formsVivKod[j] + "\n");
				}
				Out.telo.setTextFormat(txFormat2);
			}
		}
		internal function centrRelease(e:MouseEvent):void {
			with (centr.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(0.5, 0x000000, 1);
				moveTo(10, 5);
				lineTo(10, 15);
				moveTo(5, 10);
				lineTo(15, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
			}
		}
		private function SohrRisPress(e:MouseEvent):void {
			with (SohrRis.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			formsVivKod[0] = "";
			for (var i:int = 0; i < forms.length; i++) {
				if (formsGrBox[i] != undefined&&formsGrBox[i] !=null) {
					formsVivKod[0] += "fgb["+ i + "," + formsGrBox[i][0] + "," + formsGrBox[i][1] + "," + formsGrBox[i][2] + "," + formsGrBox[i][3] + "," + formsGrBox[i][4] + "];" + "\n";
				}
				for (var j:int = 1; j < forms[i].length; j++) {
					if (forms[i][j][0] == "linSt") {
						formsVivKod[0] += "forms[" + i + "][" + j + "][linSt,"+forms[i][j][2]+","+forms[i][j][3]+","+forms[i][j][4]+",";
						if (forms[i][j][5] == false) {
							formsVivKod[0] += "false,";
						}else {
							formsVivKod[0] += "true,";
						}
						if (forms[i][j][6] == LineScaleMode.NORMAL) {
							formsVivKod[0] += "lsnorm,";
						}
						if (forms[i][j][6] == LineScaleMode.NONE) {
							formsVivKod[0] += "lsnone,";
						}
						if (forms[i][j][6] == LineScaleMode.HORIZONTAL) {
							formsVivKod[0] += "lshor,";
						}
						if (forms[i][j][6] == LineScaleMode.VERTICAL) {
							formsVivKod[0] += "lsvert,";
						}
						if (forms[i][j][7] == CapsStyle.ROUND) {
							formsVivKod[0] += "cprnd,";
						}
						if (forms[i][j][7] == CapsStyle.SQUARE) {
							formsVivKod[0] += "cpsqr,";
						}
						if (forms[i][j][7] == CapsStyle.NONE) {
							formsVivKod[0] += "cpnone,";
						}
						if (forms[i][j][8] == JointStyle.ROUND) {
							formsVivKod[0] += "jnrnd,";
						}
						if (forms[i][j][8] == JointStyle.BEVEL) {
							formsVivKod[0] += "jnbev,";
						}
						if (forms[i][j][8] == JointStyle.MITER) {
							formsVivKod[0] += "jnmit,";
						}
						formsVivKod[0] += forms[i][j][9] + "];" + "\n";
					}
					if (forms[i][j][0] == "bgFl") {
						formsVivKod[0] += "forms[" + i + "][" + j + "][bgFl,"+forms[i][j][2]+","+forms[i][j][3]+"];" + "\n";
					}
					if (forms[i][j][0] == "bgGrFl") {
						formsVivKod[0] += "forms[" + i + "][" + j + "][bgGrFl," + forms[i][j][2] + ",";
						formsVivKod[3] = "(,";
						formsVivKod[4] = "(,";
						formsVivKod[5] = "(,";
						for (var m:int = 0; m < forms[i][j][3].length; m++) {
							formsVivKod[3] += forms[i][j][3][m];
							formsVivKod[4] += forms[i][j][4][m];
							formsVivKod[5] += forms[i][j][5][m];
							if (m < forms[i][j][3].length - 1) {
								formsVivKod[3] += ",";
								formsVivKod[4] += ",";
								formsVivKod[5] += ",";
							}
						}
						formsVivKod[3] += ",)";
						formsVivKod[4] += ",)";
						formsVivKod[5] += ",)";
						formsVivKod[0] += formsVivKod[3] + "," + formsVivKod[4] + "," + formsVivKod[5] + ",";
						if (forms[i][j][6] == null) {
							formsVivKod[0] += "null" + ",";
						}else {
							formsVivKod[0] += "matrica" + ",";
						}
						formsVivKod[0] +=forms[i][j][7]+","+forms[i][j][8]+","+forms[i][j][9]+"];" + "\n";
					}
					if (forms[i][j][0] == "endFl") {
						formsVivKod[0] += "forms[" + i + "][" + j + "][endFl];" + "\n";
					}
					if (forms[i][j][0] == "movT") {
						formsVivKod[1] = "";
						formsVivKod[2] = "";
						if (forms[i][j][1].x < 0) {
							formsVivKod[1] = formsX0[i] - ( -1 * forms[i][j][1].x);
						}else  if (forms[i][j][1].x > 0) {
							formsVivKod[1] = forms[i][j][1].x + formsX0[i];
						}else  if (forms[i][j][1].x == 0) {
							formsVivKod[1] = formsX0[i];
						}
						if (forms[i][j][1].y < 0) {
							formsVivKod[2] = formsY0[i] - ( -1 * forms[i][j][1].y);
						}else  if (forms[i][j][1].y > 0) {
							formsVivKod[2] = forms[i][j][1].y + formsY0[i];
						}else  if (forms[i][j][1].y == 0) {
							formsVivKod[2] = formsY0[i];
						}
						formsVivKod[0] += "forms[" + i + "][" + j + "][movT," + formsVivKod[1] + "," + formsVivKod[2] + "];" + "\n";
					}
					if (forms[i][j][0] == "linT") {
						formsVivKod[1] = "";
						formsVivKod[2] = "";
						if (forms[i][j][1].x < 0) {
							formsVivKod[1] = formsX0[i] - ( -1 * forms[i][j][1].x);
						}else  if (forms[i][j][1].x > 0) {
							formsVivKod[1] = forms[i][j][1].x + formsX0[i];
						}else  if (forms[i][j][1].x == 0) {
							formsVivKod[1] = formsX0[i];
						}
						if (forms[i][j][1].y < 0) {
							formsVivKod[2] = formsY0[i] - ( -1 * forms[i][j][1].y);
						}else  if (forms[i][j][1].y > 0) {
							formsVivKod[2] = forms[i][j][1].y + formsY0[i];
						}else  if (forms[i][j][1].y == 0) {
							formsVivKod[2] = formsY0[i];
						}
						formsVivKod[0] += "forms[" + i + "][" + j + "][linT," + formsVivKod[1] + "," + formsVivKod[2] + "];" + "\n";
					}
					if (forms[i][j][0] == "curvT") {
						formsVivKod[1] = "";
						formsVivKod[2] = "";
						if (forms[i][j][1].x < 0) {
							formsVivKod[1] = formsX0[i] - ( -1 * forms[i][j][1].x);
						}else  if (forms[i][j][1].x > 0) {
							formsVivKod[1] = forms[i][j][1].x + formsX0[i];
						}else  if (forms[i][j][1].x == 0) {
							formsVivKod[1] = formsX0[i];
						}
						if (forms[i][j][1].y < 0) {
							formsVivKod[2] = formsY0[i] - ( -1 * forms[i][j][1].y);
						}else  if (forms[i][j][1].y > 0) {
							formsVivKod[2] = forms[i][j][1].y + formsY0[i];
						}else  if (forms[i][j][1].y == 0) {
							formsVivKod[2] = formsY0[i];
						}
						formsVivKod[3] = "";
						formsVivKod[4] = "";
						if (forms[i][j][2].x < 0) {
							formsVivKod[3] = formsX0[i] - ( -1 * forms[i][j][2].x);
						}else  if (forms[i][j][2].x > 0) {
							formsVivKod[3] = forms[i][j][2].x + formsX0[i];
						}else  if (forms[i][j][2].x == 0) {
							formsVivKod[3] = formsX0[i];
						}
						if (forms[i][j][2].y < 0) {
							formsVivKod[4] = formsY0[i] - ( -1 * forms[i][j][2].y);
						}else  if (forms[i][j][2].y > 0) {
							formsVivKod[4] = forms[i][j][2].y + formsY0[i];
						}else  if (forms[i][j][2].y == 0) {
							formsVivKod[4] = formsY0[i];
						}
						formsVivKod[0] += "forms[" + i + "][" + j + "][curvT," + formsVivKod[3] + "," + formsVivKod[4] + "," +formsVivKod[1] + "," + formsVivKod[2] + "];" + "\n";
					}
				}
			}
			Out.telo.text = "";
			Out.telo.appendText(formsVivKod[0]);
			Out.telo.setTextFormat(txFormat2);
		}
		private function SohrRisRelease(e:MouseEvent):void {
			with (SohrRis.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
		}
		private function VostRisPress(e:MouseEvent):void {
			with (VostRis.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			vostTekForma = "";
			vostStr = Out.telo.text;
			//Это условие проверяет правильность кода для восстановления
			for (var i:int = 0; i < vostStr.length; i++) {
				if (vostStr.charAt(i) == "f" && vostStr.charAt(i + 1) == "o" && vostStr.charAt(i + 2) == "r" && vostStr.charAt(i + 3) == "m" && vostStr.charAt(i + 4) == "s") {
					vostVklFunc = 1;
					break;
				}
			}
			if(vostVklFunc==1){
				if (forms.length > 0) {
					for (i = 0; i < forms.length; i++) {
						for (var j:int = 1; j < forms[i].length; j++) {
							if(forms[i][j]!=undefined) {
								if (forms[i][j][0] == "movT" || forms[i][j][0] == "linT") {
									forms[i][j][1].removeEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
									forms[i][j][1].removeEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
									forms[i][j][1].graphics.clear();
								}
								if (forms[i][j][0] == "curvT") {
									forms[i][j][1].removeEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
									forms[i][j][1].removeEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
									forms[i][j][1].graphics.clear();
									forms[i][j][2].removeEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
									forms[i][j][2].removeEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
									forms[i][j][2].graphics.clear();
									udTochki.push(forms[i][j][2]);
									forms[i][0].removeChild(forms[i][j][2]);
									forms[i][j][2] = undefined;
									forms[i][j+1].length = 0;
									udMassivy.push(forms[i][j + 1]);
									forms[i][j + 1] = undefined;
								}
								forms[i][0].removeChild(forms[i][j][1]);
								udTochki.push(forms[i][j][1]);
								forms[i][j][1] = undefined;
								forms[i][j].length = 0;
								udMassivy.push(forms[i][j]);
							}
						}
						forms[i][0].graphics.clear();
						Risunok.removeChild(forms[i][0]);
						udTochki.push(forms[i][0]);
						forms[i][0] = undefined;
						forms[i].length = 0;
						udMassivy.push(forms[i]);
						forms[i] = undefined;
						if(formsGrBox[i]!=undefined){
							formsGrBox[i].length = 0;
							udMassivy.push(formsGrBox[i]);
						}
					}
					forms.length = 0;
					formsGrBox.length = 0;
				}
				for (i = 0; i < vostStr.length; i++) {
					if (vostStr.charAt(i) == "f" && vostStr.charAt(i + 1) == "g" && vostStr.charAt(i + 2) == "b") {
						vostPerekluch = 2;
						vostTekPoz = 1;
						i += 3;
					}
					if (vostPerekluch == 2) {
						if (vostStr.charAt(i) != "["&&vostStr.charAt(i) !=" "&&vostStr.charAt(i) !=","&&vostStr.charAt(i) !="]"&&vostStr.charAt(i) !=";") {
							vostElemMas += vostStr.charAt(i);
						}
						if (vostStr.charAt(i) == ","||vostStr.charAt(i) == "]") {
							if (vostTekPoz == 2) {
								formsGrBox[int(vost1ind)][formsGrBox[int(vost1ind)].length] = int(vostElemMas);
							}
							if (vostTekPoz == 1) {
								vost1ind += vostElemMas;
								if (udMassivy.length > 0) {
									formsGrBox[int(vost1ind)] = udMassivy[udMassivy.length - 1];
									udMassivy.length -= 1;
								}else {
									formsGrBox[int(vost1ind)] = new Array();
								}
								vostTekPoz = 2;
							}
							vostElemMas = "";
						}
						if (vostStr.charAt(i) == ";") {
							vostTekPoz = -1;
							vostElemMas = "";
							vostPerekluch = 0;
							vost1ind = "";
						}
					}
					if (vostStr.charAt(i) == "f" && vostStr.charAt(i + 1) == "o" && vostStr.charAt(i + 2) == "r" && vostStr.charAt(i + 3) == "m" && vostStr.charAt(i + 4) == "s") {
						i += 5;
						vostPerekluch = 1;
					}
					if (vostPerekluch == 1) {
						if (vostStr.charAt(i) == "[") {
							i += 1;
							vostTekPoz += 1;
						}
						if (vostTekPoz == 0 && vostStr.charAt(i) != "]" && vostStr.charAt(i) != "," && vostStr.charAt(i) != " ") {
							vost1ind += vostStr.charAt(i);
						}
						if (vostTekPoz == 0 && vostStr.charAt(i) == "]") {
							if (vostTekForma != vost1ind && vostTekForma != "") {
								NomerFormy.telo.text = vostTekForma;
								NomerFormy.telo.setTextFormat(txFormat2);
								risovanie();
							}
							vostTekForma = vost1ind;
							if(forms[int(vost1ind)]==undefined){
								if (udMassivy.length > 0) {
									forms[int(vost1ind)] = udMassivy[udMassivy.length - 1];
									udMassivy.length -= 1;
								}else {
									forms[int(vost1ind)] = new Array();
								}
							}
						}
						if (vostTekPoz == 1 && vostStr.charAt(i) != "]" && vostStr.charAt(i) != "," && vostStr.charAt(i) != " ") {
							vost2ind += vostStr.charAt(i);
						}
						if (vostTekPoz == 1 && vostStr.charAt(i) == "]") {
							if (int(vost2ind)==1) {
								if (udTochki.length > 0) {
									forms[int(vost1ind)][0] = udTochki[udTochki.length - 1];
									udTochki.length -= 1;
								}else {
									forms[int(vost1ind)][0] = new Sprite();
								}
								Risunok.addChild(forms[int(vost1ind)][0]);
							}
							if (udMassivy.length > 0) {
								forms[int(vost1ind)][int(vost2ind)] = udMassivy[udMassivy.length - 1];
								udMassivy.length -= 1;
							}else {
								forms[int(vost1ind)][int(vost2ind)] = new Array();
							}
						}
						if (vostTekPoz == 2 && vostStr.charAt(i) != "]" && vostStr.charAt(i) != "," && vostStr.charAt(i) != " ") {
							vostElemMas += vostStr.charAt(i);
						}
						if (vostStr.charAt(i) == ","||(vostTekPoz == 2 && vostStr.charAt(i) == "]")) {
							vostPoryadok += 1;
							if (vostPer == 0) {
								vostTypMas = vostElemMas;
								if (vostTypMas == "linSt"||vostTypMas == "bgFl"||vostTypMas == "bgGrFl"||vostTypMas == "endFl"||vostTypMas == "movT"||vostTypMas == "linT"||vostTypMas == "curvT") {
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok - 1] = vostTypMas;
									if (udTochki.length > 0) {
										forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = udTochki[udTochki.length - 1];
										udTochki.length -= 1;
									}else {
										forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = new Sprite();
									}
									forms[int(vost1ind)][0].addChild(forms[int(vost1ind)][int(vost2ind)][vostPoryadok]);
								}
								vostPer = 1;
							}
							if (vostTypMas == "linSt") {
								if(vostElemMas=="false"){
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = false;
								}else if(vostElemMas=="true"){
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = true;
								}else if(vostElemMas=="lsnorm"){
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = LineScaleMode.NORMAL;
								}else if(vostElemMas=="lsnone"){
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = LineScaleMode.NONE;
								}else if(vostElemMas=="lshor"){
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = LineScaleMode.HORIZONTAL;
								}else if(vostElemMas=="lsvert"){
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = LineScaleMode.VERTICAL;
								}else if(vostElemMas=="cprnd"){
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = CapsStyle.ROUND;
								}else if(vostElemMas=="cpsqr"){
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = CapsStyle.SQUARE;
								}else if(vostElemMas=="cpnone"){
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = CapsStyle.NONE;
								}else if(vostElemMas=="jnrnd"){
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = JointStyle.ROUND;
								}else if(vostElemMas=="jnbev"){
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = JointStyle.BEVEL;
								}else if(vostElemMas=="jnmit"){
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = JointStyle.MITER;
								}else if (vostElemMas != "linSt") {
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = vostElemMas;
								}
							}
							if (vostTypMas == "bgFl") {
								if (vostElemMas != "bgFl") {
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = vostElemMas;
								}
							}
							if (vostTypMas == "bgGrFl" && vostElemMas != "bgGrFl") {
								//Скобки необходимы для создания массива с цветами и их элементами
								if (vostElemMas == "(") {
									vostPorGrad = vostPoryadok
									if (udMassivy.length > 0) {
										forms[int(vost1ind)][int(vost2ind)][vostPorGrad] = udMassivy[udMassivy.length - 1];
										udMassivy.length -= 1;
									}else {
										forms[int(vost1ind)][int(vost2ind)][vostPorGrad] = new Array();
									}
								}else
								if (vostPorGrad != -3 && vostElemMas != ")" && vostElemMas != "(") {
									vostPoryadok -= 1;
									forms[int(vost1ind)][int(vost2ind)][vostPorGrad][forms[int(vost1ind)][int(vost2ind)][vostPorGrad].length] = vostElemMas;
								}else
								if (vostElemMas == ")") {
									vostPorGrad = -3;
									vostPoryadok -= 1;
								}else
								if (vostElemMas=="matrica") {
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = GrFill.matrixes;
								}else 
								if (vostElemMas == "null") {
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] =null;
								}else{
									//Для всех остальных строковых значений
									forms[int(vost1ind)][int(vost2ind)][vostPoryadok] = vostElemMas;
								}
							}
							if (vostTypMas == "movT" && vostElemMas != "movT") {
								if (vostPerTochek == 1) {
									forms[int(vost1ind)][int(vost2ind)][1].y = int(vostElemMas);
									vostPerTochek = 2;
								}
								if (vostPerTochek == 0) {
									with(forms[int(vost1ind)][int(vost2ind)][1].graphics){
										lineStyle(2, 0x004080, 1);
										moveTo(0, -2);
										lineTo(0, 2);
										moveTo(-2, 0);
										lineTo(2, 0);
										lineStyle(2, 0x004080, 0);
										beginFill(0x000000, 0);
										moveTo(-2, -2);
										lineTo(2, -2);
										lineTo(2, 2);
										lineTo( -2, 2);
										endFill();
									}
									forms[int(vost1ind)][int(vost2ind)][1].addEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
									forms[int(vost1ind)][int(vost2ind)][1].addEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
									forms[int(vost1ind)][int(vost2ind)][1].x = int(vostElemMas);
									vostPerTochek = 1;
								}
							}
							if (vostTypMas == "linT" && vostElemMas != "linT") {
								if (vostPerTochek == 1) {
									forms[int(vost1ind)][int(vost2ind)][1].y = int(vostElemMas);
									vostPerTochek = 2;
								}
								if (vostPerTochek == 0) {
									with(forms[int(vost1ind)][int(vost2ind)][1].graphics){
										lineStyle(2, 0x2B9411, 1);
										moveTo(0, -2);
										lineTo(0, 2);
										moveTo(-2, 0);
										lineTo(2, 0);
										lineStyle(2, 0x004080, 0);
										beginFill(0x000000, 0);
										moveTo(-2, -2);
										lineTo(2, -2);
										lineTo(2, 2);
										lineTo( -2, 2);
										endFill();
									}
									forms[int(vost1ind)][int(vost2ind)][1].addEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
									forms[int(vost1ind)][int(vost2ind)][1].addEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
									forms[int(vost1ind)][int(vost2ind)][1].x = int(vostElemMas);
									vostPerTochek = 1;
								}
							}
							if (vostTypMas == "curvT" && vostElemMas != "curvT") {
								if (vostPerTochek == 3) {
									forms[int(vost1ind)][int(vost2ind)][1].y = int(vostElemMas);
									vostPerTochek = 4;
								}
								if (vostPerTochek == 2) {
									if (udMassivy.length > 0) {
										forms[int(vost1ind)][int(vost2ind) + 1] = udMassivy[udMassivy.length - 1];
										udMassivy.length -= 1;
									}else {
										forms[int(vost1ind)][int(vost2ind) + 1] = new Array();
									}
									forms[int(vost1ind)][int(vost2ind) + 1][0] = "contrl";
									vostPoryadok += 1;
									forms[int(vost1ind)][int(vost2ind)][1].x = int(vostElemMas);
									vostPerTochek = 3;
								}
								if (vostPerTochek == 1) {
									forms[int(vost1ind)][int(vost2ind)][2].y = int(vostElemMas);
									vostPerTochek = 2;
								}
								if (vostPerTochek == 0) {
									with(forms[int(vost1ind)][int(vost2ind)][1].graphics){
										lineStyle(2, 0xB411D4, 1);
										moveTo(0, -2);
										lineTo(0, 2);
										moveTo(-2, 0);
										lineTo(2, 0);
										lineStyle(2, 0x004080, 0);
										beginFill(0x000000, 0);
										moveTo(-2, -2);
										lineTo(2, -2);
										lineTo(2, 2);
										lineTo( -2, 2);
										endFill();
									}
									forms[int(vost1ind)][int(vost2ind)][1].addEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
									forms[int(vost1ind)][int(vost2ind)][1].addEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
									if (udTochki.length > 0) {
										forms[int(vost1ind)][int(vost2ind)][2] = udTochki[udTochki.length - 1];
										udTochki.length -= 1;
									}else {
										forms[int(vost1ind)][int(vost2ind)][2] = new Sprite();
									}
									forms[int(vost1ind)][0].addChild(forms[int(vost1ind)][int(vost2ind)][2]);
									forms[int(vost1ind)][int(vost2ind)][2].x = int(vostElemMas);
									with(forms[int(vost1ind)][int(vost2ind)][2].graphics){
										lineStyle(2, 0xFF1212, 100);
										moveTo(0, -2);
										lineTo(0, 2);
										moveTo(-2, 0);
										lineTo(2, 0);
										lineStyle(2, 0x004080, 0);
										beginFill(0x000000, 0);
										moveTo(-2, -2);
										lineTo(2, -2);
										lineTo(2, 2);
										lineTo( -2, 2);
										endFill();
									}
									forms[int(vost1ind)][int(vost2ind)][2].addEventListener(MouseEvent.MOUSE_DOWN, tochkiPress);
									forms[int(vost1ind)][int(vost2ind)][2].addEventListener(MouseEvent.MOUSE_UP, tochkiRelease);
									vostPerTochek = 1;
								}
							}
							vostElemMas = "";
						}
						if (vostStr.charAt(i) == ";") {
							Poryadok.telo.text = int(vost2ind) + 1;
							Poryadok.telo.setTextFormat(txFormat2);
							vostElemMas = "";
							vostTekPoz = -1;
							vost1ind = "";
							vost2ind = "";
							vostTypMas = "";
							vostPoryadok = 0;
							vostPer = 0;
							vostPerTochek = 0;
							vostPerekluch = 0;
						}
					}
					if (i == vostStr.length - 1) {
						NomerFormy.telo.text = vostTekForma;
						NomerFormy.telo.setTextFormat(txFormat2);
						risovanie();
						vostTekForma = "";
					}
				}
				vostPerekluch = 0;
			}
			vostVklFunc = 0;
		}
		private function VostRisRelease(e:MouseEvent):void {
			with (VostRis.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
		}
		internal function nachAnimPress(e:MouseEvent):void {
			with (NachAnim.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0xE02AC2, 1);
				drawRect(3, 3, 14, 14);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (forms.length > 0 && animRisunok.length==0) {
				animPer = 1;
				animaciya = true;
				Out.telo.text = "Начало Анимации";
				Out.telo.setTextFormat(txFormat2);
				for (var i:int = 0; i < forms.length; i++) {
					if (udMassivy.length > 0) {
						animRisunok[i] = udMassivy[udMassivy.length - 1];
						udMassivy.length -= 1;
					}else {
						animRisunok[i] = new Array();
					}
					for (var j:int = 1; j < forms[i].length; j++) {
						if (forms[i][j][0] == "linSt") { 
							if (udMassivy.length > 0) {
								animRisunok[i][j] = udMassivy[udMassivy.length - 1];
								udMassivy.length -= 1;
							}else {
								animRisunok[i][j] = new Array();
							}
							animRisunok[i][j][0] = "linSt";
							animRisunok[i][j][1] = forms[i][j][2];
							animRisunok[i][j][2] = forms[i][j][3];
							animRisunok[i][j][3] = forms[i][j][4];
							animRisunok[i][j][4] = forms[i][j][5];
							animRisunok[i][j][5] = forms[i][j][6];
							animRisunok[i][j][6] = forms[i][j][7];
							animRisunok[i][j][7] = forms[i][j][8];
							animRisunok[i][j][8] = forms[i][j][9];
						}
						if (forms[i][j][0] == "bgFl") { 
							if (udMassivy.length > 0) {
								animRisunok[i][j] = udMassivy[udMassivy.length - 1];
								udMassivy.length -= 1;
							}else {
								animRisunok[i][j] = new Array();
							}
							animRisunok[i][j][0] = "bgFl";
							animRisunok[i][j][1] = forms[i][j][2];
							animRisunok[i][j][2] = forms[i][j][3];
						}
						if (forms[i][j][0] == "bgGrFl") { 
							if (udMassivy.length > 0) {
								animRisunok[i][j] = udMassivy[udMassivy.length - 1];
								udMassivy.length -= 1;
							}else {
								animRisunok[i][j] = new Array();
							}
							animRisunok[i][j][0] = "bgGrFl";
							animRisunok[i][j][1] = forms[i][j][2];
							animRisunok[i][j][2] = forms[i][j][3];
							animRisunok[i][j][3] = forms[i][j][4];
							animRisunok[i][j][4] = forms[i][j][5];
							animRisunok[i][j][5] = forms[i][j][6];
							animRisunok[i][j][6] = forms[i][j][7];
							animRisunok[i][j][7] = forms[i][j][8];
							animRisunok[i][j][8] = forms[i][j][9];
						}
						if (forms[i][j][0] == "movT") {
							if (udMassivy.length > 0) {
								animRisunok[i][j] = udMassivy[udMassivy.length - 1];
								udMassivy.length -= 1;
							}else {
								animRisunok[i][j] = new Array();
							}
							animRisunok[i][j][0] = "movT";
							animRisunok[i][j][1] = forms[i][j][1].x;
							animRisunok[i][j][2] = forms[i][j][1].y;
							animRisunok[i][j][3] = forms[i][j][1].x;
							animRisunok[i][j][4] = forms[i][j][1].y;
						}
						if (forms[i][j][0] == "linT") {
							if (udMassivy.length > 0) {
								animRisunok[i][j] = udMassivy[udMassivy.length - 1];
								udMassivy.length -= 1;
							}else {
								animRisunok[i][j] = new Array();
							}
							animRisunok[i][j][0] = "linT";
							animRisunok[i][j][1] = forms[i][j][1].x;
							animRisunok[i][j][2] = forms[i][j][1].y;
							animRisunok[i][j][3] = forms[i][j][1].x;
							animRisunok[i][j][4] = forms[i][j][1].y;
						}
						if (forms[i][j][0] == "curvT") {
							if (udMassivy.length > 0) {
								animRisunok[i][j] = udMassivy[udMassivy.length - 1];
								udMassivy.length -= 1;
							}else {
								animRisunok[i][j] = new Array();
							}
							if (udMassivy.length > 0) {
								animRisunok[i][j+1] = udMassivy[udMassivy.length - 1];
								udMassivy.length -= 1;
							}else {
								animRisunok[i][j+1] = new Array();
							}
							animRisunok[i][j][0] = "curvT";
							animRisunok[i][j][1] = forms[i][j][1].x;
							animRisunok[i][j][2] = forms[i][j][1].y;
							animRisunok[i][j][3] = forms[i][j][1].x;
							animRisunok[i][j][4] = forms[i][j][1].y;
							animRisunok[i][j + 1][0] = "contrl";
							animRisunok[i][j + 1][1] = forms[i][j][2].x;
							animRisunok[i][j + 1][2] = forms[i][j][2].y;
							animRisunok[i][j + 1][3] = forms[i][j][2].x;
							animRisunok[i][j + 1][4] = forms[i][j][2].y;
						}
						if (forms[i][j][0] == "endFl") {
							if (udMassivy.length > 0) {
								animRisunok[i][j] = udMassivy[udMassivy.length - 1];
								udMassivy.length -= 1;
							}else {
								animRisunok[i][j] = new Array();
							}
							animRisunok[i][j][0] = "endFl";
						}
					}
				}
			}
		}
		internal function nachAnimRelease(e:MouseEvent):void {
			with (NachAnim.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0xE02AC2, 1);
				drawRect(3, 3, 14, 14);
			}
		}
		internal function vstAnimPress(e:MouseEvent):void {
			with (VstAnim.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (animRisunok.length>0) {
				animTekNomMas = animMas.length;
				if (udMassivy.length > 0) {
					animMas[animMas.length] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					animMas[animMas.length] = new Array();
				}
				//В этом массиве будут храниться номера форм для отрисовки, первый элемент - число секунд
				if (udMassivy.length > 0) {
					animMas[animTekNomMas][0] = udMassivy[udMassivy.length - 1];
					udMassivy.length -= 1;
				}else {
					animMas[animTekNomMas][0] = new Array();
				}
				for (var i:int = 0; i < forms.length; i++) {
					for (var j:int = 1; j < forms[i].length; j++) {
						if (forms[i][j][0] == "movT" || forms[i][j][0] == "linT" || forms[i][j][0] == "curvT") {
							if (forms[i][j][1].x != animRisunok[i][j][3] || forms[i][j][1].y != animRisunok[i][j][4]) {
								//Здесь записывается число секунд анимации и первая форма для отрисовки
								if (animMas[animTekNomMas][0].length == 0) {
									animMas[animTekNomMas][0].push(Number(ChisloSek.telo.text));
									animMas[animTekNomMas][0].push(i);
									animObshSek += Number(ChisloSek.telo.text);
								}
								if (forms[i][j][1].x >= animRisunok[i][j][3]) {
									animDvizX = (forms[i][j][1].x - animRisunok[i][j][3]) / (32 * animMas[animTekNomMas][0][0]);
									animNaprX = 1;
								}else if (forms[i][j][1].x < animRisunok[i][j][3]) {
									animDvizX = (animRisunok[i][j][3] - forms[i][j][1].x) / (32 * animMas[animTekNomMas][0][0]);
									animNaprX = -1;
								}
								if (forms[i][j][1].y >= animRisunok[i][j][4]) {
									animDvizY = (forms[i][j][1].y - animRisunok[i][j][4]) / (32 * animMas[animTekNomMas][0][0]);
									animNaprY = 1;
								}else if (forms[i][j][1].y < animRisunok[i][j][4]) {
									animDvizY = (animRisunok[i][j][4] - forms[i][j][1].y) / (32 * animMas[animTekNomMas][0][0]);
									animNaprY = -1;
								}
								//Это необходимо для того, чтобы  во время следующего кадра анимации точки из предыдущей анимации не продолжали движения
								animRisunok[i][j][3] = forms[i][j][1].x;
								animRisunok[i][j][4] = forms[i][j][1].y;
								if (udMassivy.length > 0) {
									animMas[animMas.length - 1][animMas[animMas.length - 1].length] = udMassivy[udMassivy.length - 1];
									animMas[animMas.length - 1][animMas[animMas.length - 1].length-1][0] = i;
									animMas[animMas.length - 1][animMas[animMas.length - 1].length-1][1] = j;
									animMas[animMas.length - 1][animMas[animMas.length - 1].length-1][2] = animDvizX;
									animMas[animMas.length - 1][animMas[animMas.length - 1].length-1][3] = animDvizY;
									animMas[animMas.length - 1][animMas[animMas.length - 1].length-1][4] = animNaprX;
									animMas[animMas.length - 1][animMas[animMas.length - 1].length-1][5] = animNaprY;
									udMassivy.length -= 1;
								}else {
									//Номер формы, прорядок, позХ, позУ, направлениеХ, направлениеУ
									animMas[animMas.length-1][animMas[animMas.length-1].length] = new Array(i, j, animDvizX, animDvizY, animNaprX, animNaprY);
								}
								animChisloForm = 0;
								for (var k:int = 1; k < animMas[animTekNomMas][0].length; k++) {
									if (animMas[animTekNomMas][0][k] == i) {
										animChisloForm = 1;
									}
									if (k == animMas[animTekNomMas][0].length - 1) {
										if (animChisloForm == 0) {
											animMas[animTekNomMas][0].push(i);
										}
									}
								}
							}
						}
						if (forms[i][j][0] == "contrl") {
							if (forms[i][j - 1][2].x != animRisunok[i][j][3] || forms[i][j - 1][2].y != animRisunok[i][j][4]) {
								if (animMas[animTekNomMas][0].length == 0) {
									animMas[animTekNomMas][0].push(Number(ChisloSek.telo.text));
									animMas[animTekNomMas][0].push(i);
									animObshSek += Number(ChisloSek.telo.text);
								}
								if (forms[i][j-1][2].x >= animRisunok[i][j][3]) {
									animDvizX = (forms[i][j-1][2].x - animRisunok[i][j][3]) / (32 * animMas[animTekNomMas][0][0]);
									animNaprX = 1;
								}else if (forms[i][j-1][2].x < animRisunok[i][j][3]) {
									animDvizX = (animRisunok[i][j][3] - forms[i][j-1][2].x) / (32 * animMas[animTekNomMas][0][0]);
									animNaprX = -1;
								}
								if (forms[i][j-1][2].y >= animRisunok[i][j][4]) {
									animDvizY = (forms[i][j-1][2].y - animRisunok[i][j][4]) / (32 * animMas[animTekNomMas][0][0]);
									animNaprY = 1;
								}else if (forms[i][j-1][2].y < animRisunok[i][j][4]) {
									animDvizY = (animRisunok[i][j][4] - forms[i][j-1][2].y) / (32 * animMas[animTekNomMas][0][0]);
									animNaprY = -1;
								}
								animRisunok[i][j][3] = forms[i][j - 1][2].x;
								animRisunok[i][j][4] = forms[i][j - 1][2].y;
								if (udMassivy.length > 0) {
									animMas[animMas.length - 1][animMas[animMas.length - 1].length] = udMassivy[udMassivy.length - 1];
									animMas[animMas.length - 1][animMas[animMas.length - 1].length-1][0] = i;
									animMas[animMas.length - 1][animMas[animMas.length - 1].length-1][1] = j;
									animMas[animMas.length - 1][animMas[animMas.length - 1].length-1][2] = animDvizX;
									animMas[animMas.length - 1][animMas[animMas.length - 1].length-1][3] = animDvizY;
									animMas[animMas.length - 1][animMas[animMas.length - 1].length-1][4] = animNaprX;
									animMas[animMas.length - 1][animMas[animMas.length - 1].length-1][5] = animNaprY;
									udMassivy.length -= 1;
								}else {
									//Номер формы, прорядок, позХ, позУ, направлениеХ, направлениеУ
									animMas[animMas.length-1][animMas[animMas.length-1].length] = new Array(i, j, animDvizX, animDvizY, animNaprX, animNaprY);
								}
								animChisloForm = 0;
								for (k = 1; k < animMas[animTekNomMas][0].length; k++) {
									if (animMas[animTekNomMas][0][k] == i) {
										animChisloForm = 1;
									}
									if (k == animMas[animTekNomMas][0].length - 1) {
										if (animChisloForm == 0) {
											animMas[animTekNomMas][0].push(i);
										}
									}
								}
							}
						}
					}
				}
			}
			animIsxKod.push(animObshSek + " Анимация");
			Out.telo.text = "Начало Анимации" + "\n";
			for (k = 0; k < animIsxKod.length; k++) {
				Out.telo.appendText(k + " " + animIsxKod[k] + "\n");
			}
			Out.telo.setTextFormat(txFormat2);
		}
		internal function vstAnimRelease(e:MouseEvent):void {
			with (VstAnim.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
		}
		internal function udAnimPress(e:MouseEvent):void {
			with (UdalAnim.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if ( animMas.length>0) {
				for (var i:int = 0; i < animMas[animMas.length - 1].length; i++) {
					animMas[animMas.length - 1][i].length = 0;
					udMassivy.push(animMas[animMas.length - 1][i]);
				}
				animMas[animMas.length - 1].length = 0;
				udMassivy.push(animMas[animMas.length - 1]);
				animMas.length -= 1;
				animIsxKod.length -= 1;
				Out.telo.text = "Начало Анимации" + "\n";
				for (var k:int = 0; k < animIsxKod.length; k++) {
					Out.telo.appendText(k + " " + animIsxKod[k] + "\n");
				}
				Out.telo.setTextFormat(txFormat2);
			}
		}
		internal function udAnimRelease(e:MouseEvent):void {
			with (UdalAnim.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
		}
		internal function plAnimPress(e:MouseEvent):void {
			with (PlayAnim.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (animMas.length>0) {
				//Циклы восстанавливают первоначальное положение рисунка
				for (var i:int = 0; i < animRisunok.length; i++) {
					for (var j:int = 1; j < animRisunok[i].length; j++) {
						if (forms[i][j][0] == "movT"||forms[i][j][0] == "linT") {
							animRisunok[i][j][3] = animRisunok[i][j][1];
							animRisunok[i][j][4] = animRisunok[i][j][2];
						}
						if (forms[i][j][0] == "curvT") {
							animRisunok[i][j][3] = animRisunok[i][j][1];
							animRisunok[i][j][4] = animRisunok[i][j][2];
							animRisunok[i][j + 1][3] = animRisunok[i][j + 1][1];
							animRisunok[i][j + 1][4] = animRisunok[i][j + 1][2];
						}
					}
				}
				animNomerAnimacii = 0;
				animSchetchik = 0;
				animSchetKon = animMas[0][0][0] * 32;
			}
		}
		internal function plAnimRelease(e:MouseEvent):void {
			with (PlayAnim.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
		}
		internal function ochAnimPress(e:MouseEvent):void {
			with (OchistAnim.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0xE02AC2, 1);
				drawRect(3, 3, 14, 14);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (animRisunok.length>0) {
				for (var i:int = 0; i < animRisunok.length; i++) {
					for (var j:int = 1; j < animRisunok[i].length; j++) {
						animRisunok[i][j].length = 0;
						udMassivy.push(animRisunok[i][j]);
					}
					animRisunok[i].length = 0;
					udMassivy.push(animRisunok[i]);
					if (i == animRisunok.length - 1) {
						animRisunok.length = 0;
					}
				}
				for (i = 0; i < animMas.length; i++) {
					for (j = 0; j < animMas[i].length; j++) {
						animMas[i][j].length = 0;
						udMassivy.push(animMas[i][j]);
					}
					animMas[i].length = 0;
					udMassivy.push(animMas[i]);
					if (i == animMas.length - 1) {
						animMas.length = 0;
					}
				}
				animIsxKod.length = 0;
				animObshSek = 0;
				Out.telo.text = "";
				Out.telo.setTextFormat(txFormat2);
				animPer = 0;
				animaciya = false;
			}
		}
		internal function ochAnimRelease(e:MouseEvent):void {
			with (OchistAnim.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(2, 0xE02AC2, 1);
				drawRect(3, 3, 14, 14);
			}
		}
		internal function vivAnimPress(e:MouseEvent):void {
			with (VivodAnim.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(0.5, 0x000000, 1);
				moveTo(10, 5);
				lineTo(10, 15);
				moveTo(5, 10);
				lineTo(15, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
				lineStyle(1, 0xFBF548, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
			}
			if (animRisunok.length>0) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				minX = 10000;
				minY = 10000;
				maxX = -10000;
				maxY = -10000;
				X0 = 0;
				Y0 = 0;
				for (var i:int = 0; i < forms.length; i++) {
					minX = Math.min(minX, formsX0[i]);
					minY = Math.min(minY, formsY0[i]);
					maxX = Math.max(maxX, formsX0[i]);
					maxY = Math.max(maxY, formsY0[i]);
				}
				minX = Math.round(minX);
				minY = Math.round(minY);
				maxX = Math.round(maxX);
				maxY = Math.round(maxY);
				X0 = Math.round((maxX - minX) / 2 + minX);
				Y0 = Math.round((maxY - minY) / 2 + minY);
				formsVivX.length = 0;
				formsVivY.length = 0;
				for (j = 0; j < forms.length; j++) {
					if (formsX0[j] < X0) {
						formsVivX[j] = Math.round( -1 * (X0 - formsX0[j]));
					}else  if (formsX0[j] >= X0) {
						formsVivX[j] = Math.round(formsX0[j] - X0);
					}
					if (formsY0[j] < Y0) {
						formsVivY[j] = Math.round(-1 * (Y0 - formsY0[j]));
					}else  if (formsY0[j] >= Y0) {
						formsVivY[j] = Math.round(formsY0[j] - Y0);
					}
				}
				animImyaRisunka = NazvRisunka.telo.text;
				animImyaMassiva = animImyaRisunka+"AnimMas";
				for (i = 0; i < animRisunok.length; i++) {
					formsVivKod[i] = "";
					if (i == 0) {
						formsVivKod[0] +="import flash.display.Shape;"+ "\n"+
						"import flash.display.Sprite;"+ "\n"+
						"import flash.geom.Matrix;"+ "\n"+
						"import flash.geom.Point;" + "\n" +
						"import flash.events.Event;"+ "\n" +
						"import flash.display.GradientType;"+ "\n"+
						"import flash.display.InterpolationMethod;"+ "\n"+
						"import flash.display.SpreadMethod;"+ "\n"+
						"import flash.display.LineScaleMode;"+ "\n"+
						"import flash.display.CapsStyle;"+ "\n"+
						"import flash.display.JointStyle;" + "\n" + "\n";
						formsVivKod[0] += "private var "+NazvRisunka.telo.text+":Sprite = new Sprite();" + "\n";
						formsVivKod[0] += "internal var linSt5True:Boolean = true;" + "\n";
						formsVivKod[0] += "internal var linSt5False:Boolean = false;" + "\n";
						formsVivKod[0] += "internal var linSt6Norm:String=LineScaleMode.NORMAL;" + "\n";
						formsVivKod[0] += "internal var linSt6None:String=LineScaleMode.NONE;" + "\n";
						formsVivKod[0] += "internal var linSt6Vert:String=LineScaleMode.VERTICAL;" + "\n";
						formsVivKod[0] += "internal var linSt6Hor:String=LineScaleMode.HORIZONTAL;" + "\n";
						formsVivKod[0] += "internal var linSt7Rd:String=CapsStyle.ROUND;" + "\n";
						formsVivKod[0] += "internal var linSt7None:String=CapsStyle.NONE;" + "\n";
						formsVivKod[0] += "internal var linSt7Sq:String=CapsStyle.SQUARE;" + "\n";
						formsVivKod[0] += "internal var linSt8Bev:String = JointStyle.BEVEL; " + "\n";
						formsVivKod[0] += "internal var linSt8Rd:String=JointStyle.ROUND;" + "\n";
						formsVivKod[0] += "internal var linSt8Mit:String=JointStyle.MITER;" + "\n";
						formsVivKod[0] += "internal var gr2Lin:String=GradientType.LINEAR;" + "\n";
						formsVivKod[0] += "internal var gr2Rad:String=GradientType.RADIAL" + "\n";
						formsVivKod[0] += "internal var matrica:Matrix = new Matrix();" + "\n";
						formsVivKod[0] += "internal var gr7Pad:String=SpreadMethod.PAD;" + "\n";
						formsVivKod[0] += "internal var gr7Ref:String=SpreadMethod.REFLECT;" + "\n";
						formsVivKod[0] += "internal var gr7Rep:String=SpreadMethod.REPEAT;" + "\n";
						formsVivKod[0] += "internal var gr8Rgb:String=InterpolationMethod.RGB;" + "\n";
						formsVivKod[0] += "internal var gr8LinRgb:String=InterpolationMethod.LINEAR_RGB;" + "\n";
						formsVivKod[0] += "internal var animNomerFormy:int=0;" + "\n";
						formsVivKod[0] += "internal var poraydokAnim:int=0;" + "\n";
						formsVivKod[0] += "private var "+animImyaRisunka+"form:Array = new Array();" + "\n";
						formsVivKod[0] += "private var " + animImyaRisunka + ":Array = new Array();" + "\n";
						formsVivKod[0] += "private var " + animImyaMassiva + ":Array = new Array();" + "\n" + "\n";
					}
					formsVivKod[i] += animImyaRisunka + "[" + i + "]" +"=" + "new Array();" + "\n";
					formsVivKod[i] += animImyaRisunka + "[" + i + "]"+"[0]" +"=" + "new Array();" + "\n";
					for (j = 1; j < animRisunok[i].length; j++) {
						if (animRisunok[i][j][0]=="linSt") {
							vremLinStMas.length = 0;
							if (animRisunok[i][j][4] == true) {
								vremLinStMas[5] = "linSt5True";
							}
							if (animRisunok[i][j][4] == false) {
								vremLinStMas[5] = "linSt5False";
							}
							if (animRisunok[i][j][5] == LineScaleMode.NORMAL) {
								vremLinStMas[6] = "linSt6Norm";
							}
							if (animRisunok[i][j][5] == LineScaleMode.NONE) {
								vremLinStMas[6] = "linSt6None";
							}
							if (animRisunok[i][j][5] == LineScaleMode.VERTICAL) {
								vremLinStMas[6] = "linSt6Vert";
							}
							if (animRisunok[i][j][5] == LineScaleMode.HORIZONTAL) {
								vremLinStMas[6] = "linSt6Hor";
							}
							if (animRisunok[i][j][6] == CapsStyle.NONE) {
								vremLinStMas[7] = "linSt7None";
							}
							if (animRisunok[i][j][6] == CapsStyle.ROUND) {
								vremLinStMas[7] = "linSt7Rd";
							}
							if (animRisunok[i][j][6] == CapsStyle.SQUARE) {
								vremLinStMas[7] = "linSt7Sq";
							}
							if (animRisunok[i][j][7] == JointStyle.BEVEL) {
								vremLinStMas[8] = "linSt8Bev";
							}
							if (animRisunok[i][j][7] == JointStyle.ROUND) {
								vremLinStMas[8] = "linSt8Rd";
							}
							if (animRisunok[i][j][7] == JointStyle.MITER) {
								vremLinStMas[8] = "linSt8Mit";
								vremLinStMas[9] = forms[i][j][9];
							}
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" +"=" + "new Array();" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[0]" + "=" + '"linSt";' + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[1]" + "=" + animRisunok[i][j][1] +";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[2]" + "=" + animRisunok[i][j][2] +";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[3]" + "=" + animRisunok[i][j][3] +";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[4]" + "=" + vremLinStMas[5] +";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[5]" + "=" + vremLinStMas[6] +";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[6]" + "=" + vremLinStMas[7] +";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[7]" + "=" + vremLinStMas[8] +";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[8]" + "=" + vremLinStMas[9] +";"+ "\n";
						}
						if (animRisunok[i][j][0] == "bgFl") {
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" +"=" + "new Array();" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[0]" + "=" + '"bgFl";' + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[1]" + "=" + animRisunok[i][j][1] +";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[2]" + "=" + animRisunok[i][j][2] +";" + "\n";
						}
						if (animRisunok[i][j][0] == "bgGrFl") {
							vremGrFillMas[3] = "[";
							vremGrFillMas[4] = "[";
							vremGrFillMas[5] = "[";
							for (var m:int = 0; m < forms[i][j][3].length; m++) {
								vremGrFillMas[3]+= forms[i][j][3][m];
								vremGrFillMas[4]+= forms[i][j][4][m];
								vremGrFillMas[5] += forms[i][j][5][m];
								if (m < forms[i][j][3].length - 1) {
									vremGrFillMas[3] += ",";
									vremGrFillMas[4] += ",";
									vremGrFillMas[5] += ",";
								}
							}
							vremGrFillMas[3] += "]";
							vremGrFillMas[4] += "]";
							vremGrFillMas[5] += "]";
							if (animRisunok[i][j][5] != null) {
								vremGrFillMas[6] = "matrica.createGradientBox(" + formsGrBox[i][0] + "," + formsGrBox[i][1] + "," + formsGrBox[i][2] + "," + formsGrBox[i][3] + "," + formsGrBox[i][4]+ ");";
								formsVivKod[i] += vremGrFillMas[6]+ "\n";
							}else {
								vremGrFillMas[6] = "null";
							}
							if (animRisunok[i][j][1] == GradientType.LINEAR) {
								vremGrFillMas[2] = "gr2Lin";
							}
							if (animRisunok[i][j][1] == GradientType.RADIAL) {
								vremGrFillMas[2] = "gr2Rad";
							}
							if (animRisunok[i][j][5] != null) {
								vremGrFillMas[6] = "matrica"
							}else {
								vremGrFillMas[6] = "null";
							}
							if (animRisunok[i][j][6] == SpreadMethod.PAD) {
								vremGrFillMas[7]="gr7Pad"
							}
							if (animRisunok[i][j][6] == SpreadMethod.REFLECT) {
								vremGrFillMas[7]="gr7Ref"
							}
							if (animRisunok[i][j][6] == SpreadMethod.REPEAT) {
								vremGrFillMas[7]="gr7Rep"
							}
							if (animRisunok[i][j][7] == InterpolationMethod.LINEAR_RGB) {
								vremGrFillMas[8] = "gr8LinRgb";
							}
							if (animRisunok[i][j][7] == InterpolationMethod.RGB) {
								vremGrFillMas[8] = "gr8Rgb";
							}
							vremGrFillMas[9] = animRisunok[i][j][8];
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" +"=" + "new Array();" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[0]" + "=" + '"bgGrFl";' + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[1]" + "=" + vremGrFillMas[2] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[2]" + "=" + vremGrFillMas[3] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[3]" + "=" + vremGrFillMas[4] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[4]" + "=" + vremGrFillMas[5] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[5]" + "=" + vremGrFillMas[6] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[6]" + "=" + vremGrFillMas[7] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[7]" + "=" + vremGrFillMas[8] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[8]" + "=" + vremGrFillMas[9] + ";" + "\n";
						}
						if (animRisunok[i][j][0] == "movT") {
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" +"=" + "new Array();" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[0]" + "=" + '"movT";' + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[1]" + "=" + animRisunok[i][j][1] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[2]" + "=" + animRisunok[i][j][2] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[3]" + "=" + animRisunok[i][j][1] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[4]" + "=" + animRisunok[i][j][2] + ";" + "\n";
						}
						if (animRisunok[i][j][0] == "linT") {
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" +"=" + "new Array();" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[0]" + "=" + '"linT";' + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[1]" + "=" + animRisunok[i][j][1] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[2]" + "=" + animRisunok[i][j][2] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[3]" + "=" + animRisunok[i][j][1] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[4]" + "=" + animRisunok[i][j][2] + ";" + "\n";
						}
						if (animRisunok[i][j][0] == "curvT") {
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" +"=" + "new Array();" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[0]" + "=" + '"curvT";' + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[1]" + "=" + animRisunok[i][j][1] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[2]" + "=" + animRisunok[i][j][2] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[3]" + "=" + animRisunok[i][j][1] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" + "[4]" + "=" + animRisunok[i][j][2] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + (j + 1) + "]" +"=" + "new Array();" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + (j + 1) + "]" + "[0]" + "=" + '"contrl";' + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + (j + 1) + "]" + "[1]" + "=" + animRisunok[i][j + 1][1] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + (j + 1) + "]" + "[2]" + "=" + animRisunok[i][j + 1][2] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + (j + 1) + "]" + "[3]" + "=" + animRisunok[i][j + 1][1] + ";" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + (j + 1) + "]" + "[4]" + "=" + animRisunok[i][j + 1][2] + ";" + "\n";
						}
						if (animRisunok[i][j][0] == "endFl") {
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" +"=" + "new Array();" + "\n";
							formsVivKod[i] += animImyaRisunka + "[" + i + "]" + "[" + j + "]" +"[0]"+ "=" + '"endFl";' + "\n";
						}
					}
					formsVivKod[i] += animImyaRisunka + "form[" + i + "] = new Sprite();" + "\n";
					formsVivKod[i] += NazvRisunka.telo.text+".addChild("+animImyaRisunka+"form[" + i + "]);" + "\n";
					formsVivKod[i] += animImyaRisunka+"form[" + i + "].x=" + formsVivX[i] + ";" + "\n";
					formsVivKod[i] += animImyaRisunka+"form[" + i + "].y=" + formsVivY[i] + ";" + "\n";
				}
				//Здесь отдельный цикл формирует массив с секундой и номерами форм для отрисовки
				for (i = 0; i < animMas.length; i++) {
					formsVivKod[formsVivKod.length - 1] += animImyaMassiva + "[" + i + "]" +"=" + "new Array();" + "\n";
					formsVivKod[formsVivKod.length - 1] += animImyaMassiva + "[" + i + "]" + "[0]" +"=" + "new Array("
					for (var d:int = 0; d < animMas[i][0].length; d++) {
						formsVivKod[formsVivKod.length - 1] += animMas[i][0][d];
						if (d < animMas[i][0].length - 1) {
							formsVivKod[formsVivKod.length - 1] += ",";
						}
					}
					formsVivKod[formsVivKod.length - 1] +=");"+ "\n";
					for (j = 1; j < animMas[i].length; j++) {
						formsVivKod[formsVivKod.length - 1] += animImyaMassiva + "[" + i + "]" + "[" + j + "]" +"=" + "new Array(" + animMas[i][j][0] + "," + animMas[i][j][1] + "," + animMas[i][j][2] + "," + animMas[i][j][3] + "," + animMas[i][j][4] + "," + animMas[i][j][5] + ");" + "\n";
					}
				}
				formsVivKod[formsVivKod.length - 1] += "addChild("+NazvRisunka.telo.text+");" + "\n" + "\n";
				formsVivKod[formsVivKod.length - 1] +="//Этот код запускает анимацию рисунка"+ "\n";
				formsVivKod[formsVivKod.length - 1] += animImyaRisunka+"[0][0][0] = 0;" + "\n";
				formsVivKod[formsVivKod.length - 1] += animImyaRisunka + "[0][0][1] = " + animImyaMassiva + "[0][0][0] * 32;" + "\n";
				formsVivKod[formsVivKod.length - 1] += animImyaRisunka + "[0][0][2] = 0;" + "\n";
				formsVivKod[formsVivKod.length - 1] += "for (var i:int = 0; i < " + animImyaRisunka + ".length; i++) {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "	for (var j:int = 1; j < " + animImyaRisunka + "[i].length; j++) {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "		if ("+animImyaRisunka+"[i][j][0] ==" + '"movT"' + "||"+animImyaRisunka+"[i][j][0] ==" + '"linT"' + ") {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "			"+animImyaRisunka+"[i][j][3] = "+animImyaRisunka+"[i][j][1];" + "\n";
				formsVivKod[formsVivKod.length - 1] += "			"+animImyaRisunka+"[i][j][4] = "+animImyaRisunka+"[i][j][2];" + "\n";
				formsVivKod[formsVivKod.length - 1] += "		}" + "\n";
				formsVivKod[formsVivKod.length - 1] += "		if ("+animImyaRisunka+"[i][j][0] ==" + '"curvT"' + ") {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "			"+animImyaRisunka+"[i][j][3] = "+animImyaRisunka+"[i][j][1];" + "\n";
				formsVivKod[formsVivKod.length - 1] += "			"+animImyaRisunka+"[i][j][4] = "+animImyaRisunka+"[i][j][2];" + "\n";
				formsVivKod[formsVivKod.length - 1] += "			"+animImyaRisunka+"[i][j + 1][3] = "+animImyaRisunka+"[i][j + 1][1];" + "\n";
				formsVivKod[formsVivKod.length - 1] += "			"+animImyaRisunka+"[i][j + 1][4] = "+animImyaRisunka+"[i][j + 1][2];" + "\n";
				formsVivKod[formsVivKod.length - 1] += "		}" + "\n";
				formsVivKod[formsVivKod.length - 1] += "	}" + "\n";
				formsVivKod[formsVivKod.length - 1] += "}" + "\n" + "\n";
				formsVivKod[formsVivKod.length - 1] += "//Массивы рисунка и форм" + "\n";
				formsVivKod[formsVivKod.length - 1] += "private function risovanie(a:Array,b:Array):void {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "	for (var i:int = 0; i < a.length; i++) {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "	b[i].graphics.clear();" + "\n";
				formsVivKod[formsVivKod.length - 1] += "		for (var j:int = 1; j < a[i].length; j++) {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "			if (a[i][j][0] == "+'"linSt"'+") {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="				b[i].graphics.lineStyle(a[i][j][1], a[i][j][2], a[i][j][3], a[i][j][4], a[i][j][5], a[i][j][6], a[i][j][7], a[i][j][8]);"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			if (a[i][j][0] == "+'"bgFl"'+") {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="				b[i].graphics.beginFill(a[i][j][1], a[i][j][2]);"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			if (a[i][j][0] == "+'"bgGrFl"'+") {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="				b[i].graphics.beginGradientFill(a[i][j][1], a[i][j][2], a[i][j][3], a[i][j][4], a[i][j][5], a[i][j][6], a[i][j][7], a[i][j][8]);"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			}"+ "\n";
				formsVivKod[formsVivKod.length - 1] += "			if (a[i][j][0] ==" + '"movT"' + ") {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "				b[i].graphics.moveTo(a[i][j][1], a[i][j][2]);"+ "\n";
				formsVivKod[formsVivKod.length - 1] += "			}" + "\n";
				formsVivKod[formsVivKod.length - 1] += "			if(a[i][j][0] ==" + '"linT"' + ") {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "				b[i].graphics.lineTo(a[i][j][1], a[i][j][2]);"+ "\n";
				formsVivKod[formsVivKod.length - 1] += "			}" + "\n";
				formsVivKod[formsVivKod.length - 1] += "			if (a[i][j][0] ==" + '"curvT"' + ") {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "				b[i].graphics.curveTo(a[i][j + 1][3], a[i][j + 1][4], a[i][j][3], a[i][j][4]);"+ "\n";
				formsVivKod[formsVivKod.length - 1] += "			}" + "\n";
				formsVivKod[formsVivKod.length - 1] +="			if (a[i][j][0] == "+'"endFl"'+") {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="				b[i].graphics.endFill();"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			}"+ "\n";
				formsVivKod[formsVivKod.length - 1] += "		}" + "\n";
				formsVivKod[formsVivKod.length - 1] += "	}" + "\n";
				formsVivKod[formsVivKod.length - 1] += "}" + "\n" + "\n";
				formsVivKod[formsVivKod.length - 1] += "//Массивы: рисунка, анимации, форм" + "\n";
				formsVivKod[formsVivKod.length - 1] += "private function animRisovanie(b:Array,c:Array,d:Array):void {" + "\n";
				formsVivKod[formsVivKod.length - 1] += " poraydokAnim = b[0][0][2];" + "\n";
				formsVivKod[formsVivKod.length - 1] += "	for (var i:int = 1; i < c[poraydokAnim].length; i++) {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "		animNomerFormy = c[poraydokAnim][i][0];" + "\n";
				formsVivKod[formsVivKod.length - 1] +="		for (var j:int = 1; j < b[animNomerFormy].length; j++) {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			if ((b[animNomerFormy][j][0] == "+'"movT"'+"||b[animNomerFormy][j][0] == "+'"linT"'+"||b[animNomerFormy][j][0] == "+'"curvT"'+"||b[animNomerFormy][j][0] == "+'"contrl"'+")&& c[poraydokAnim][i][1]==j) {"+ "\n";
				formsVivKod[formsVivKod.length - 1] += "				if (c[poraydokAnim][i][4] == 1) {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "					b[animNomerFormy][j][3] += c[poraydokAnim][i][2];" + "\n"; 
				formsVivKod[formsVivKod.length - 1] +="				}"+ "\n";
				formsVivKod[formsVivKod.length - 1] += "				if (c[poraydokAnim][i][5] == 1) {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "					b[animNomerFormy][j][4] += c[poraydokAnim][i][3];" + "\n";
				formsVivKod[formsVivKod.length - 1] +="				}"+ "\n";
				formsVivKod[formsVivKod.length - 1] += "				if (c[poraydokAnim][i][4] == -1) {" + "\n";
				formsVivKod[formsVivKod.length - 1] += "					b[animNomerFormy][j][3] -= c[poraydokAnim][i][2];" + "\n";
				formsVivKod[formsVivKod.length - 1] +="				}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="				if (c[poraydokAnim][i][5] == -1) {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					b[animNomerFormy][j][4] -= c[poraydokAnim][i][3];"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="				}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="		}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="		if (i == c[poraydokAnim].length - 1) {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			//Порядок начинается со второго элемента массива, так как первый элемент - число секунд"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			for (var k:int = 1; k < c[poraydokAnim][0].length; k++) {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="				animNomerFormy = c[poraydokAnim][0][k];"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="				d[animNomerFormy].graphics.clear();"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="				for (j = 1; j < b[animNomerFormy].length; j++) {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					if (b[animNomerFormy][j][0] == "+'"linSt"'+") {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="						d[animNomerFormy].graphics.lineStyle(b[animNomerFormy][j][1], b[animNomerFormy][j][2], b[animNomerFormy][j][3], b[animNomerFormy][j][4], b[animNomerFormy][j][5], b[animNomerFormy][j][6], b[animNomerFormy][j][7], b[animNomerFormy][j][8]);"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					if (b[animNomerFormy][j][0] == "+'"bgFl"'+") {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="						d[animNomerFormy].graphics.beginFill(b[animNomerFormy][j][1], b[animNomerFormy][j][2]);"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					if (b[animNomerFormy][j][0] == "+'"bgGrFl"'+") {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="						d[animNomerFormy].graphics.beginGradientFill(b[animNomerFormy][j][1], b[animNomerFormy][j][2], b[animNomerFormy][j][3], b[animNomerFormy][j][4], b[animNomerFormy][j][5], b[animNomerFormy][j][6], b[animNomerFormy][j][7], b[animNomerFormy][j][8]);"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					if (b[animNomerFormy][j][0] == "+'"movT"'+") {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="						d[animNomerFormy].graphics.moveTo(b[animNomerFormy][j][3], b[animNomerFormy][j][4]);"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					if (b[animNomerFormy][j][0] == "+'"linT"'+") {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="						d[animNomerFormy].graphics.lineTo(b[animNomerFormy][j][3], b[animNomerFormy][j][4]);"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					if (b[animNomerFormy][j][0] == "+'"curvT"'+") {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="						d[animNomerFormy].graphics.curveTo(b[animNomerFormy][j + 1][3], b[animNomerFormy][j + 1][4], b[animNomerFormy][j][3], b[animNomerFormy][j][4]);"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					if (b[animNomerFormy][j][0] == "+'"endFl"'+") {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="						d[animNomerFormy].graphics.endFill();"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="					}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="				}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="		}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="	}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="	if (b[0][0][0] == b[0][0][1] - 1) {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="		if (b[0][0][2] < c.length - 1) {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			b[0][0][2] += 1;"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="			b[0][0][1] += c[b[0][0][2]][0][0] * 32;"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="		}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="	}"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="}"+ "\n"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="	if ("+animImyaRisunka+"[0][0][0] >= 0 && "+animImyaRisunka+"[0][0][0] < "+animImyaRisunka+"[0][0][1]) {"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="		animRisovanie("+animImyaRisunka+","+animImyaMassiva+","+animImyaRisunka+"form);"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="		"+animImyaRisunka+"[0][0][0] += 1;"+ "\n";
				formsVivKod[formsVivKod.length - 1] +="	}"+ "\n";
				Out.telo.text = "";
				for (j = 0; j < animRisunok.length; j++) {
					Out.telo.appendText(formsVivKod[j] + "\n");
				}
				Out.telo.setTextFormat(txFormat2);
			}
		}
		internal function vivAnimRelease(e:MouseEvent):void {
			with (VivodAnim.graphics) {
				clear();
				lineStyle(1, 0xFBF548, 0);
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 20, 20, 10);
				endFill();
				lineStyle(0.5, 0x000000, 1);
				moveTo(10, 5);
				lineTo(10, 15);
				moveTo(5, 10);
				lineTo(15, 10);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				drawRect(3, 3, 14, 14);
			}
		}
		internal function strochPlusPress(e:MouseEvent):void {
			with (strochkaPlus.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(7, 3);
				lineTo(7, 11);
				moveTo(3, 7);
				lineTo(11, 7);
				lineStyle(2, 0xFF1111, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
			}
			Out.telo.scrollV += 1;
		}
		internal function strochPlusRelease(e:MouseEvent):void {
			with (strochkaPlus.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(7, 3);
				lineTo(7, 11);
				moveTo(3, 7);
				lineTo(11, 7);
			}
		}
		internal function strochMinusPress(e:MouseEvent):void {
			with (strochkaMinus.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(3, 7);
				lineTo(11, 7);
				lineStyle(2, 0xFF1111, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
			}
			Out.telo.scrollV -= 1;
		}
		internal function strochMinusRelease(e:MouseEvent):void {
			with (strochkaMinus.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(3, 7);
				lineTo(11, 7);
			}
		}
		internal function stranPlusPress(e:MouseEvent):void {
			with (stranicaPlus.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(3, 4);
				lineTo(3, 10);
				moveTo(1, 7);
				lineTo(6, 7);
				moveTo(11.5, 4);
				lineTo(11.5, 10);
				moveTo(9, 7);
				lineTo(14, 7);
				lineStyle(2, 0xFF1111, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
			}
			Out.telo.scrollV = Out.telo.bottomScrollV + 1;
		}
		internal function stranPlusRelease(e:MouseEvent):void {
			with (stranicaPlus.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(3, 4);
				lineTo(3, 10);
				moveTo(1, 7);
				lineTo(6, 7);
				moveTo(11.5, 4);
				lineTo(11.5, 10);
				moveTo(9, 7);
				lineTo(14, 7);
			}
		}
		internal function stranMinusPress(e:MouseEvent):void {
			with (stranicaMinus.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(1, 7);
				lineTo(6, 7);
				moveTo(9, 7);
				lineTo(14, 7);
				lineStyle(2, 0xFF1111, 0);
				beginFill(0x2C2424, 0.3);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
			}
			Out.telo.scrollV -= 28;
		}
		internal function stranMinusRelease(e:MouseEvent):void {
			with (stranicaMinus.graphics) {
				clear();
				beginFill(0xF8E372, 1);
				drawRoundRect(0, 0, 15, 15, 5);
				endFill();
				lineStyle(2, 0x1510A0, 1);
				moveTo(1, 7);
				lineTo(6, 7);
				moveTo(9, 7);
				lineTo(14, 7);
			}
		}
		internal function tochkiPress(e:MouseEvent):void {
			perPeremesh = 0;
			peremeshKurs.x = -1000;
			vremSprt = e.target;
			NomerFormy.telo.text = Risunok.getChildIndex(vremSprt.parent);
			NomerFormy.telo.setTextFormat(txFormat2);
			tekNomFormy = int(NomerFormy.telo.text);
			Poryadok.telo.text = vremSprt.parent.getChildIndex(vremSprt) + 2;
			Poryadok.telo.setTextFormat(txFormat2);
			tekPoryadok = int(Poryadok.telo.text);
			risov = 1;
		}
		internal function tochkiRelease(e:MouseEvent):void {
			risov = 0;
		}
		internal function vosstTochek():void {
			tekNomFormy = int(NomerFormy.telo.text);
			//Условие необходимо для того, чтобы при первом нажатии на создание формы не произошло ошибки
			if (forms.length > 0  && vosstanovlenie == 1) {
				forms[tekNomFormy][0].graphics.clear();
				forms[tekNomFormy][0].x = 0;
				forms[tekNomFormy][0].y = 0;
				for (var j:int = 1; j < forms[tekNomFormy].length; j++) {
					if (forms[tekNomFormy][j] != undefined) {
						if (forms[tekNomFormy][j][0] == "movT") { 
							if (forms[tekNomFormy][j][1].x < 0) {
								forms[tekNomFormy][j][1].x = formsX0[tekNomFormy] - ( -1 * forms[tekNomFormy][j][1].x);
							}else  if (forms[tekNomFormy][j][1].x > 0) {
								forms[tekNomFormy][j][1].x += formsX0[tekNomFormy];
							}else  if (forms[tekNomFormy][j][1].x == 0) {
								forms[tekNomFormy][j][1].x = formsX0[tekNomFormy];
							}
							if (forms[tekNomFormy][j][1].y < 0) {
								forms[tekNomFormy][j][1].y = formsY0[tekNomFormy] - ( -1 * forms[tekNomFormy][j][1].y);
							}else  if (forms[tekNomFormy][j][1].y > 0) {
								forms[tekNomFormy][j][1].y += formsY0[tekNomFormy];
							}else  if (forms[tekNomFormy][j][1].y == 0) {
								forms[tekNomFormy][j][1].y = formsY0[tekNomFormy];
							}
						}
						if(forms[tekNomFormy][j][0] == "linT"){
							if (forms[tekNomFormy][j][1].x < 0) {
								forms[tekNomFormy][j][1].x = formsX0[tekNomFormy] - ( -1 * forms[tekNomFormy][j][1].x);
							}else  if (forms[tekNomFormy][j][1].x > 0) {
								forms[tekNomFormy][j][1].x += formsX0[tekNomFormy];
							}else  if (forms[tekNomFormy][j][1].x == 0) {
								forms[tekNomFormy][j][1].x = formsX0[tekNomFormy];
							}
							if (forms[tekNomFormy][j][1].y < 0) {
								forms[tekNomFormy][j][1].y = formsY0[tekNomFormy] - ( -1 * forms[tekNomFormy][j][1].y);
							}else  if (forms[tekNomFormy][j][1].y > 0) {
								forms[tekNomFormy][j][1].y += formsY0[tekNomFormy];
							}else  if (forms[tekNomFormy][j][1].y == 0) {
								forms[tekNomFormy][j][1].y = formsY0[tekNomFormy];
							}
						}
						if(forms[tekNomFormy][j][0] == "curvT"){
							if (forms[tekNomFormy][j][1].x < 0) {
								forms[tekNomFormy][j][1].x = formsX0[tekNomFormy] - ( -1 * forms[tekNomFormy][j][1].x);
							}else  if (forms[tekNomFormy][j][1].x > 0) {
								forms[tekNomFormy][j][1].x += formsX0[tekNomFormy];
							}else  if (forms[tekNomFormy][j][1].x == 0) {
								forms[tekNomFormy][j][1].x = formsX0[tekNomFormy];
							}
							if (forms[tekNomFormy][j][1].y < 0) {
								forms[tekNomFormy][j][1].y = formsY0[tekNomFormy] - ( -1 * forms[tekNomFormy][j][1].y);
							}else  if (forms[tekNomFormy][j][1].y > 0) {
								forms[tekNomFormy][j][1].y += formsY0[tekNomFormy];
							}else  if (forms[tekNomFormy][j][1].y == 0) {
								forms[tekNomFormy][j][1].y = formsY0[tekNomFormy];
							}
							if (forms[tekNomFormy][j][2].x < 0) {
								forms[tekNomFormy][j][2].x = formsX0[tekNomFormy] - ( -1 * forms[tekNomFormy][j][2].x);
							}else  if (forms[tekNomFormy][j][2].x > 0) {
								forms[tekNomFormy][j][2].x += formsX0[tekNomFormy];
							}else  if (forms[tekNomFormy][j][2].x == 0) {
								forms[tekNomFormy][j][2].x = formsX0[tekNomFormy];
							}
							if (forms[tekNomFormy][j][2].y < 0) {
								forms[tekNomFormy][j][2].y = formsY0[tekNomFormy] - ( -1 * forms[tekNomFormy][j][2].y);
							}else  if (forms[tekNomFormy][j][2].y > 0) {
								forms[tekNomFormy][j][2].y += formsY0[tekNomFormy];
							}else  if (forms[tekNomFormy][j][2].y == 0) {
								forms[tekNomFormy][j][2].y = formsY0[tekNomFormy];
							}
						}
					}
				}
			}
		}
		internal function risovanie():void {
			minX = 1000;
			minY = 1000;
			maxX = -1000;
			maxY = -1000;
			X0 = 0;
			Y0 = 0;
			vosstanovlenie = 1;
			tekNomFormy = int(NomerFormy.telo.text);
			if(animPer==0){
				for (var j:int = 1; j < forms[tekNomFormy].length; j++) {
					if (forms[tekNomFormy][j] != undefined) {
						if (forms[tekNomFormy][j][0] == "movT" || forms[tekNomFormy][j][0] == "linT") {
						minX = Math.min(minX, forms[tekNomFormy][j][1].x);
						minY = Math.min(minY, forms[tekNomFormy][j][1].y);
						maxX = Math.max(maxX, forms[tekNomFormy][j][1].x);
						maxY = Math.max(maxY, forms[tekNomFormy][j][1].y);
						}
						if (forms[tekNomFormy][j][0] == "curvT") {
							minX = Math.min(minX, forms[tekNomFormy][j][1].x);
							minY = Math.min(minY, forms[tekNomFormy][j][1].y);
							maxX = Math.max(maxX, forms[tekNomFormy][j][1].x);
							maxY = Math.max(maxY, forms[tekNomFormy][j][1].y);
						}
					}
				}
				minX = Math.round(minX);
				minY = Math.round(minY);
				maxX = Math.round(maxX);
				maxY = Math.round(maxY);
				X0 = (maxX - minX) / 2 + minX;
				Y0 = (maxY - minY) / 2 + minY;
				formsX0[tekNomFormy] = Math.round(X0);
				formsY0[tekNomFormy] = Math.round(Y0);
			}
			forms[tekNomFormy][0].graphics.clear();
			formsIsxKod[tekNomFormy] = "";
			for (j = 1; j < forms[tekNomFormy].length; j++) {
				if (forms[tekNomFormy][j] != undefined) {
					if (forms[tekNomFormy][j][0] == "linSt") { 
						forms[tekNomFormy][0].graphics.lineStyle(forms[tekNomFormy][j][2], forms[tekNomFormy][j][3], forms[tekNomFormy][j][4], forms[tekNomFormy][j][5], forms[tekNomFormy][j][6], forms[tekNomFormy][j][7], forms[tekNomFormy][j][8], forms[tekNomFormy][j][9]);
						formsIsxKod[tekNomFormy] += j+1 + "  " + "lineStyle("+forms[tekNomFormy][j][2]+","+forms[tekNomFormy][j][3]+","+forms[tekNomFormy][j][4]+")" + ";" + "\n";
					}
					if (forms[tekNomFormy][j][0] == "bgFl") { 
						forms[tekNomFormy][0].graphics.beginFill(forms[tekNomFormy][j][2], forms[tekNomFormy][j][3]);
						formsIsxKod[tekNomFormy] +=j+1 + "  " + "beginFill("+forms[tekNomFormy][j][2]+","+forms[tekNomFormy][j][3]+")" +  ";" + "\n";
					}
					if (forms[tekNomFormy][j][0] == "bgGrFl") { 
						if(forms[tekNomFormy][j][6] != null){
							GrFill.matrixes = GrFill.vremMatrica;
							GrFill.matrixes.createGradientBox(formsGrBox[tekNomFormy][0], formsGrBox[tekNomFormy][1], formsGrBox[tekNomFormy][2], formsGrBox[tekNomFormy][3], formsGrBox[tekNomFormy][4]);
							forms[tekNomFormy][j][6] = GrFill.matrixes;
						}
						forms[tekNomFormy][0].graphics.beginGradientFill(forms[tekNomFormy][j][2], forms[tekNomFormy][j][3], forms[tekNomFormy][j][4], forms[tekNomFormy][j][5], forms[tekNomFormy][j][6], forms[tekNomFormy][j][7], forms[tekNomFormy][j][8], forms[tekNomFormy][j][9]);
						formsIsxKod[tekNomFormy] += j+1 + "  " + "beginGradientFill()" + ";" + "\n";
					}
					if (forms[tekNomFormy][j][0] == "movT") { 
						formsIsxKod[tekNomFormy] += j+1 +"  " + "moveTo(" + forms[tekNomFormy][j][1].x + "," + " " + forms[tekNomFormy][j][1].y + ")" +  ";" + "\n";
						if (forms[tekNomFormy][j][1].x < formsX0[tekNomFormy]) {
							forms[tekNomFormy][j][1].x = Math.round( -1 * (formsX0[tekNomFormy] - forms[tekNomFormy][j][1].x));
						}else  if (forms[tekNomFormy][j][1].x >= formsX0[tekNomFormy]) {
							forms[tekNomFormy][j][1].x = Math.round(forms[tekNomFormy][j][1].x - formsX0[tekNomFormy]);
						}
						if (forms[tekNomFormy][j][1].y < formsY0[tekNomFormy]) {
							forms[tekNomFormy][j][1].y = Math.round(-1 * (formsY0[tekNomFormy] - forms[tekNomFormy][j][1].y));
						}else  if (forms[tekNomFormy][j][1].y >= formsY0[tekNomFormy]) {
							forms[tekNomFormy][j][1].y = Math.round(forms[tekNomFormy][j][1].y - formsY0[tekNomFormy]);
						}
						if (perRotation == 1) {
							tochkaRot.x = forms[tekNomFormy][j][1].x;
							tochkaRot.y = forms[tekNomFormy][j][1].y;
							tochkaRot = matrica.transformPoint(tochkaRot);
							forms[tekNomFormy][j][1].x = tochkaRot.x;
							forms[tekNomFormy][j][1].y = tochkaRot.y;
						}
						forms[tekNomFormy][0].graphics.moveTo(forms[tekNomFormy][j][1].x, forms[tekNomFormy][j][1].y);
					}
					if (forms[tekNomFormy][j][0] == "linT") {
						formsIsxKod[tekNomFormy] += j+1 + "  " + "lineTo(" + forms[tekNomFormy][j][1].x + "," + " " + forms[tekNomFormy][j][1].y + ")" +  ";" + "\n";
						if (forms[tekNomFormy][j][1].x < formsX0[tekNomFormy]) {
							forms[tekNomFormy][j][1].x = Math.round(-1 * (formsX0[tekNomFormy] - forms[tekNomFormy][j][1].x));
						}else  if (forms[tekNomFormy][j][1].x >= formsX0[tekNomFormy]) {
							forms[tekNomFormy][j][1].x = Math.round(forms[tekNomFormy][j][1].x - formsX0[tekNomFormy]);
						}
						if (forms[tekNomFormy][j][1].y < formsY0[tekNomFormy]) {
							forms[tekNomFormy][j][1].y = Math.round(-1 * (formsY0[tekNomFormy] - forms[tekNomFormy][j][1].y));
						}else  if (forms[tekNomFormy][j][1].y >= formsY0[tekNomFormy]) {
							forms[tekNomFormy][j][1].y = Math.round(forms[tekNomFormy][j][1].y - formsY0[tekNomFormy]);
						}
						if(perRotation==1){
							tochkaRot.x = forms[tekNomFormy][j][1].x;
							tochkaRot.y = forms[tekNomFormy][j][1].y;
							tochkaRot = matrica.transformPoint(tochkaRot);
							forms[tekNomFormy][j][1].x = tochkaRot.x;
							forms[tekNomFormy][j][1].y = tochkaRot.y;
						}
						forms[tekNomFormy][0].graphics.lineTo(forms[tekNomFormy][j][1].x, forms[tekNomFormy][j][1].y);
					}
					if (forms[tekNomFormy][j][0] == "curvT") {
						formsIsxKod[tekNomFormy] += j+1 +"  " + "curveTo(" + forms[tekNomFormy][j][2].x + "," + " " +forms[tekNomFormy][j][2].y + "," + " " +forms[tekNomFormy][j][1].x + "," + " " +forms[tekNomFormy][j][1].y + ")" +  ";" + "\n";
						if (forms[tekNomFormy][j][1].x < formsX0[tekNomFormy]) {
							forms[tekNomFormy][j][1].x = Math.round(-1 * (formsX0[tekNomFormy] - forms[tekNomFormy][j][1].x));
						}else  if (forms[tekNomFormy][j][1].x >= formsX0[tekNomFormy]) {
							forms[tekNomFormy][j][1].x = Math.round(forms[tekNomFormy][j][1].x - formsX0[tekNomFormy]);
						}
						if (forms[tekNomFormy][j][1].y < formsY0[tekNomFormy]) {
							forms[tekNomFormy][j][1].y = Math.round(-1 * (formsY0[tekNomFormy] - forms[tekNomFormy][j][1].y));
						}else  if (forms[tekNomFormy][j][1].y >= formsY0[tekNomFormy]) {
							forms[tekNomFormy][j][1].y = Math.round(forms[tekNomFormy][j][1].y - formsY0[tekNomFormy]);
						}
						if (forms[tekNomFormy][j][2].x < formsX0[tekNomFormy]) {
							forms[tekNomFormy][j][2].x = Math.round(-1 * (formsX0[tekNomFormy] - forms[tekNomFormy][j][2].x));
						}else  if (forms[tekNomFormy][j][2].x >= formsX0[tekNomFormy]) {
							forms[tekNomFormy][j][2].x = Math.round(forms[tekNomFormy][j][2].x - formsX0[tekNomFormy]);
						}
						if (forms[tekNomFormy][j][2].y < formsY0[tekNomFormy]) {
							forms[tekNomFormy][j][2].y = Math.round(-1 * (formsY0[tekNomFormy] - forms[tekNomFormy][j][2].y));
						}else  if (forms[tekNomFormy][j][2].y >= formsY0[tekNomFormy]) {
							forms[tekNomFormy][j][2].y = Math.round(forms[tekNomFormy][j][2].y - formsY0[tekNomFormy]);
						}
						if(perRotation==1){
							tochkaRot.x = forms[tekNomFormy][j][1].x;
							tochkaRot.y = forms[tekNomFormy][j][1].y;
							tochkaRot = matrica.transformPoint(tochkaRot);
							forms[tekNomFormy][j][1].x = tochkaRot.x;
							forms[tekNomFormy][j][1].y = tochkaRot.y;
							tochkaRot.x = forms[tekNomFormy][j][2].x;
							tochkaRot.y = forms[tekNomFormy][j][2].y;
							tochkaRot = matrica.transformPoint(tochkaRot);
							forms[tekNomFormy][j][2].x = tochkaRot.x;
							forms[tekNomFormy][j][2].y = tochkaRot.y;
						}
						forms[tekNomFormy][0].graphics.curveTo(forms[tekNomFormy][j][2].x, forms[tekNomFormy][j][2].y, forms[tekNomFormy][j][1].x, forms[tekNomFormy][j][1].y);
					}
					if (forms[tekNomFormy][j][0] == "endFl") { 
						formsIsxKod[tekNomFormy] += j+1 +"  " + "endFill()" + ";" + "\n";
						forms[tekNomFormy][0].graphics.endFill();
					}
				}
			}
			forms[tekNomFormy][0].x = formsX0[tekNomFormy];
			forms[tekNomFormy][0].y = formsY0[tekNomFormy];
			if(animPer==0){
				Out.telo.text = "";
				for (j = 0; j < forms.length; j++) {
					Out.telo.appendText("Форма" + " " + j + "\n" + formsIsxKod[j] + "\n");
				}
				Out.telo.setTextFormat(txFormat2);
			}
		}
		internal function animRisovanie(a:int,b:Array):void {
			for (var i:int = 1; i < animMas[a].length; i++) {
				animNomerFormy = animMas[a][i][0];
				for (var j:int = 1; j < b[animNomerFormy].length; j++) {
					if ((b[animNomerFormy][j][0] == "movT"||b[animNomerFormy][j][0] == "linT"||b[animNomerFormy][j][0] == "curvT"||b[animNomerFormy][j][0] == "contrl")&&animMas[a][i][1]==j) {
						if (animMas[a][i][4] == 1) {
							b[animNomerFormy][j][3] += animMas[a][i][2]; 
						}
						if (animMas[a][i][5] == 1) {
							b[animNomerFormy][j][4] += animMas[a][i][3];
						}
						if (animMas[a][i][4] == -1) {
							b[animNomerFormy][j][3] -= animMas[a][i][2]; 
						}
						if (animMas[a][i][5] == -1) {
							b[animNomerFormy][j][4] -= animMas[a][i][3];
						}
					}
				}
				if (i == animMas[a].length - 1) {
					//Порядок начинается со второго элемента массива, так как первый элемент - число секунд
					for (var k:int = 1; k < animMas[a][0].length; k++) {
						animNomerFormy = animMas[a][0][k];
						forms[animNomerFormy][0].graphics.clear();
						for (j = 1; j < b[animNomerFormy].length; j++) {
							if (b[animNomerFormy][j][0] == "linSt") {
								forms[animNomerFormy][0].graphics.lineStyle(b[animNomerFormy][j][1], b[animNomerFormy][j][2], b[animNomerFormy][j][3], b[animNomerFormy][j][4], b[animNomerFormy][j][5],b[animNomerFormy][j][6], b[animNomerFormy][j][7], b[animNomerFormy][j][8]);
							}
							if (b[animNomerFormy][j][0] == "bgFl") {
								forms[animNomerFormy][0].graphics.beginFill(b[animNomerFormy][j][1], b[animNomerFormy][j][2]);
							}
							if (b[animNomerFormy][j][0] == "bgGrFl") {
								forms[animNomerFormy][0].graphics.beginGradientFill(b[animNomerFormy][j][1], b[animNomerFormy][j][2], b[animNomerFormy][j][3], b[animNomerFormy][j][4], b[animNomerFormy][j][5], b[animNomerFormy][j][6], b[animNomerFormy][j][7], b[animNomerFormy][j][8]);
							}
							if (b[animNomerFormy][j][0] == "movT") {
								forms[animNomerFormy][0].graphics.moveTo(b[animNomerFormy][j][3], b[animNomerFormy][j][4]);
								forms[animNomerFormy][j][1].x = b[animNomerFormy][j][3];
								forms[animNomerFormy][j][1].y = b[animNomerFormy][j][4];
							}
							if (b[animNomerFormy][j][0] == "linT") {
								forms[animNomerFormy][0].graphics.lineTo(b[animNomerFormy][j][3], b[animNomerFormy][j][4]);
								forms[animNomerFormy][j][1].x = b[animNomerFormy][j][3];
								forms[animNomerFormy][j][1].y = b[animNomerFormy][j][4];
							}
							if (b[animNomerFormy][j][0] == "curvT") {
								forms[animNomerFormy][0].graphics.curveTo(b[animNomerFormy][j + 1][3], b[animNomerFormy][j + 1][4], b[animNomerFormy][j][3], b[animNomerFormy][j][4]);
								forms[animNomerFormy][j][1].x = b[animNomerFormy][j][3];
								forms[animNomerFormy][j][1].y = b[animNomerFormy][j][4];
								forms[animNomerFormy][j][2].x = b[animNomerFormy][j+1][3];
								forms[animNomerFormy][j][2].y = b[animNomerFormy][j+1][4];
							}
							if (b[animNomerFormy][j][0] == "endFl") {
								forms[animNomerFormy][0].graphics.endFill();
							}
						}
					}
				}
			}
			if (animSchetchik == animSchetKon - 1) {
				if (animNomerAnimacii < animMas.length - 1) {
					animNomerAnimacii += 1;
					animSchetKon += animMas[animNomerAnimacii][0][0] * 32;
				}
			}
		}
		internal function entFrame(e:Event):void {
			if (animSchetchik >= 0 && animSchetchik < animSchetKon) {
				animRisovanie(animNomerAnimacii,animRisunok);
				animSchetchik += 1;
			}
			if (risov == 1) {
				vosstTochek();
				vosstanovlenie = 0;
				vremSprt.x = Math.round(vremSprt.parent.mouseX);
				vremSprt.y = Math.round(vremSprt.parent.mouseY);
				if (forms[tekNomFormy][tekPoryadok-1][0] == "movT"||forms[tekNomFormy][tekPoryadok-1][0] == "linT"||forms[tekNomFormy][tekPoryadok-1][0] == "curvT") {
					X.telo.text = vremSprt.x;
					Y.telo.text = vremSprt.y;
					X.telo.setTextFormat(txFormat2);
					Y.telo.setTextFormat(txFormat2);
				}
				if (forms[tekNomFormy][tekPoryadok - 1][0] == "contrl") {
					CtrlX.telo.text = vremSprt.x;
					CtrlY.telo.text = vremSprt.y;
					CtrlX.telo.setTextFormat(txFormat2);
					CtrlY.telo.setTextFormat(txFormat2);
				}
				risovanie();
			}
			if (perPeremesh == 1) {
				vosstTochek();
				vosstanovlenie = 0;
				raznPeremeshX = peremeshKurs.x - formsX0[tekNomFormy];
				raznPeremeshY = peremeshKurs.y - formsY0[tekNomFormy];
				for (var j:int = 1; j < forms[tekNomFormy].length; j++) {
					if (forms[tekNomFormy][j][0] == "movT") { 
						forms[tekNomFormy][j][1].x += raznPeremeshX;
						forms[tekNomFormy][j][1].y += raznPeremeshY;
					}
					if (forms[tekNomFormy][j][0] == "linT") { 
						forms[tekNomFormy][j][1].x += raznPeremeshX;
						forms[tekNomFormy][j][1].y += raznPeremeshY;
					}
					if (forms[tekNomFormy][j][0] == "curvT") { 
						forms[tekNomFormy][j][1].x += raznPeremeshX;
						forms[tekNomFormy][j][1].y += raznPeremeshY;
						forms[tekNomFormy][j][2].x += raznPeremeshX;
						forms[tekNomFormy][j][2].y += raznPeremeshY;
					}
				}
				if (animaciya == true) {
					animPer = 0;
				}
				risovanie();
				if (animaciya == true) {
					animPer = 1;
				}
			}
			//
			if (stage.mouseX>=GrFill.x&&stage.mouseX<=GrFill.x+190&&stage.mouseY>=GrFill.y&&stage.mouseY<=GrFill.y+130&&forms.length>0&&forms[tekNomFormy]!=undefined&&forms[tekNomFormy].length>1) {
				perPeremesh = 0;
				peremeshKurs.x = -1000;
				tekNomFormy = int(NomerFormy.telo.text);
				tekPoryadok = int(Poryadok.telo.text);
				if (forms.length > 0) {
					if (forms[tekNomFormy] != undefined) {
						if(forms[tekNomFormy][tekPoryadok - 1]!=undefined){
							if(forms[tekNomFormy][tekPoryadok - 1].length>0){
								if (forms[tekNomFormy][tekPoryadok - 1][0] == "bgGrFl") {
									if(udalGradienta==0){
										for (i = 0; i < GrFill.markers.length; i++) {
											GrFill.markers[i].removeEventListener(MouseEvent.MOUSE_DOWN, GrFill.MarPress);
											GrFill.markers[i].removeEventListener(MouseEvent.MOUSE_UP, GrFill.MarRelease);
											GrFill.markers[i].graphics.clear();
											GrFill.MarkerSprite.removeChild(GrFill.markers[i]);
											udTochki.push(GrFill.markers[i]);
										}
										GrFill.markers.length = 0;
										GrFill.colors.length = 0;
										GrFill.alfas.length = 0;
										GrFill.ratios.length = 0;
										GrFill.types = forms[tekNomFormy][tekPoryadok - 1][2];
										if (GrFill.types == GradientType.LINEAR) {
											GrFill.Typ.nadpis.text = "LINEAR"
											GrFill.Typ.nadpis.setTextFormat(GrFill.Typ.txFormat1);
										}
										if (GrFill.types == GradientType.RADIAL) {
											GrFill.Typ.nadpis.text = "RADIAL";
											GrFill.Typ.nadpis.setTextFormat(GrFill.Typ.txFormat1);
										}
										for (var k:int = 0; k < forms[tekNomFormy][tekPoryadok - 1][3].length;k++){
											GrFill.colors[k] = forms[tekNomFormy][tekPoryadok - 1][3][k];
											GrFill.alfas[k] = forms[tekNomFormy][tekPoryadok - 1][4][k];
											GrFill.ratios[k] = forms[tekNomFormy][tekPoryadok - 1][5][k];
										}
										if (forms[tekNomFormy][tekPoryadok - 1][6] != null) {
											GrFill.Matrica.nadpis.text = "MATRIX";
											GrFill.Matrica.nadpis.setTextFormat(GrFill.Typ.txFormat1);
											GrFill.TabloM1.text = formsGrBox[tekNomFormy][0];
											GrFill.TabloM2.text = formsGrBox[tekNomFormy][1];
											GrFill.TabloM3.text = formsGrBox[tekNomFormy][2];
											GrFill.TabloM4.text = formsGrBox[tekNomFormy][3];
											GrFill.TabloM5.text = formsGrBox[tekNomFormy][4];
											GrFill.TabloM1.setTextFormat(GrFill.Typ.txFormat1);
											GrFill.TabloM2.setTextFormat(GrFill.Typ.txFormat1);
											GrFill.TabloM3.setTextFormat(GrFill.Typ.txFormat1);
											GrFill.TabloM4.setTextFormat(GrFill.Typ.txFormat1);
											GrFill.TabloM5.setTextFormat(GrFill.Typ.txFormat1);
										}else {
											GrFill.Matrica.nadpis.text = "MATR_NONE";
											GrFill.Matrica.nadpis.setTextFormat(GrFill.Typ.txFormat1);
										}
										GrFill.spMes = forms[tekNomFormy][tekPoryadok - 1][7];
										if (GrFill.spMes == SpreadMethod.PAD) {
											GrFill.SpMetod.nadpis.text = "PAD";
											GrFill.SpMetod.nadpis.setTextFormat(GrFill.Typ.txFormat1);
										}
										if (GrFill.spMes == SpreadMethod.REFLECT) {
											GrFill.SpMetod.nadpis.text = "REFLECT";
											GrFill.SpMetod.nadpis.setTextFormat(GrFill.Typ.txFormat1);
										}
										if (GrFill.spMes == SpreadMethod.REPEAT) {
											GrFill.SpMetod.nadpis.text = "REPEAT";
											GrFill.SpMetod.nadpis.setTextFormat(GrFill.Typ.txFormat1);
										}
										GrFill.intMes = forms[tekNomFormy][tekPoryadok - 1][8];
										if (GrFill.intMes == InterpolationMethod.RGB) {
											GrFill.IntMetod.nadpis.text = "RGB";
											GrFill.IntMetod.nadpis.setTextFormat(GrFill.Typ.txFormat1);
										}
										if (GrFill.intMes == InterpolationMethod.LINEAR_RGB) {
											GrFill.IntMetod.nadpis.text = "LINEAR_RGB";
											GrFill.IntMetod.nadpis.setTextFormat(GrFill.Typ.txFormat1);
										}
										GrFill.fPes = forms[tekNomFormy][tekPoryadok - 1][9];
										GrFill.Fpp.telo.text = GrFill.fPes;
										GrFill.Fpp.telo.setTextFormat(GrFill.Typ.txFormat1);
										for (i = 0; i < GrFill.colors.length; i++) {
											if (GrFill.udMarkery.length > 0) {
												GrFill.markers[i] = GrFill.udMarkery[GrFill.udMarkery.length - 1];
												GrFill.udMarkery.length -= 1;
											}else{
												GrFill.markers[i] = new Sprite();
											}
											GrFill.MarkerSprite.addChild(GrFill.markers[i]);
											with (GrFill.markers[i].graphics) {
												lineStyle(1, 0xFBF548, 0);
												beginFill(GrFill.colors[i], 1);
												moveTo( -2.5, 5);
												lineTo(0, 0);
												lineTo(2.5, 5);
												moveTo( -2.5, 5);
												lineTo(-2.5, 13);
												lineTo(2.5, 13);
												lineTo(2.5, 5);
												endFill();
											}
											GrFill.markers[i].x = Math.round((GrFill.ratios[i])/(255 / GrFill.TeloGradienta.width)) + GrFill.TeloGradienta.x;
											GrFill.markers[i].y = GrFill.TeloGradienta.y + 11;
											GrFill.markers[i].addEventListener(MouseEvent.MOUSE_DOWN, GrFill.MarPress);
											GrFill.markers[i].addEventListener(MouseEvent.MOUSE_UP, GrFill.MarRelease);
										}
										udalGradienta = 1;
									}
									if (GrFill.Typ.nadpis.text == "LINEAR") {
										GrFill.types = GradientType.LINEAR;
									}
									if (GrFill.Typ.nadpis.text == "RADIAL") {
										GrFill.types = GradientType.RADIAL;
									}
									GrFill.matrixes = null;
									if (GrFill.Matrica.nadpis.text == "MATR_NONE") {
										GrFill.matrixes = null;
									}
									if (GrFill.Matrica.nadpis.text == "MATRIX") {
										formsGrBox[tekNomFormy][0] = GrFill.TabloM1.text;
										formsGrBox[tekNomFormy][1] = GrFill.TabloM2.text;
										formsGrBox[tekNomFormy][2] = GrFill.TabloM3.text;
										formsGrBox[tekNomFormy][3] = GrFill.TabloM4.text;
										formsGrBox[tekNomFormy][4] = GrFill.TabloM5.text;
										GrFill.TabloM1.setTextFormat(GrFill.Typ.txFormat1);
										GrFill.TabloM2.setTextFormat(GrFill.Typ.txFormat1);
										GrFill.TabloM3.setTextFormat(GrFill.Typ.txFormat1);
										GrFill.TabloM4.setTextFormat(GrFill.Typ.txFormat1);
										GrFill.TabloM5.setTextFormat(GrFill.Typ.txFormat1);
										GrFill.matrixes = GrFill.vremMatrica;
										GrFill.matrixes.createGradientBox(formsGrBox[tekNomFormy][0], formsGrBox[tekNomFormy][1], formsGrBox[tekNomFormy][2], formsGrBox[tekNomFormy][3], formsGrBox[tekNomFormy][4]);
									}
									GrFill.spMes = SpreadMethod.PAD;
									if (GrFill.SpMetod.nadpis.text == "REFLECT") {
										GrFill.spMes = SpreadMethod.REFLECT;
									}
									if (GrFill.SpMetod.nadpis.text == "REPEAT") {
										GrFill.spMes = SpreadMethod.REPEAT;
									}
									GrFill.intMes = InterpolationMethod.RGB;
									if (GrFill.IntMetod.nadpis.text == "LINEAR_RGB") {
										GrFill.intMes = InterpolationMethod.LINEAR_RGB;
									}
									GrFill.fPes = 0;
									GrFill.fPes = GrFill.Fpp.telo.text;
									forms[tekNomFormy][tekPoryadok - 1][2] = GrFill.types;
									forms[tekNomFormy][tekPoryadok - 1][3].length = 0;
									forms[tekNomFormy][tekPoryadok - 1][4].length = 0;
									forms[tekNomFormy][tekPoryadok - 1][5].length = 0;
									for (k = 0; k < GrFill.colors.length;k++){
										forms[tekNomFormy][tekPoryadok - 1][3][k] = GrFill.colors[k];
										forms[tekNomFormy][tekPoryadok - 1][4][k] = GrFill.alfas[k];
										forms[tekNomFormy][tekPoryadok - 1][5][k] = GrFill.ratios[k];
									}
									forms[tekNomFormy][tekPoryadok-1][6] = GrFill.matrixes;
									forms[tekNomFormy][tekPoryadok-1][7] = GrFill.spMes;
									forms[tekNomFormy][tekPoryadok-1][8] = GrFill.intMes;
									forms[tekNomFormy][tekPoryadok - 1][9] = GrFill.fPes;
									with (GrFill.TeloGradienta.graphics) {
										clear();
										lineStyle(1, 0xFBF548, 0);
										beginGradientFill(GrFill.types, GrFill.colors, GrFill.alfas, GrFill.ratios, GrFill.matrixes, GrFill.spMes, GrFill.intMes, GrFill.fPes);
										moveTo(0, 0);
										lineTo(0, 10);
										lineTo(170, 10);
										lineTo(170, 0);                                                                                                                                                                     
										endFill();
									}
									vosstTochek();
									vosstanovlenie = 0;
									risovanie();
								}
							}
						}
					}
				}
			}else {
				udalGradienta = 0;
			}
			//Изменение спектра и заливки в цв. миксере
			if (ColM.per == 1) { 
				if (ColM.Kursor.x < ColM.teloX1) {
				ColM.Kursor.stopDrag();
				ColM.Kursor.x = ColM.teloX1;
				}else
				if (ColM.Kursor.x >ColM.teloX2) {
					ColM.Kursor.stopDrag();
					ColM.Kursor.x = ColM.teloX2;
				}else
				if (ColM.Kursor.y<ColM.kursorY1) {
				ColM.Kursor.stopDrag();
				ColM.Kursor.y = ColM.kursorY1;
				}else
				if (ColM.Kursor.y>ColM.kursorY2) {
					ColM.Kursor.stopDrag();
					ColM.Kursor.y = ColM.kursorY2;
				}
				if (ColM.Treug.y >= ColM.treugY1 && ColM.Treug.y <= ColM.treugY2) {
					ColM.Treug.x = ColM.treugX;
				}
				if (ColM.Treug.y < ColM.treugY1 ) {
					ColM.Treug.stopDrag();
					ColM.Treug.y = ColM.treugY1;
					ColM.Treug.x = ColM.treugX;
				}
				if (ColM.Treug.y > ColM.treugY2) {
					ColM.Treug.stopDrag();
					ColM.Treug.y = ColM.treugY2;
					ColM.Treug.x = ColM.treugX;
				}
				ColM.risSpectr();
				ColM.ottenok();
				ColM.Zalivka.telo.text = ColM.cvet;
				ColM.Zalivka.telo.setTextFormat(txFormat2);
			}
			//Реализация движения маркеров
			if (GrFill.per == 1) {
				if (GrFill.vremSprt.x >= GrFill.nachX && GrFill.vremSprt.x <= GrFill.konX) {
					GrFill.vremSprt.y = GrFill.TeloGradienta.y + 11;
					GrFill.ramka.x = GrFill.vremSprt.x;
				}
				if (GrFill.vremSprt.x < GrFill.nachX) {
					GrFill.vremSprt.stopDrag();
					GrFill.markers[GrFill.indxSprite].x = GrFill.nachX;
					GrFill.vremSprt.y = GrFill.TeloGradienta.y + 11;
					GrFill.ramka.x = GrFill.vremSprt.x;
				}
				if (GrFill.vremSprt.x > GrFill.konX) {
					GrFill.vremSprt.stopDrag();
					GrFill.markers[GrFill.indxSprite].x = GrFill.konX;
					GrFill.vremSprt.y = GrFill.TeloGradienta.y + 11;
					GrFill.ramka.x = GrFill.vremSprt.x;
				}
				//Рисование градиента
				GrFill.ratios[GrFill.indxSprite] = Math.round((255 / GrFill.TeloGradienta.width) * (GrFill.markers[GrFill.indxSprite].x - GrFill.TeloGradienta.x));
				if (GrFill.Typ.nadpis.text == "LINEAR") {
					GrFill.types = GradientType.LINEAR;
				}
				if (GrFill.Typ.nadpis.text == "RADIAL") {
					GrFill.types = GradientType.RADIAL;
				}
				GrFill.matrixes = null;
				if (GrFill.Matrica.nadpis.text == "MATR_NONE") {
					GrFill.matrixes = null;
				}
				if (GrFill.Matrica.nadpis.text == "MATRIX") {
					GrFill.matrixes = GrFill.vremMatrica;
					GrFill.matrixes.createGradientBox(GrFill.TabloM1.text, GrFill.TabloM2.text, GrFill.TabloM3.text, GrFill.TabloM4.text, GrFill.TabloM5.text);
				}
				GrFill.spMes = SpreadMethod.PAD;
				if (GrFill.SpMetod.nadpis.text == "REFLECT") {
					GrFill.spMes = SpreadMethod.REFLECT;
				}
				if (GrFill.SpMetod.nadpis.text == "REPEAT") {
					GrFill.spMes = SpreadMethod.REPEAT;
				}
				GrFill.intMes = InterpolationMethod.RGB;
				if (GrFill.IntMetod.nadpis.text == "LINEAR_RGB") {
					GrFill.intMes = InterpolationMethod.LINEAR_RGB;
				}
				GrFill.fPes = 0;
				GrFill.fPes = GrFill.Fpp.telo.text;
				with (GrFill.TeloGradienta.graphics) {
					clear();
					lineStyle(1, 0xFBF548, 0);
					beginGradientFill(GrFill.types, GrFill.colors, GrFill.alfas, GrFill.ratios, GrFill.matrixes, GrFill.spMes, GrFill.intMes, GrFill.fPes);
					moveTo(0, 0);
					lineTo(0, 10);
					lineTo(170, 10);
					lineTo(170, 0);                                                                                                                                                                     
					endFill();
				}
			}
		}
	}
}
