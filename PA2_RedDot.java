/**
 * PA2Reddot
 * 
 * Lights up a single red pixel on (5,5).
 * 
 */
import meggy.Meggy;

class PA2_RedDot {
       public static void main(String[] whatever){
               Meggy.setPixel( (byte)5, (byte)5, Meggy.Color.RED );
        }
}

