package meggy;

import java.util.Formatter;

/**
 * meggy.MeggyException.java
 * <p>
 * Exception class to enable bounds checking in the meggy.Meggy methods.
 * <p>
 * 1/4/11, MMS
 **/

public class MeggyException extends RuntimeException {
    public MeggyException(String msg) {
        super(msg);
    }

	public MeggyException(String message, Throwable cause) {
		super(message, cause);
	}

	public MeggyException(Throwable cause) {
		super(cause);
	}
}
