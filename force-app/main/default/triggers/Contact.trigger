trigger Contact on Contact (before insert) {
    for(Contact record: Trigger.new){
        if(String.isBlank(record.SACAP__UUID__c)){
            record.SACAP__UUID__c = UtilityClass.newUUID();
        }
    }
}