package com.dotv.perfume.exception;

public class EntityNotFoundCustomException extends Exception{
    private static final long serialVersionUID = 1L;

    public EntityNotFoundCustomException(String message) {
        super(message);
    }
}
