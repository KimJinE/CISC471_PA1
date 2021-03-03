/**
 * PA6dotsofrow.java
 * 
 * set the number of BLUE pixel for each row.row 1 to row 8.
 * 
 */

import meggy.Meggy;

class PA6_DotsOfRow {

    public static void main(String[] whatever){
        {
            // display how many blue pixel in each row
            new Dots().run(1,2,3,4,5,6,7,8);
        }
    }
}

class Dots {
    int [] p;
    
    public void run(int r1, int r2, int r3, int r4, int r5, int r6, int r7, int r8) {
        p = new int [8];
        p[0] = r1;
        p[1] = r2;
        p[2] = r3;
        p[3] = r4;
        p[4] = r5;
        p[5] = r6;
        p[6] = r7;
        p[7] = r8;

        this.displayboard(p);

    }
    
    public void displayboard(int [] a) {
	int j;
        int i;
        i=0;
        
        while (i<8) {
	    j = 0;
	    while (j < a[i]) {
            	Meggy.setPixel((byte) j, (byte) i, Meggy.Color.BLUE); 
		j = j+1;
	    }       
            i = i+1;
        }
    }

}
