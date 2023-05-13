public class ContactAndLeadSearch {
    Public static List<List< sObject>> searchContactsAndLeads(String name){
        List<List<sObject>> NameSearch =[Find :name IN ALL FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        Contact[] SearchContacts = (Contact[])NameSearch[0];
        Lead[] SearchLeads = (Lead[])NameSearch[1];
        System.debug('Found the following Contacts.');
        For(Contact con :SearchContacts ){
            System.debug(con.FirstName+','+con.LastName);
        }
        System.debug('Found the following Leads.');
        For(Lead Lea :SearchLeads){
            System.debug(Lea.FirstName+','+Lea.LastName);
        }
        return NameSearch;
    }
}