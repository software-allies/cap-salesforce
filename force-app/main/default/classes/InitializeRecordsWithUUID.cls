global class InitializeRecordsWithUUID implements Database.Batchable<sObject>{
    global final String queryString;
 
    global InitializeRecordsWithUUID(String name){
        queryString = 'SELECT Id, SACAP__UUID__c FROM '+name+' WHERE SACAP__UUID__c = null';
    }
 
    global Database.QueryLocator start(Database.BatchableContext BC){
       return Database.getQueryLocator(queryString);
    }
 
    global void execute(Database.BatchableContext BC, List<sObject> scope){
       for(Sobject s : scope){
           s.put('SACAP__UUID__c', UtilityClass.newUUID()); 
       }      
       update scope;
    }
 
    global void finish(Database.BatchableContext BC){
 
    }
 }