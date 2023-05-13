public without sharing class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx){
        List<Lead> leads = [select id,LeadSource from Lead where LeadSource= null Limit 200];
        for(Lead l:leads){
            l.LeadSource = 'Dreamforce';
        }
        update leads;
    }

}