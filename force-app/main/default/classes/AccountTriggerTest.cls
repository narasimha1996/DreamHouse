@isTest
private class AccountTriggerTest {
    @testSetup
    static void createTestData() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            Account account = new Account(BillingState='CA');
            accounts.add(account);
        }
        insert accounts;
    }
    
    @isTest
    static void testShippingState() {
        List<Account> accounts = [SELECT ShippingState FROM Account WHERE BillingState='CA'];
        for (Account account : accounts) {
            System.assertEquals(account.BillingState, account.ShippingState,'');
        }
    }
}