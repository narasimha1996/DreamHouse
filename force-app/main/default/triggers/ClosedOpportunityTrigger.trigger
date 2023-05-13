trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    List<Task> Listacc = new List<Task>();
    List<Opportunity> o = [select id,StageName from Opportunity where StageName = 'Closed Won' and id IN :Trigger.new ];
    For(Opportunity opp:o){
        Listacc.add(new Task(Subject='Follow Up Test Task',WhatId =opp.Id));
    }
   insert Listacc;

}