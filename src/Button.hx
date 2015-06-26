package ;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @Ezzz
 */
class Button extends Sprite
{
	// Below are the variable's which declare the interactive "hoverable" buttons used in the menu.hx file and their properties//


	var mainiamge:Bitmap;
	var mainImageHover:Bitmap; 
	var buttonText:TextField;
	var buttonTextFormat:TextFormat = new TextFormat("Arial", 24, 0xffffff, true, false, false, null, null, TextFormatAlign.CENTER);
	
	// public funtion new, this delcared that there are two images needed to initiate the the function HOVER// 
	// The eventlisters checks if the funtion is actialy is being executed, if mouse over, the menu hovers and calls
	// the hover.png file. if not the regular .png file gets loaded.//
	public function new(text:String, image:String, imageHover:String) 
	{
		super();
		buttonText = new TextField();
		buttonText.defaultTextFormat = buttonTextFormat;
		buttonText.text = (text);
		buttonText.selectable = false;
		mainiamge = new Bitmap(Assets.getBitmapData(image));
		mainImageHover = new Bitmap(Assets.getBitmapData(imageHover));
		buttonText.width = 300;
		buttonText.x = ( mainiamge.x + ( mainiamge.width - buttonText.width) / 2);
		buttonText.y = (mainiamge.y + ( mainiamge.width - mainiamge.width) / 2 );
		draw();
		addEventListener(MouseEvent.MOUSE_OVER, OnMouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, OnMouseOut);
		addEventListener(MouseEvent.CLICK, playSound);
	}
	
	// The draw function draws the inital button 
	
	function draw()
	{
		addChild(mainiamge);
		addChild(buttonText);
	}
	
	// The Onmouse removes the main button and replace's the button with a hoverbutton //
	
	function OnMouseOver(e:MouseEvent)
	{
		removeChildren();
		addChild(mainImageHover);
		addChild(buttonText);
	}	
	
	// When the mouse hover away from the button the child thats is called in the draw funtion is recalled//
	
	function OnMouseOut(e:MouseEvent) 
	{
		removeChildren();
		addChild(mainiamge);
		addChild(buttonText);
	}
	
	function playSound (event:MouseEvent)
	{
		Main.getInstance().sound.playSound("click");
	}
	
}
