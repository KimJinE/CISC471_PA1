package meggy; /**
 * meggy.Meggy.java
 * <p>
 * The Java-only definition of the meggy interface for use in the MeggyJava
 * language.  See the grammar for the MeggyJava language at
 * http://www.cs.colostate.edu/~cs453/yr2011/MeggyJavaInfo/meggy-java-grammar.html
 * <p>
 * NOTES:
 * - Java does not have unsigned types and the MeggyJrSimple and MeggyJr
 * libraries do use unsigned types.  For the Java-only package I am
 * going to use signed bytes for things like the x,y coordinates because
 * they don't need all 256 positive values.  For constants like colors
 * we use enumerated types.  For number of milliseconds using integers
 * even though that will restrict the range somewhat.
 * <p>
 * 12/27/10, 1/4/11, MMS
 * Fall 2010, started by Ryan Moore
 **/


// Imports

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;


public class Meggy {
    /**
     * Specifies LED color, MJ compiler will translate to MeggyJrSimple
     * color index.
     */
    public enum Color {
        DARK,
        RED,
        ORANGE,
        YELLOW,
        GREEN,
        BLUE,
        VIOLET,
        WHITE
    }


    /**
     * Specifies which tone, MJ compiler will translate to MeggyJrSimple
     * tone constants.
     */
    public enum Tone {
        C3,
        Cs3,
        D3,
        Ds3,
        E3,
        F3,
        Fs3,
        G3,
        Gs3,
        A3,
        As3,
        B3
    }

    /**
     * Specifies which button, MJ compiler will translate to MeggyJrSimple
     * button constants.
     */
    public enum Button {
        B,
        A,
        Up,
        Down,
        Left,
        Right
    }

    /**
     * The private array that stores the current color settings in the screen.
     */
    static private final byte sScreenSize = 8;
    static private final Color[][] sScreenBuffer = {
            {Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK},
            {Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK},
            {Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK},
            {Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK},
            {Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK},
            {Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK},
            {Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK},
            {Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK, Color.DARK}
    };

    // Max value for the bit array
    static private final int sMaxBitArrayForLEDs = 255;

    static private int sMaxCalls;          // Max number of calls to this interface before halting
    static private boolean sDelaySim;   // Are we simulating delays in Java.

    // A list of button press sets.  Each phase has a set.  Phases are occur between delay calls.
    static private final List<Set<Button>> sButtonPresses = new LinkedList<>();
    static private int sCurrPhase = 0;

    static {
        HashSet<Button> currSet;

        sButtonPresses.add(currSet = new HashSet<>());    // zeroth phase

        String argOpts = System.getProperty("arg_opts");

        if (null == argOpts) {
            argOpts = "arg_opts";
        }

        Scanner sc;
        try {
            sc = new Scanner(new File(argOpts));
        } catch (FileNotFoundException e) {
            throw new MeggyException(String.format("ARG_OPTS file: %s not found", argOpts), e);
        }

        try {
            sMaxCalls = Integer.parseInt(sc.nextLine());
        } catch(NumberFormatException e) {
            throw new MeggyException("Invalid value for max calls", e);
        }

        sDelaySim = Boolean.parseBoolean(sc.nextLine());


        while (sc.hasNextLine()) {
            String line = sc.nextLine().trim();
            if ("delay".equals(line)) {
                sButtonPresses.add(currSet = new HashSet<>());
            } else {
                currSet.add(Button.valueOf(line));
            }
        }
    }

    /**
     * private constructor, MeggyJava programs don't instantiate an instance
     * IOW, the meggy.Meggy class is really just a module wrapper for
     * the interface and a single global array of pixel values.
     * meggy.Meggy object instances should not be created.
     */
    private Meggy() {
    }

    /**
     * Sets the pixel at position x,y to the given color and
     * prints a gradeable message to indicate as such to
     * stdout.  Also checks input value ranges.
     * <p>
     * The coordinate system starts at the lower left corner
     * of the device at <0,0>
     *
     * @param x          is the horizontal coordinate, indicates column
     * @param y          is the vertical coordinate, indicates row
     * @param meggyColor is the color to for the pixel
     **/
    public static void setPixel(byte x, byte y, Color meggyColor) {

        sMaxCalls--;
        if (sMaxCalls < 0) {
            System.exit(0);
        }

        // Check that all input values fall within possible ranges.
        if (!(0 <= x && x < sScreenSize)) throw new MeggyException("x coordinate out of bounds, x = " + x);
        if (!(0 <= y && y < sScreenSize)) throw new MeggyException("y coordinate out of bounds, y = " + y);

        // Set pixel in screen.
        sScreenBuffer[x][y] = meggyColor;

        // Print a gradeable output message.
        System.out.println("Setting pixel (" + x + "," + y + ") to " + meggyColor);
    }

    /**
     * Gets the pixel color at position x,y and
     * prints a gradeable message to indicate as such to
     * stdout.  Also checks input value ranges.
     * <p>
     * The coordinate system starts at the lower left corner
     * of the device at <0,0>
     *
     * @param x is the horizontal coordinate
     * @param y is the vertical coordinate
     **/
    public static Color getPixel(byte x, byte y) {

        sMaxCalls--;
        if (sMaxCalls < 0) {
            System.exit(0);
        }

        // Check that all input values fall within possible ranges.
        if (!(0 <= x && x < sScreenSize)) throw new MeggyException("x coordinate out of bounds, x = " + x);
        if (!(0 <= y && y < sScreenSize)) throw new MeggyException("y coordinate out of bounds, y = " + y);

        // Print a gradeable output message.
        System.out.printf("Getting pixel (%s,%s) ==>%s%n", x, y, sScreenBuffer[x][y]);

        // Get pixel value.
        return sScreenBuffer[x][y];
    }

    /**
     * Given a number from 0 to 255, this routine sets the
     * corresponding auxiliary lights by treating the
     * number like a bit array.  The least significant bit
     * represents the left-most auxiliary light.
     *
     * @param bitarray value between 0 and 255
     **/
    public static void setAuxLEDs(int bitarray) {

        sMaxCalls--;

        if (sMaxCalls < 0) {
            System.exit(0);
        }

        // Check that all input values fall within possible ranges.
        if (!(0 <= bitarray && bitarray <= sMaxBitArrayForLEDs)) {
            throw new MeggyException(String.format("bitarray out of bounds, bitarray = %d", bitarray));
        }

        // Print a gradeable output message.
        System.out.print("Setting auxiliary LEDs from left to right as follows: ");
        for (int i = 1; i <= 128; i = i * 2) {
            // check if a given bit is set
            if ((bitarray & i) != 0) {
                System.out.print(" 1 ");
            } else {
                System.out.print(" 0 ");
            }
        }
        System.out.println();

    }


    /**
     * Plays the specified tone for a specified amount of time.
     *
     * @param t           which tone to play
     * @param duration_ms duration of the tone in milliseconds
     **/
    public static void toneStart(Tone t, int duration_ms) {

        sMaxCalls--;

        if (sMaxCalls < 0) {
            System.exit(0);
        }

        // Check that the duration is positive.
        if (0 < duration_ms) {// Print a gradeable output message.
            System.out.printf("Playing tone %s for %d milliseconds%n", t, duration_ms);
        } else {
            throw new MeggyException(String.format("duration must be positive, duration_ms=%d", duration_ms));
        }
    }

    /**
     * Always indicates that the given button has been pressed.
     * <p>
     * Since these routines are only being used for grading this
     * simplifying assumption will enable deterministic grading.
     *
     * @param b which button to check
     **/
    public static boolean checkButton(Button b) {

        sMaxCalls--;
        if (sMaxCalls < 0) {
            System.exit(0);
        }

        // Do we have a phase for the current phase?
        // && Check to see if it's a button press for this phase
        if (sButtonPresses.size() > sCurrPhase && sButtonPresses.get(sCurrPhase).contains(b)) {
            // Print a gradeable output message.
            System.out.printf("Checking button %s and returning true%n", b);
            return true;

        } else {
            // Print a gradeable output message.
            System.out.printf("Checking button %s and returning false%n", b);
            return false;
        }
    }

    /**
     * Prints a gradeable delay message.
     *
     * @param duration_ms the number of milliseconds for the delay
     **/
    public static void delay(int duration_ms) {

        sMaxCalls--;

        if (sMaxCalls < 0) {
            System.exit(0);
        }

        // Keep track of phase we are in for pre-recorded button presses.
        sCurrPhase += 1;

        // Check that the duration is positive.
        if (0 >= duration_ms) {
            throw new MeggyException(String.format("duration must be positive, duration_ms=%d", duration_ms));
        }

        // Print a gradeable output message.
        System.out.printf("Delaying for %d milliseconds%n", duration_ms);

        // Only perform delay if flag is set
        if (sDelaySim) {
            try {
                Thread.sleep(duration_ms);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }


}
