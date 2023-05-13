public class CustomLookUpController {
     @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String CQuery) {
        system.debug('CQuery-->' + CQuery);
        String searchKey = searchKeyWord + '%';
		String Active = 'Active';        
        List < sObject > returnList = new List < sObject > ();
        
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  '' +CQuery + ' Name LIKE: searchKey order by createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;

    }
}