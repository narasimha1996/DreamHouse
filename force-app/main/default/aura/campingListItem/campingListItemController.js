({
	packItem : function(component, event, helper) {
        var btnClicked = event.getsource();
       	var btnMessage=btnClicked.get("v.disabled", "true");
        component.set("v.item.Packed__c","true");
		
	}
})