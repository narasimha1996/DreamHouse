({
	openUP : function(component, event, helper) {
        component.set("v.isopen" ,true);
		
	},
    
   closeModel: function(component, event, helper) {
        component.set("v.isopen", false);
        component.set("v.displaySuccess", false);
        component.set("v.disableTermWasValue", false);
        
    },
    
    likenClose: function(component, event, helper) {
        component.set("v.isopen", false);
        component.set("v.displaySuccess", false);
        component.set("v.disableTermWasValue", false);
        
    },
    
    handleError: function (cmp, event, helper) {
        cmp.find('notifLib').showToast({
            "title": "Something has gone wrong!",
            "message": event.getParam("message"),
            "variant": "error"
        });
    },
    
    handleChange: function (component, event, helper) {
        var termWas = event.getSource().get('v.value');
        if (termWas == "Voluntary"){
            component.set("v.terminationWasValue", 'Voluntary');
        }else if(termWas == "Involuntary"){
            component.set("v.terminationWasValue", 'Involuntary');
        }
        var reasonforTermination = event.getSource().get('v.value');
        if (reasonforTermination == "Other"){
            component.set("v.ReasonforTermination", 'Other');
        }else{
            component.set("v.ReasonforTermination", 'not Other');
        }
        component.set("v.disableTermWasValue", false);
    },
     handleSubmitClick: function (component, event, helper) {
         
        var newTermRequest = component.get("v.newTermRequest");
         
        newTermRequest.Driver_Name__c = component.get("v.selectedLookUpRecord").Id;         
        newTermRequest.Termination_Was__c = component.find("TerminationWas").get("v.value");
        newTermRequest.Reason_for_Termination_PL__c = component.find("ReasonforTermination").get("v.value");
        newTermRequest.Send_Termination_Email__c = component.find("sendTerminationEmail").get("v.value");
        newTermRequest.Owner_Email__c =component.find("OwnerEmail").get("v.value");
        var reasonforTermination = component.find("ReasonforTermination").get("v.value");
         
      if (reasonforTermination == "Other"){
            newTermRequest.Reason_for_Termination_Other__c = component.find("ReasonforTerminationOther").get("v.value");
        }      
		newTermRequest.Effective_Date__c = component.find("expdate").get("v.value");
        newTermRequest.Term_Letter_Requested__c = component.find("TerminationRequested").get("v.value"); 
        newTermRequest.Notes__c = component.find("notes").get("v.value"); 
         
       if(newTermRequest.Driver_Name__c == null || newTermRequest.Termination_Was__c == null || newTermRequest.Effective_Date__c == null || newTermRequest.Reason_for_Termination_PL__c == null || newTermRequest.Term_Letter_Requested__c == null/* ||  newTermRequest.Email_Address__c == null*/ ||  newTermRequest.Owner_Email__c == null ||
           newTermRequest.Driver_Name__c == '' || newTermRequest.Termination_Was__c == '' || newTermRequest.Effective_Date__c == '' || newTermRequest.Reason_for_Termination_PL__c == '' || newTermRequest.Term_Letter_Requested__c == ''|| /* newTermRequest.Email_Address__c == '' ||*/  newTermRequest.Owner_Email__c == ''){
            
             alert('check -a');
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Error!",
                "message": "Please enter all required information.",
                "type": "error"
            });
            toastEvent.fire();
        }
        else{
				
            var action = component.get("c.insertnewTermRequest");		
            action.setParams({newTermReq :newTermRequest});
            action.setCallback(this,function(response) {
                var state = response.getState();
                 alert(state);
                if(state ==="SUCCESS"){  
                    alert(response.getReturnValue());
                    component.set("v.displaySuccess", true);
                    component.set("v.disableTermWasValue", true);
              		var toastEvent = $A.get("e.force:showToast");   
                    toastEvent.setParams({
                        "title": "Success!",
                        "message": "Termination Request was submitted with the following details.",
                        "type": "success"
                    });
                    toastEvent.fire();
                }
                else{
                     alert('check -h');
                    component.set("v.displayFailure", true);
                     alert('check -i');
                    var toastEvent = $A.get("e.force:showToast");
                  toastEvent.setParams({
                        "title": "Error!",
                        "message": "Termination Request was not submitted. Please review the submission details and try again.",
                        "type": "error" 
                    });
                    toastEvent.fire();
                     alert('check -j');
                }
            });
            $A.enqueueAction(action);
        }
    }
})