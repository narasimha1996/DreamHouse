@isTest
public class DailyLeadProcessorTest {
    Static String CRON_EXP = '0 0 0 ? * * *';

    public static testmethod void testSchedulableclass(){
        
        List<Lead> leads =new List<Lead>();
        for(integer i=0;i<500;i++){
            if(i<250){
                leads.add(new Lead(LastName='murali',company ='salesforce'));
            }else{
                
                leads.add(new Lead(LastName ='murali',company ='salesforce',LeadSource ='other'));
            }
           
            }
         insert leads;
        Test.startTest();
        String jobId= system.schedule('Proceass Leads',CRON_EXP,new  DailyLeadProcessor());
        Test.stopTest();

}
}