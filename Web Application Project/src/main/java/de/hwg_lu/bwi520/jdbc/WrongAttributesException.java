package de.hwg_lu.bwi520.jdbc;

import java.sql.SQLException;

@SuppressWarnings("serial")
public class WrongAttributesException extends SQLException {

	public WrongAttributesException() {
		// TODO Auto-generated constructor stub
	}

	public WrongAttributesException(String reason) {
		super(reason);
		// TODO Auto-generated constructor stub
	}

	public WrongAttributesException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	public WrongAttributesException(String reason, String SQLState) {
		super(reason, SQLState);
		// TODO Auto-generated constructor stub
	}

	public WrongAttributesException(String reason, Throwable cause) {
		super(reason, cause);
		// TODO Auto-generated constructor stub
	}

	public WrongAttributesException(String reason, String SQLState, int vendorCode) {
		super(reason, SQLState, vendorCode);
		// TODO Auto-generated constructor stub
	}

	public WrongAttributesException(String reason, String sqlState, Throwable cause) {
		super(reason, sqlState, cause);
		// TODO Auto-generated constructor stub
	}

	public WrongAttributesException(String reason, String sqlState, int vendorCode, Throwable cause) {
		super(reason, sqlState, vendorCode, cause);
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
