trigger Opportunity on Opportunity (before insert) {
    for(Opportunity record: Trigger.new){
        if(String.isBlank(record.UUID__c)){
            record.UUID__c = UtilityClass.newUUID();
        }
    }
}