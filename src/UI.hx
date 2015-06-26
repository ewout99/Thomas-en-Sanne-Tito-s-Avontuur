package ;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import openfl.Lib;
import openfl.text.TextField;

/**
 * Holds the userinterface 
 * Shows score, stars, mascot etc.
 * @author Ezzz
 */
class UI extends Sprite
{
	var UIx:Int = Lib.current.stage.stageWidth;
	var UIy:Int = Lib.current.stage.stageHeight;
	public var hint:Button = new Button("", "img/Hinthover.png", "img/Hint.png");
	public var progressInt:Int = 1;
	
	var textfield:TextField = new TextField ();
	var textfield2:TextField = new TextField ();
	var textfield3:TextField = new TextField ();
	var tooltip1:TextField = new TextField ();
	var tooltip2:TextField = new TextField ();
	var tooltip3:TextField = new TextField ();
	var tooltip4:TextField = new TextField ();
	
	var curstage = Lib.current.stage;
	
	var objectives = new Bitmap(Assets.getBitmapData("img/Objectives.png"));
	var objective1:Button;
	var objective2:Button;
	var objective3:Button;
	var objective4:Button;
	var objective5:Button;
	var objective6:Button;

	public function new() 
	{
		super();
		drawUI();
		
		modobj1 ("start");
		modobj2 ("end");
		modobj3 ("end");
		modobj4 ("end");
		modobj5 ("end");
		modobj6 ("end");
		
		objective1start ();
	}
	
	private function drawUI ()
	{
		objectives.width = objectives.width / 1.2;
		objectives.height = objectives.height / 1.2;
		objectives.x = 10;
		objectives.y = (UIy / 2 - objectives.height /2) ;
		addChild(objectives);
		
		var progressie = new Bitmap (Assets.getBitmapData("img/Progressie.png"));
		progressie.width = progressie.width;
		progressie.height = progressie.height;
		progressie.x = (UIx / 2 ) - ( progressie.width / 2);
		progressie.y = 10;
		addChild(progressie);
		
		var option = new Button ("", "img/optionbutton.png", "img/optionbutton_alt.png");
		option.width = option.width / 1.5;
		option.height = option.height / 1.5;
		option.x = (UIx - option.width + 25);
		option.y = 25;
		addChild(option);
		option.addEventListener(MouseEvent.CLICK, backMenu);
		
		hint.width = hint.width / 2;
		hint.height = hint.height / 2;
		hint.x = ( UIx - hint.width - 10);
		hint.y = ( UIy - hint.height - 10);
		addChild(hint);
		hint.addEventListener(MouseEvent.CLICK, giveHint);
		
		textfield.x = ( UIx / 2 ) - ( progressie.width / 2 ) + 15;
		textfield.y = 25;
		textfield.width = UIx / 2;
		textfield.textColor = 0xFFFFFF;
		
		textfield2.x = ( UIx / 2 ) - ( progressie.width / 2 ) + 15;
		textfield2.y = 37;
		textfield2.width = UIx / 2;
		textfield2.textColor = 0x808080;
		
		textfield3.x = ( UIx / 2 ) - ( progressie.width / 2 ) + 15;
		textfield3.y = 49;
		textfield3.width = UIx / 2;
		textfield3.textColor = 0x383838;
		
		tooltip1.x = 20;
		tooltip1.y = 20;
		tooltip1.width = UIx / 4;
		tooltip1.textColor = 0xFFFFFF;
		tooltip1.text = "Weetjes:";
		
		tooltip2.x = 20;
		tooltip2.y = 32;
		tooltip2.width = UIx / 4;
		tooltip2.textColor = 0xFFFFFF;
		tooltip2.text = "Gebruik 'WASD' om rond te lopen";
		
		tooltip3.x = 20;
		tooltip3.y = 44;
		tooltip3.width = UIx / 4;
		tooltip3.textColor = 0xFFFFFF;
		tooltip3.text = "Druk op 'E' om iets te activeren";
		
		tooltip4.x = 20;
		tooltip4.y = 56;
		tooltip4.width = UIx / 4;
		tooltip4.textColor = 0xFFFFFF;
		tooltip4.text = "Klik op de icoontjes voor uitleg ";
		
		addChild ( tooltip1 );
		addChild ( tooltip2 );
		addChild ( tooltip3 );
		addChild ( tooltip4 );
		
		//progressUpdate(progressInt);
		
	}
	
	public function modobj1 (change:String)
	{
		if ( change == "start" )
		{
			removeChild ( objective1 );
			objective1 = new Button ("1","img/objectives/objective_1.png","img/objectives/objective_1.png");
			objective1.width = objective1.width / 1.5;
			objective1.height = objective1.height / 1.5;
			objective1.x = 50;
			objective1.y = (UIy / 2 - objectives.height / 2) + 45;
			objective1.addEventListener (MouseEvent.CLICK, objective1click);
			trace ("objective 1 listener added");
			addChild ( objective1 );
		}
		
		else if ( change == "end" )
		{
			removeChild ( objective1 );
			objective1 = new Button ("1","img/objectives/objective_2_alt.png","img/objectives/objective_2_alt.png");
			objective1.width = objective1.width / 1.5;
			objective1.height = objective1.height / 1.5;
			objective1.x = 50;
			objective1.y = (UIy / 2 - objectives.height /2) + 45;
			addChild ( objective1 );
			objective1.removeEventListener (MouseEvent.CLICK, objective1click);
		}
	}
	
	public function modobj2 (change:String)
	{
		if ( change == "start" )
		{
			removeChild ( objective2 );
			objective2 = new Button ("2","img/objectives/objective_2.png","img/objectives/objective_2.png");
			objective2.width = objective2.width / 1.5;
			objective2.height = objective2.height / 1.5;
			objective2.x = 50;
			objective2.y = (UIy / 2 - objectives.height /2) + 120;
			objective2.addEventListener (MouseEvent.CLICK, objective2click);
			addChild ( objective2 );
		}
		
		else if ( change == "end" )
		{
			removeChild ( objective2 );
			objective2 = new Button ("2","img/objectives/objective_1_alt.png","img/objectives/objective_1_alt.png");
			objective2.width = objective2.width / 1.5;
			objective2.height = objective2.height / 1.5;
			objective2.x = 50;
			objective2.y = (UIy / 2 - objectives.height /2) + 120;
			addChild ( objective2 );
			objective2.removeEventListener (MouseEvent.CLICK, objective2click);
		}
	}
	
	public function modobj3 (change:String)
	{
		if ( change == "start" )
		{
			removeChild ( objective3 );
			objective3 = new Button ("3","img/objectives/objective_3.png","img/objectives/objective_3.png");
			objective3.width = objective3.width / 1.5;
			objective3.height = objective3.height / 1.5;
			objective3.x = 50;
			objective3.y = (UIy / 2 - objectives.height / 2) + 190;
			objective3.addEventListener (MouseEvent.CLICK, objective3click);
			addChild ( objective3 );
		}
		
		else if ( change == "end" )
		{
			removeChild ( objective3 );
			objective3 = new Button ("3","img/objectives/objective_3_alt.png","img/objectives/objective_3_alt.png");
			objective3.width = objective3.width / 1.5;
			objective3.height = objective3.height / 1.5;
			objective3.x = 50;
			objective3.y = (UIy / 2 - objectives.height /2) + 190;
			addChild ( objective3 );
			objective3.removeEventListener (MouseEvent.CLICK, objective3click);
		}
	}
	
	public function modobj4 (change:String)
	{
		if ( change == "start" )
		{
			removeChild ( objective4 );
			objective4 = new Button ("4","img/objectives/objective_4.png","img/objectives/objective_4.png");
			objective4.width = objective4.width / 1.5;
			objective4.height = objective4.height / 1.5;
			objective4.x = 50;
			objective4.y = (UIy / 2 - objectives.height / 2) + 270;
			objective4.addEventListener (MouseEvent.CLICK, objective4click);
			addChild ( objective4 );
		}
		
		else if ( change == "end" )
		{
			removeChild ( objective4 );
			objective4 = new Button ("4","img/objectives/objective_4_alt.png","img/objectives/objective_4_alt.png");
			objective4.width = objective4.width / 1.5;
			objective4.height = objective4.height / 1.5;
			objective4.x = 50;
			objective4.y = (UIy / 2 - objectives.height /2) + 270;
			addChild ( objective4 );
			objective4.removeEventListener (MouseEvent.CLICK, objective4click);
		}
	}
	
	public function modobj5 (change:String)
	{
		if ( change == "start" )
		{
			removeChild ( objective5 );
			objective5 = new Button ("5","img/objectives/objective_5.png","img/objectives/objective_5.png");
			objective5.width = objective5.width / 1.5;
			objective5.height = objective5.height / 1.5;
			objective5.x = 50;
			objective5.y = (UIy / 2 - objectives.height / 2) + 345;
			objective5.addEventListener (MouseEvent.CLICK, objective5click);
			addChild ( objective5 );
		}
		
		else if ( change == "end" )
		{
			removeChild ( objective5 );
			objective5 = new Button ("5","img/objectives/objective_5_alt.png","img/objectives/objective_5_alt.png");
			objective5.width = objective5.width / 1.5;
			objective5.height = objective5.height / 1.5;
			objective5.x = 50;
			objective5.y = (UIy / 2 - objectives.height /2) + 345;
			addChild ( objective5 );
			objective5.removeEventListener (MouseEvent.CLICK, objective5click);
		}
	}
	
	public function modobj6 (change:String)
	{
		if ( change == "start" )
		{
			removeChild ( objective6 );
			objective6 = new Button ("6","img/objectives/objective_6.png","img/objectives/objective_6.png");
			objective6.width = objective6.width / 1.5;
			objective6.height = objective6.height / 1.5;
			objective6.x = 50;
			objective6.y = (UIy / 2 - objectives.height / 2) + 420;
			objective6.addEventListener (MouseEvent.CLICK, objective6click);
			addChild ( objective6 );
		}
		
		else if ( change == "end" )
		{
			removeChild ( objective6 );
			objective6 = new Button ("6","img/objectives/objective_1_alt.png","img/objectives/objective_1_alt.png");
			objective6.width = objective6.width / 1.5;
			objective6.height = objective6.height / 1.5;
			objective6.x = 50;
			objective6.y = (UIy / 2 - objectives.height /2) + 420;
			addChild ( objective6 );
			objective6.removeEventListener (MouseEvent.CLICK, objective6click);
		}
	}

	function objective1start ()
	{
		notify ("OPDRACHT: Tito is ontsnapt! Hij is hier ergens naar binnen gerend... Probeer hem te vinden.");
	}
	
	function objective1click (event:MouseEvent)
	{
		notify ("OPDRACHT: Tito is ontsnapt! Hij is hier ergens naar binnen gerend... Probeer hem te vinden.");
	}
	
	function objective2click (event:MouseEvent)
	{
		notify ("OPDRACHT: Karin zegt dat je het beter aan de archivaris kan vragen, als je hem een folder kan brengen die hij is verloren.");
	}
	
	function objective3click (event:MouseEvent)
	{
		notify ("OPDRACHT: Je hebt de folder gevonden! Breng hem naar de archivaris toe.");
	}
	
	function objective4click (event:MouseEvent)
	{
		notify ("OPDRACHT: De archivist zegt dat de concierge het misschien weet in ruil voor een blikje fris.");
	}
	
	function objective5click (event:MouseEvent)
	{
		notify ("OPDRACHT: Je hebt een blikje fris gevonden! Breng het naar de concierge toe.");
	}
	
	function objective6click (event:MouseEvent)
	{
		notify ("OPDRACHT: De concierge heeft Tito gezien! Hij verstopt zich in een van de planten!");
	}
	
	public function notify (text:String)
	{
		removeChild ( textfield );
		removeChild ( textfield2 );
		removeChild ( textfield3 );
		textfield3.text = textfield2.text;
		textfield2.text = textfield.text;
		textfield.text = text;
		addChild ( textfield );
		addChild ( textfield2 );
		addChild ( textfield3 );
	}
	
	
	
	function giveHint (e:MouseEvent)
	{
		var displaytext:String = "Er staat hier geen text";
		
		var hintid:Int = Std.int (Std.random (6));
		
		trace ("hintid: " + hintid);
		
		switch (hintid)
		{
			case 0: displaytext = "HINT: Probeer altijd met mensen te praten als je vast zit.";
			case 1: displaytext = "HINT: De KJRW is altijd beschikbaar voor advies, ongeacht het onderwerp.";
			case 2: displaytext = "HINT: Alle gekleurde rondjes op de kaart kan je activeren met 'E'.";
			case 3: displaytext = "HINT: Als je moeite hebt met het vinden van de oplossing, loop rond en onderzoek het level.";
			case 4: displaytext = "HINT: Veel kinderen die de KJRW helpen hebben vragen over hun ouders of school.";
			case 5: displaytext = "HINT: De eerste missie van een level is meestal heel dichtbij.";
			case 6: displaytext = "HINT: Klik op het actieve missie icoontje om je missie te bekijken.";
		}
		
		notify (displaytext);
	}
	
	function backMenu (e:MouseEvent)
	{
		Main.getInstance().switchScreen (Main.OPTIONS_SCREEN);
	}
}