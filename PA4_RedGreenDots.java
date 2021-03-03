/**
 * PA4redgreendots.java
 * 
 * Set different pixels by call another function with location and boolean as parameter.
 * boolean decide whether it's pass or not, pass is green light, not is red light
 */

import meggy.Meggy;

class PA4_RedGreenDots {

    public static void main(String[] whatever){
        {
            new Simple().setdot((byte)3, (byte)4, true); 
            new Simple().setdot((byte)4, (byte)4, false); 
            new Simple().setdot((byte)5, (byte)4, true); 
    
        }
    }
}

class Simple {

    public void setdot(byte x, byte y, boolean z) {
        if (z == true) {
		this.greendot(x,y);
	} else {
		this.reddot(x,y);
	}
    }

    
    public void reddot(byte x, byte y) {
        Meggy.setPixel( x, y, Meggy.Color.RED );
    }

    public void greendot(byte x, byte y) {
        Meggy.setPixel( x, y, Meggy.Color.GREEN );
    }


}
