/**
 * PA4setdot.java
 * 
 * Set one pixels by function from another class. Use location and color as parameter.
 *   
 */

import meggy.Meggy;

class PA4_SetDot {

    public static void main(String[] whatever){
        {
            new Simple().setColor((byte)4, (byte)4, Meggy.Color.YELLOW);
    
        }
    }
}

class Simple {
    
    public void setColor(byte x, byte y, Meggy.Color z) {
        Meggy.setPixel( x, y, z );
    }

}
