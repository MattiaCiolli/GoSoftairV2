package it.univaq.disim.gosoftair.business;

public class BusinessException extends RuntimeException {

	public BusinessException() {
		super();
	}

	public BusinessException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);		
	}

	public BusinessException(String message, Throwable cause) {
		super(message, cause);
		
	}

	public BusinessException(String message) {
		super(message);
		
	}

	public BusinessException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
	

}
