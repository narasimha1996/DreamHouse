@isTest
public with sharing class TestVerifyDate {
    @isTest static Void testCheckDates() {
		Date check = VerifyDate.checkDates(Date.parse('04/14/2023'),Date.parse('04/24/2023'));
        System.assertEquals(Date.parse('04/24/2023'),check,'message');
	}

  @isTest static Void testDateWithin30Days() {
		Date check = VerifyDate.checkDates(Date.parse('04/14/2023'),Date.parse('05/24/2023'));
        System.assertEquals(Date.parse('04/30/2023'),check,'message');
	}
}