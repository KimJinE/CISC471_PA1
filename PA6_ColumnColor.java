/**
 * PA6columncolor.java
 * 
 * Initialize an array with 8 colors and display the it on a picked column
 * 
 */

import meggy.Meggy;

class PA6_ColumnColor {

    public static void main(String[] whatever){
        {
            // display a rainbow on third column
            new Rainbow().run((byte)2);
        }
    }
}

class Rainbow {
    Meggy.Color [] p;
    
    public void run(byte column) {
        p = new Meggy.Color [8];
        p[0] = Meggy.Color.RED;
        p[1] = Meggy.Color.ORANGE;
        p[2] = Meggy.Color.YELLOW;
        p[3] = Meggy.Color.GREEN;
        p[4] = Meggy.Color.BLUE;
        p[5] = Meggy.Color.VIOLET;
        p[6] = Meggy.Color.WHITE;
        p[7] = Meggy.Color.DARK;

        this.displayRow(column, p);

    }
    
    public void displayRow(byte column, Meggy.Color [] a) {
        int i;
        i=0;
        
        while (i<8) {
            Meggy.setPixel(column, (byte) i, a[i]);        
            i = i+1;
        }
    }

}
