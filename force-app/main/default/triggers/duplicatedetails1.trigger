trigger duplicatedetails1 on Contact (before insert) {
        set<String> SetEmail = new Set<String>();
    for(Contact c : Trigger.new){
        if(c.Email != '' || c.Email != Null){
            if(!SetEmail.contains(c.Email)){
                SetEmail.add(c.Email);
            }
        }
        
    }
    	set<String> SetPhone = new Set<String>();
    	for(Contact c:Trigger.new ){
            if(c.Phone !='' || c.Phone != Null ){
                if(!SetPhone.contains(c.Phone)){
                    SetPhone.add(c.Phone);
                }
            }
    	}
     	List<String> ExistingEmail = new List<String>();
     	List<String> ExistingPhone = new List<String>();	
    
    for(Contact con :[Select Email from Contact where email IN :SetEmail ]){
        ExistingEmail.add(con.Email);
    }
    
     for(Contact con :[Select Phone from Contact where phone IN:SetPhone]){
        ExistingPhone.add(con.Email);
    }
    
    for(Contact con : Trigger.new){      
            if(ExistingEmail.contains(con.Email) || ExistingPhone.contains(con.Phone)){
            con.adderror('Already a contact exist with these phonenumber or email');
        }
       
    }


}