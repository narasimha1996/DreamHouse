public class AddPrimaryContact implements Queueable {
    Private Contact contact;
    Private String state;
    Public addPrimaryContact(Contact inputContact ,String inputState){
        this.contact = inputContact;
        this.state = inputState;
    }
    
    public void execute(QueueableContext context){
        List<Account> accounts = [Select id from Account where BillingState = :state Limit 200];
        List<Contact> contacts = new List<contact>();
        for(Account acc : accounts){
            contact contactclone = contact.clone();
            contactClone.AccountId = acc.id;
            contacts.add(contactClone);        
        }
        insert contacts;
    }

}