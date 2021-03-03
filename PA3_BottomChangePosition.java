/**
 * PA3BottomChangePosition
 * 
 * If no bottom pressed, the original is a single BLUE pixel on (4,4).
 * If press A, then several RED pixel surround (4,4).
 * If press A, then several GREEN pixel surround of surround of (4,4).
 * 
 */

import meggy.Meggy;

class PA3_BottomChangePosition {
    public static void main(String[] whatever){
        {
            Meggy.setPixel( (byte)4, (byte)4, Meggy.Color.BLUE );
	    Meggy.delay(100);

            // infinite loop that checks for button presses every half second
            while (true) {
                if (Meggy.checkButton(Meggy.Button.A) ) {
                    Meggy.setPixel( (byte)4, (byte)4, Meggy.Color.DARK );
	    	    Meggy.setPixel( (byte)5, (byte)4, Meggy.Color.RED );
	    	    Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.RED );
	    	    Meggy.setPixel( (byte)3, (byte)4, Meggy.Color.RED );
	    	    Meggy.setPixel( (byte)4, (byte)3, Meggy.Color.RED );
                } else {
                    if (Meggy.checkButton(Meggy.Button.B)) {
		        Meggy.setPixel( (byte)5, (byte)4, Meggy.Color.DARK );
	    	        Meggy.setPixel( (byte)4, (byte)5, Meggy.Color.DARK );
	    	        Meggy.setPixel( (byte)3, (byte)4, Meggy.Color.DARK );
	    	        Meggy.setPixel( (byte)4, (byte)3, Meggy.Color.DARK );
                        Meggy.setPixel( (byte)5, (byte)5, Meggy.Color.GREEN );
                        Meggy.setPixel( (byte)4, (byte)6, Meggy.Color.GREEN );
	    	        Meggy.setPixel( (byte)3, (byte)5, Meggy.Color.GREEN );
	    	        Meggy.setPixel( (byte)2, (byte)4, Meggy.Color.GREEN );
	    	        Meggy.setPixel( (byte)3, (byte)3, Meggy.Color.GREEN );
	    	        Meggy.setPixel( (byte)4, (byte)2, Meggy.Color.GREEN );
	    	        Meggy.setPixel( (byte)5, (byte)3, Meggy.Color.GREEN );
	    	        Meggy.setPixel( (byte)6, (byte)4, Meggy.Color.GREEN );
                    } else {
                        Meggy.setPixel( (byte)5, (byte)5, Meggy.Color.DARK );
                        Meggy.setPixel( (byte)4, (byte)6, Meggy.Color.DARK );
	    	        Meggy.setPixel( (byte)3, (byte)5, Meggy.Color.DARK );
	    	        Meggy.setPixel( (byte)2, (byte)4, Meggy.Color.DARK );
	    	        Meggy.setPixel( (byte)3, (byte)3, Meggy.Color.DARK );
	    	        Meggy.setPixel( (byte)4, (byte)2, Meggy.Color.DARK );
	    	        Meggy.setPixel( (byte)5, (byte)3, Meggy.Color.DARK );
	    	        Meggy.setPixel( (byte)6, (byte)4, Meggy.Color.DARK );
			Meggy.setPixel( (byte)4, (byte)4, Meggy.Color.BLUE );
                    }
                }
                // tenth second delay, 100 milliseconds
                Meggy.delay(100);
            }
        }
    }
}
