/**
 * PA5changecolor.java
 * 
 * Set multiple BLUE pixels by call another function with number of dots as parameter.
 * I set 4 here
 */

import meggy.Meggy;

class PA5_ChangeColor {

    public static void main(String[] whatever){
        {
            new Color().run(); 
    
        }
    }
}

class Color {
    Meggy.Color dotcolor;
    
    public void run() {
	dotcolor = Meggy.Color.YELLOW;
	while (!(Meggy.getPixel( (byte)4, (byte)4) == Meggy.Color.YELLOW)) {
		if (Meggy.getPixel( (byte)4, (byte)4) == Meggy.Color.BLUE ) {
                    this.setDots(Meggy.Color.RED);
                } else {
                    if (Meggy.getPixel( (byte)4, (byte)4) == Meggy.Color.RED ) {
                        this.setDots(Meggy.Color.GREEN);
                    } else {
                        this.setDots(Meggy.Color.YELLOW);
                    }

                }
                // tenth second delay, 100 milliseconds
                Meggy.delay(100);
	}
		
    } 
    public void setDots(Meggy.Color color) {
	Meggy.setPixel( (byte)4, (byte)4, color );
        Meggy.setPixel( (byte)4, (byte)5, color );
	Meggy.setPixel( (byte)5, (byte)4, color );
	Meggy.setPixel( (byte)5, (byte)5, color );
    }

}
