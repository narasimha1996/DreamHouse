@isTest
private class TestRestrictContactByName {
    
   static testMethod void testInvalidLastName() {
        // Create a contact with an invalid last name
        Contact invalidContact = new Contact(LastName = 'INVALIDNAME');
        
        // Add the contact to the list of new contacts
        List<Contact> newContacts = new List<Contact>();
        newContacts.add(invalidContact);
        
        // Call the trigger by inserting the new contact
        Test.startTest();
        try {
            insert newContacts;
            // If the insert operation is successful, an exception should be thrown
            System.assert(false, 'Expected exception was not thrown');
        } catch (DmlException e) {
            // Check that the exception message matches the expected message
            System.assertEquals('the Last NameINVALIDNAMEis not allowed for DML', e.getDmlMessage(0));
        }
        Test.stopTest();
    }
    
    static testMethod void testValidLastName() {
        // Create a contact with a valid last name
        Contact validContact = new Contact(LastName = 'Smith');
        
        // Add the contact to the list of new contacts
        List<Contact> newContacts = new List<Contact>();
        newContacts.add(validContact);
        
        // Call the contactHandler method
        Test.startTest();
        //RestrictContactByNameHandler.contactHandler(newContacts);
        Insert newContacts;
        Test.stopTest();
        
        // Check that the contact does not have any errors
        System.assertEquals(0, validContact.getErrors().size());
    }
}