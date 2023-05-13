global class LeadProcessor implements Database.Batchable<Sobject> 
{
    global Database.QueryLocator start(Database.BatchableContext bc) 
    {
        Database.QueryLocator qObj;
        qObj = Database.getQueryLocator('select Id, Name, LeadSource, Rating from Lead');
        return qObj;
    }

    global void execute(Database.BatchableContext bc, List<sObject> records)
    {
        
        List<Lead> leadRecords = (List<Lead>) records;
        List<Lead> updatingLeadList = new List<Lead>();
            for (Lead leadObj : leadRecords) 
            {
                leadObj.LeadSource = 'Dreamforce';
                updatingLeadList.add(leadObj);
            }
        if(!updatingLeadList.isEmpty()){
            update updatingLeadList;
        }
        
    }    

    global void finish(Database.BatchableContext bc){   }    
}