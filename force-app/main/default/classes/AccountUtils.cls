public class AccountUtils {
    public static List<Account> accountsByState(String st){
        List<Account> acctList = [Select Id,Name From Account WHERE BillingState = :st];
        system.debug(acctList);
        return acctList;
    }

}