trigger Opportunity on Opportunity (before insert) {
    for(Opportunity record: Trigger.new){
        if(String.isBlank(record.SACAP__UUID__c)){
            record.SACAP__UUID__c = UtilityClass.newUUID();
        }
    }
}