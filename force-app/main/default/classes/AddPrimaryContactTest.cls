@isTest
public class AddPrimaryContactTest {
    
    private static testmethod Void testQueueableClass(){
        List<Account> accounts = new List<Account>();
        for(integer i=0;i<500;i++){
           Account acc = new Account(Name='Test account');
            if(i<250){
                acc.BillingState ='NY';
                
            }else{
                acc.BillingState ='CA';
            }
         accounts.add(acc); 
        }
        insert accounts;
        
        contact con = new contact(LastName='palacholla',FirstName ='Murali');
        insert con;
        
        Test.startTest();
      	id jobId= system.enqueueJob(new addPrimaryContact(con,'CA'));
        Test.stopTest();
        
        List<Contact> contacts = [select id from contact where Contact.Account.BillingState = 'CA'];
        System.assertEquals(200, contacts.size(),'Error: Incorrect number of contact records found');
        
    }
}