trigger Contact on Contact (before insert) {
    for(Contact record: Trigger.new){
        if(String.isBlank(record.UUID__c)){
            record.UUID__c = UtilityClass.newUUID();
        }
    }
}