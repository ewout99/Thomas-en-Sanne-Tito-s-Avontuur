package ;

import openfl.display.Bitmap;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.display.StageDisplayState;

/**
 * Class that hold the menu.
 * @author Ezzz
 */
class MainMenu extends Sprite
{
        // Button variables
        private var levelSelect:Button = new Button("Level Select", "img/middlebutton.png", "img/middlebuttonhover.png");
        private var options:Button= new Button("Options", "img/middlebutton.png", "img/middlebuttonhover.png");
        private var contact:Button = new Button("Contact", "img/middlebutton.png", "img/middlebuttonhover.png");
        private var exit:Button = new Button ("Exit game", "img/bottombutton.png", "img/bottombuttonhover.png");
        private var start:Button = new Button ("Start game", "img/topbutton.png", "img/topbuttonhover.png");

        // For some reason stage.*** won't work this was the solution
        var X:Int = Lib.current.stage.stageWidth;
        var Y:Int = Lib.current.stage.stageHeight;
        
        public function new()  
        {
                super ();
                addEventListener ( Event.ADDED_TO_STAGE, init);
         // Testing Traces for the option screen
        /*                
                trace ( Main.getInstance().soundvolume);
                trace ( Main.getInstance().musicvolume);
                trace ( Main.getInstance().currentChar);
                trace ( Main.getInstance().currentLevel);
        */
        }
        
        function init (event:Event)
        {
                removeEventListener ( Event.ADDED_TO_STAGE, init);
                drawbackground ();
                drawmenu ();
                
                //Test the chat bubble.
                testChatBubble();
        }
        // Draws the Background img
        function drawbackground()
        {
                var background = new Bitmap(Assets.getBitmapData("img/Menubackground.png"));
                addChildAt (background, 0);
        }
    
    function testChatBubble()
    {
        var testList:Array<String> = new Array();
        testList.push("textA");
        testList.push("textB");
        testList.push("textC");
        
        new ChatBubble(testList, "img/middlebutton.png", "img/middlebuttonhover.png");
    }
    
        
        // Draws the menu to show buttons
        function drawmenu() 
        {
                Main.getInstance().music.mainMenuMusic();
                addChild(start);
                addChild(levelSelect);
                addChild(options);
                addChild(contact);
                addChild(exit);
                
                
                start.x = ( X / 2 - start.width / 2);
                start.y = 330;
                levelSelect.x = ( X / 2 - levelSelect.width / 2);
                levelSelect.y = 3300;
				levelSelect.visible = false;
                options.x = (X / 2 - options.width / 2);
                options.y = 410;
                contact.x = (X / 2 - contact.width / 2);
                contact.y = 490;
                exit.x = ( X / 2 - exit.width / 2);
                exit.y = 570;

                
                start.addEventListener(MouseEvent.CLICK, click);
                levelSelect.addEventListener(MouseEvent.CLICK, click);
                options.addEventListener(MouseEvent.CLICK, click);
                contact.addEventListener(MouseEvent.CLICK, click);
                exit.addEventListener(MouseEvent.CLICK, click);
                
        }
        
        // Fuction that checks for mouse events and asks main to load the correspoding screen
        public function click (event:MouseEvent)
        {
                if (event.currentTarget == start)
                        {
                                Main.getInstance ().switchScreen (Main.CHAR_SELECT_SCREEN);
                        }
                if (event.currentTarget == levelSelect)
                        {
                                Main.getInstance().switchScreen (Main.LEVEL_SELECT_SCREEN);
                        }                
                if (event.currentTarget == options)
                        {
                                Main.getInstance().switchScreen (Main.OPTIONS_SCREEN);
                        }
                if (event.currentTarget == contact)
                        {
                                Main.getInstance().switchScreen (Main.CONTACT_SCREEN);
                        }
                if (event.currentTarget == exit)
                        {
                                trace ("Exit");        
                                Main.getInstance().exit();
                        }
                
        
        }
        
}
