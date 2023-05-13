public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String lastName) {
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 1; i <= numContacts; i++) {
            Contact contact = new Contact();
            contact.FirstName = 'Test ' + i;
            contact.LastName = lastName;
            contacts.add(contact);
        }
        return contacts;
    }
}