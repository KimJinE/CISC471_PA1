/**
 * PA3TimeChangeColor
 * 
 * The original is several BLUE pixel on (4,4)(4,5)(5,4)(5,5).
 * Then after 10 sec delay, all color will change to red.
 * Then after 10 sec delay, all color will change to green.
 * Then after 10 sec delay, all color will change to yellow and stop.
 */

import meggy.Meggy;

class PA3_TimeChangeColor {
    public static void main(String[] whatever){
        {
            Meggy.setPixel( (byte)4, (byte)4, Meggy.Color.BLUE );
	    Meggy.setPixel( (byte)5, (byte)4, Meggy.Color.BLUE );
	    Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.BLUE );
	    Meggy.setPixel( (byte)5, (byte)5, Meggy.Color.BLUE );
	    Meggy.delay(100);

            // infinite loop that checks for button presses every half second
            while (!(Meggy.getPixel( (byte)4, (byte)4) == Meggy.Color.YELLOW) ) {
                if (Meggy.getPixel( (byte)4, (byte)4) == Meggy.Color.BLUE ) {
                    Meggy.setPixel( (byte)4, (byte)4, Meggy.Color.RED );
	    	    Meggy.setPixel( (byte)5, (byte)4, Meggy.Color.RED );
	    	    Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.RED );
	    	    Meggy.setPixel( (byte)5, (byte)5, Meggy.Color.RED );
                } else {
                    if (Meggy.getPixel( (byte)4, (byte)4) == Meggy.Color.RED ) {
                        Meggy.setPixel( (byte)4, (byte)4, Meggy.Color.GREEN );
                        Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.GREEN );
	    	        Meggy.setPixel( (byte)5, (byte)4, Meggy.Color.GREEN );
	    	        Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.GREEN );
                    } else {
                        Meggy.setPixel( (byte)4, (byte)4, Meggy.Color.YELLOW );
                        Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.YELLOW );
	    	        Meggy.setPixel( (byte)5, (byte)4, Meggy.Color.YELLOW );
	    	        Meggy.setPixel( (byte)5, (byte)5, Meggy.Color.YELLOW );
                    }

                }
                // tenth second delay, 100 milliseconds
                Meggy.delay(100);
            }
        }
    }
}
