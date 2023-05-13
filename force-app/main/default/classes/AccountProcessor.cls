public class AccountProcessor {
    @Future
    Public Static Void countContacts(List<Id> accountids){
        List<Account> accts = [Select Id ,Number_Of_Contacts__c,(Select id from Contacts) from Account where Id in :accountids];
            For(Account a:accts){
                a.Number_Of_Contacts__c = a.Contacts.size();
            }
        
        update accts;
    }
}