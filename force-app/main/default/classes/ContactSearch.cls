public class ContactSearch {
    Public static List<Contact> searchForContacts(String lastName,String PostalCode){
        List<Contact> con =[Select Id,Name From Contact where LastName =:lastName AND MailingPostalCode=:PostalCode];
        System.debug(con);
        return Con;
    }

}