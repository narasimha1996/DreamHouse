public class AccountUtility {
    Public Static void viewAnnualRevenue(){
        List<Account> accountsList = [select Name,AnnualRevenue from Account];
        for(Account acc:accountsList){
            String acctRev =  acc.Name + ':' + acc.AnnualRevenue;
            system.debug(acctRev);
        }
        
    }

}