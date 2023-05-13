trigger TerminationEmailTrigger on Driver_Termination_Request__c (after insert) {
    if(trigger.isInsert){        
       if(trigger.isAfter){
            DriverTermination.SendEmailToOwner(trigger.new);
            DriverTermination.SendEmailToDriver(trigger.new);        
        }
    }

}