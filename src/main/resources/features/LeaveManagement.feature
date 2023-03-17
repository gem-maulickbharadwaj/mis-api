#Author: shubham.kumar@geminisolutions.com
#Keyword: Leave Management

@leaveManagement
Feature: MIS - Leave Management API

  Background: MIS - Login API
    Given Set endpoint "loginAPI" and method "post" for MIS Leave login
    And Verify status code 200 for leave Management

  Scenario Outline: Get Leave Balance Data for valid payload
    When Set the Leave Management endpoint "<endpoint>" , method "<method>" and "<payloadName>"
    Then Verify status code <expectedStatus> for leave Management

    Examples:
      | endpoint             | method | expectedStatus | payloadName            |
      | postLeaveBalanceData | post   | 200            | leaveManagementPayload |

  Scenario Outline: Get Last Records Leave Details for valid payload
    When Set the Leave Management endpoint "<endpoint>" , method "<method>" and "<payloadName>"
    Then Verify status code <expectedStatus> for leave Management

    Examples:
      | endpoint                    | method | expectedStatus | payloadName         |
      | postLastLeaveRecordsDetails | post   | 200            | leaveRecordsPayload |

  Scenario Outline: Get Outing Types for valid payload
    When Set the Leave Management endpoint "<endpoint>" , method "<method>" and "<payloadName>"
    Then Verify status code <expectedStatus> for leave Management

    Examples:
      | endpoint        | method | expectedStatus | payloadName        |
      | postOutingTypes | post   | 200            | leaveOutingPayload |

  Scenario Outline: Fetch Data for Employee Directory for valid header
    When Set endpoint "<endpoint>" and method "<method>" for leave Management
    Then Verify status code <expectedStatus> for leave Management

    Examples:
      | endpoint                      | method | expectedStatus |
      | FetchDataForEmployeeDirectory | get    | 200            |

  Scenario Outline: Fetch Dates to Request Work From Home for valid payload
    When Set the Leave Management endpoint "<endpoint>" , method "<method>" and "<payloadName>"
    Then Verify status code <expectedStatus> for leave Management

    Examples:
      | endpoint        | method | expectedStatus | payloadName            |
      | postDatesForWFH | post   | 200            | leaveManagementPayload |
