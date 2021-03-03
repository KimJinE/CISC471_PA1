/**
 * PA6colorboard.java
 * 
 * set the color of board. 4 colors, color of column 1 is same with 8 and so on until the center column.
 * 
 */

import meggy.Meggy;

class PA6_ColorBoard {

    public static void main(String[] whatever){
        {
            // display how many blue pixel in each row
            new Board().run(Meggy.Color.RED, Meggy.Color.GREEN, Meggy.Color.VIOLET, Meggy.Color.YELLOW);
        }
    }
}

class Board {
    Meggy.Color [] p;
    
    public void run(Meggy.Color c1, Meggy.Color c2, Meggy.Color c3, Meggy.Color c4) {
        p = new Meggy.Color [8];
        p[0] = c1;
        p[1] = c2;
        p[2] = c3;
        p[3] = c4;
        p[4] = c4;
        p[5] = c3;
        p[6] = c2;
        p[7] = c1;

        this.displayboard(p);

    }
    
    public void displayboard(Meggy.Color [] a) {
	int j;
        int i;
        i=0;
        
        while (i<8) {
	    j = 0;
	    while (j < 8) {
            	Meggy.setPixel((byte) j, (byte) i, a[j]); 
		j = j+1;
	    }       
            i = i+1;
        }
    }

}
