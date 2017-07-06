package com.borsch.domain.views;

import com.borsch.domain.enums.EmailExistsEnum;

/**
 * Created by Oleh on 06.07.2017.
 */
public class EmailResult {

    private String email;
    private EmailExistsEnum exists;

    public EmailResult(String email, EmailExistsEnum exists) {
        this.email = email;
        this.exists = exists;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public EmailExistsEnum getExists() {
        return exists;
    }

    public void setExists(EmailExistsEnum exists) {
        this.exists = exists;
    }
}
