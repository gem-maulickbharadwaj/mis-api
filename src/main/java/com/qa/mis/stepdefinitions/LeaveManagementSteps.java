package com.qa.mis.stepdefinitions;

import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.qa.mis.commonutils.Utils;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

import java.util.HashMap;

public class LeaveManagementSteps {

    public static int status;

    @Given("Set endpoint {string} and method {string} for MIS Leave login")
    public void setEndpointAndMethodForMISLogin(String url, String method) {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("Authorization", Utils.GetAuthorization());
        try {
            status = Utils.LoginUser(url, method, token, "Login User").getStatus();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @And("Verify status code {int} for leave Management")
    public void verifyStatusCodeForMISLogin(Integer expected) {
        Utils.VerifyStatusCode(expected, status);
    }

    @Given("Set the Leave Management endpoint {string} , method {string} and {string}")
    public void setTheLeaveManagementEndpointMethodAnd(String url, String method, String payloadName) {
        status = 0;
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("UserAbrhs", Utils.GetUser());
        token.put("Token", Utils.GetToken());
        try {
            status = Utils.APIwithPayloads(url, method, payloadName, token, "").getStatus();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Given("Set endpoint {string} and method {string} for leave Management")
    public void setEndpointAndMethodForLeaveManagement(String url, String method) {
        status = 0;
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("UserAbrhs", Utils.GetUser());
        token.put("Token", Utils.GetToken());
        System.out.println(token);
        try {
            status = Utils.APIwithoutPayloads(url, method, token, "").getStatus();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
