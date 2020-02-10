trigger Lead on Lead (before insert) {
    for(Lead record: Trigger.new){
        if(String.isBlank(record.SACAP__UUID__c)){
            record.SACAP__UUID__c = UtilityClass.newUUID();
        }
    }
}