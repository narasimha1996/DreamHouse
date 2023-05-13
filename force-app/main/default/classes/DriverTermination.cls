public with sharing class DriverTermination {
    @AuraEnabled
    Public static void SendEmailToOwner(List<Driver_Termination_Request__c> Re){
        set<Id> ids = new set<Id>();
        for(Driver_Termination_Request__c TR :Re){
            if(TR.Termination_Was__c == 'Yes'){
                ids.add(TR.Id);
            }   
        }
        List<Driver_Termination_Request__c> DTR = new List<Driver_Termination_Request__c>();
        DTR =[Select id,Driver_Name__c,Termination_Was__c,Reason_for_Termination_PL__c,Term_Letter_Requested__c,Effective_date__c,Notes__c,Owner_Email__c From Driver_Termination_Request__c where ID=:ids];
        
        List<Messaging.SingleEmailMessage> OwnerEmailList = new List<Messaging.SingleEmailMessage>();
        for(Driver_Termination_Request__c TR:DTR){
           String emailTemplateName = 'Owner_Termination_Mail';
           Id targetObjectID = TR.OwnerId;
           String[] OwnerEmailAddress =new String[]{TR.Owner_Email__c};
           Id whatId = TR.Id;
   			Messaging.SingleEmailMessage emailToSendOwner = new Messaging.SingleEmailMessage();
            emailToSendOwner.setTargetObjectId(targetObjectID);
            emailToSendOwner.setWhatId(whatId);
            emailToSendOwner.setTemplateId(emailTemplateName);
            emailToSendOwner.setToAddresses(OwnerEmailAddress);
            if(emailToSendOwner != null){
                OwnerEmailList.add(emailToSendOwner);
            }
        }
        if(OwnerEmailList.size()>0)   {
            try{
                Messaging.sendEmail(OwnerEmailList);
            }
            catch(exception e){
                system.debug('error in sending mobiles'+e);
            }
        }

    }
    @AuraEnabled
    Public static void SendEmailToDriver(List<Driver_Termination_Request__c> DR){
         set<id> driverids = new set<id>();     
        for(Driver_Termination_Request__c TR :DR){
                driverids.add(TR.id);
        }
        List<Driver_Termination_Request__c> DTR = new List<Driver_Termination_Request__c>();
        DTR =[Select id,Driver_Name__c,Termination_Was__c,Reason_for_Termination_PL__c,Term_Letter_Requested__c,Effective_date__c,Notes__c,Driver_Name__r.Email From Driver_Termination_Request__c where id=:driverids];
        List<Messaging.SingleEmailMessage> DriverEmailList = new List<Messaging.SingleEmailMessage>();
        for(Driver_Termination_Request__c TR:DTR){
           String emailTemplateName = 'Driver_Termination_Email';
           id targetObjectID = TR.Driver_Name__r.Id;	
           String[] DriverEmailAddress =new String[]{TR.Driver_Name__r.Email};
           id whatId = TR.Id;
            Messaging.SingleEmailMessage emailToSendDriver = new Messaging.SingleEmailMessage();
         	/*emailToSendDriver.setTemplateId(emailTemplateName);*/
           	emailToSendDriver.setTargetObjectId(targetObjectID);
            emailToSendDriver.setToAddresses(DriverEmailAddress);
            emailToSendDriver.setWhatId(whatId);
           if(emailToSendDriver != null){
                DriverEmailList.add(emailToSendDriver);
            }

        }
         if(DriverEmailList.size()>0)   {
            try{
                Messaging.sendEmail(DriverEmailList);
            }
            catch(exception e){
                system.debug('error in sending mobiles'+e);
            }
        }

        
    } 
    
    @AuraEnabled
    Public static String insertnewTermRequest(Driver_Termination_Request__c newTermReq){
       newTermReq.Name = 'suresh';	
       insert newTermReq;
       return newTermReq.Id;
    }

}