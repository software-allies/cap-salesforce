trigger Account on Account (before insert) {
    for(Account record: Trigger.new){
        if(String.isBlank(record.SACAP__UUID__c)){
            record.SACAP__UUID__c = UtilityClass.newUUID();
        }
    }
}