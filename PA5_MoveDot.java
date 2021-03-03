/**
 * PA5movedot.java
 * 
 * Moving with a single BLUE pixel with up, down, right, left key
 * Original location is (4,4), if touch wall will stop. 
 * to call toneStart when a button is pressed. (Tone D3)
 */

import meggy.Meggy;

class PA5_MoveDot {

    public static void main(String[] whatever){
        new Dot().run();
    }
}

class Dot {
    byte cur_x;
    byte cur_y;
    
    public void run() {
        Meggy.Tone localvar;
        localvar = Meggy.Tone.D3;
        
        // initialize the x and y coordinates of the dot
        cur_x = (byte)4;
        cur_y = (byte)4;
        
        // and then let the user move it around with the Dpad
        while (true) {
            if ((Meggy.checkButton(Meggy.Button.Up))&&(cur_y<(byte)7)) {
                this.movedot(cur_x, (byte)(cur_y+(byte)1));
                Meggy.toneStart(localvar, 50);
            } else {}
            if ((Meggy.checkButton(Meggy.Button.Down))&&((byte)0<cur_y)) {
                this.movedot(cur_x, (byte)(cur_y-(byte)1));
                Meggy.toneStart(localvar, 50);
            } else {}
            if ((Meggy.checkButton(Meggy.Button.Left))&&((byte)0<cur_x)) {
                this.movedot((byte)(cur_x-(byte)1), cur_y);
                Meggy.toneStart(localvar, 50);
            } else {}
            if ((Meggy.checkButton(Meggy.Button.Right))&&(cur_x<(byte)7)) {
                this.movedot((byte)(cur_x+(byte)1), cur_y);
                Meggy.toneStart(localvar, 50);
            } else {}
            
            Meggy.delay(100);
        }
    }
    
    public void movedot(byte x, byte y) {
        // darken the current location of the dot
        Meggy.setPixel(cur_x, cur_y, Meggy.Color.DARK);
            
        // light up the new location
        Meggy.setPixel(x, y, Meggy.Color.BLUE);
            
        // update the dot's current location
        cur_x = x;
        cur_y = y;

    }

}
