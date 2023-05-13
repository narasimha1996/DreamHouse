public with sharing class AccountDeletionHandler {
    public static void accountHandler(List<Account> acclist) {
        acclist =[ SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN : Trigger.old];
        for(Account a :acclist ) {
        Trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities.');
}
    }
}