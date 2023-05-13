public with sharing class RestrictContactByNameHandler {
    public static void contactHandler(List<Contact> newContacts) {
        for(Contact c : newContacts){
            if(c.LastName == 'INVALIDNAME'){
                c.AddError('the Last Name' + c.LastName +'is not allowed for DML');
            }
         }
       
	}   
}