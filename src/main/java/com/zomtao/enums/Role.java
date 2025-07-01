package com.zomtao.enums;

import com.fasterxml.jackson.annotation.JsonCreator;

public enum Role {
  ADMIN,RESTAURANT_OWNER;
	

    @JsonCreator
    public static Role fromString(String value) {
        return Role.valueOf(value.toUpperCase());
    }
}
