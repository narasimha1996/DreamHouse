@isTest
Private with sharing class AccountDeletionTest {
   @isTest static  void testDeleteAccountWithOneOpportunity() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Opportunity opp = new Opportunity();
        opp.Name = acc.Name + ' Opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = system.today().addMonths(1);
        opp.AccountId = acc.Id;

        Insert opp;

        Test.startTest();
        Database.DeleteResult result = Database.delete(acc,false);
        Test.stopTest();
        
        System.assert(!result.isSuccess(),'');
        System.assert(result.getErrors().Size() > 0,'');
        System.assertEquals('Cannot delete account related with opportunities.', result.getErrors()[0].getMessage(),'');
    }
}