trigger Account on Account (before insert) {
    for(Account record: Trigger.new){
        if(String.isBlank(record.UUID__c)){
            record.UUID__c = UtilityClass.newUUID();
        }
    }
}