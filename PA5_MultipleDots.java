/**
 * PA5multipledots.java
 * 
 * Set multiple BLUE pixels by call another function with number of dots as parameter.
 * I set 4 here
 */

import meggy.Meggy;

class PA5_MultipleDots {

    public static void main(String[] whatever){
        {
            new Simple().setDots(4); 
    
        }
    }
}

class Simple {
    int y;
    public void setDots(int x) {
	y=0;
	while (y<x){
        	Meggy.setPixel( (byte) 0, (byte) y, Meggy.Color.BLUE );
		y=y+1;
	}
    }

}
