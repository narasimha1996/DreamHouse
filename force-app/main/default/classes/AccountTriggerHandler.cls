public class AccountTriggerHandler {
    public static void createAccounts(List<Account> accounts) {
        for (Account account : accounts) {
            if (account.BillingState != null && (account.ShippingState == null || account.ShippingState != account.BillingState )) {
                account.ShippingState = account.BillingState;
            }
        }
    }
}