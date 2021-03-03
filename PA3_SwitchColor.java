/**
 * PA3switchcolor
 * 
 * If no button is pressed, then lights up a single BLUE pixel on (4,4)(4,5)(5,4)(5,5).
 * If button A is pressed, then lights up a single RED pixel on (4,4)(4,5)(5,4)(5,5).
 * If button B is pressed, then lights up a single GREEN pixel on (4,4)(4,5)(5,4)(5,5).
 * 
 */

import meggy.Meggy;

class PA3_SwitchColor {
    public static void main(String[] whatever){
        {
            Meggy.setPixel( (byte)4, (byte)4, Meggy.Color.BLUE );
	    Meggy.setPixel( (byte)5, (byte)4, Meggy.Color.BLUE );
	    Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.BLUE );
	    Meggy.setPixel( (byte)5, (byte)5, Meggy.Color.BLUE );

            // infinite loop that checks for button presses every half second
            while (true) {
                if (Meggy.checkButton(Meggy.Button.A)) {
                    Meggy.setPixel( (byte)4, (byte)4, Meggy.Color.RED );
	    	    Meggy.setPixel( (byte)5, (byte)4, Meggy.Color.RED );
	    	    Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.RED );
	    	    Meggy.setPixel( (byte)5, (byte)5, Meggy.Color.RED );
                } else {
                    if (Meggy.checkButton(Meggy.Button.B)) {
                        Meggy.setPixel( (byte)4, (byte)4, Meggy.Color.GREEN );
                        Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.GREEN );
	    	        Meggy.setPixel( (byte)5, (byte)4, Meggy.Color.GREEN );
	    	        Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.GREEN );
                    } else {
                        Meggy.setPixel( (byte)4, (byte)4, Meggy.Color.BLUE );
                        Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.BLUE );
	    	        Meggy.setPixel( (byte)5, (byte)4, Meggy.Color.BLUE );
	    	        Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.BLUE );
                    }

                }

                // tenth second delay, 100 milliseconds
                Meggy.delay(100);
            }
        }
    }
}
