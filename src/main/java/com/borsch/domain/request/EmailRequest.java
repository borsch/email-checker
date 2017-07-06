package com.borsch.domain.request;

import java.util.List;

/**
 * Created by Oleh on 06.07.2017.
 */
public class EmailRequest {

    private List<String> emails;

    public List<String> getEmails() {
        return emails;
    }

    public void setEmails(List<String> emails) {
        this.emails = emails;
    }
}
