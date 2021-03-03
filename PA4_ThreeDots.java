/**
 * PA4threedots.java
 * 
 * Set three different pixels by call another function with location as parameter.
 *   
 */

import meggy.Meggy;

class PA4_ThreeDots {

    public static void main(String[] whatever){
        {
            new Simple().reddot((byte)3, (byte)4);    
            new Simple().greendot((byte)4, (byte)4);  
	    new Simple().yellowdot((byte)5, (byte)4);  
    
        }
    }
}

class Simple {
    
    public void reddot(byte x, byte y) {
        Meggy.setPixel( x, y, Meggy.Color.RED );
    }

    public void greendot(byte x, byte y) {
        Meggy.setPixel( x, y, Meggy.Color.GREEN );
    }

    public void yellowdot(byte x, byte y) {
        Meggy.setPixel( x, y, Meggy.Color.YELLOW );
    }

}
