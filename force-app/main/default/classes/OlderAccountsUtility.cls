public class OlderAccountsUtility {
    Public static void updateOlderAccounts(){
        Account[] oldAccounts = [Select Id,Description from Account ORDER BY CreatedDate ASC Limit 5 ];
        for (Account acct:oldAccounts){
            acct.Description = 'Heritage Account';
        }
        update oldAccounts;
    }

}