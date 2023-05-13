public class AccountHandler {
    Public static void insertAccount(Integer NoOfAcc){
       List<Account> addAccounts = new List<Account>();
        Integer N = 1;
        while(N <= NoOfAcc){
            Account acc = new Account();
            acc.Name = 'Acme Inc N'+ N;
            acc.AccountNumber = 'A000n'+ N;
            addAccounts.add(acc);
            N = N + 1;         }
        Insert addAccounts;
       
    }

}