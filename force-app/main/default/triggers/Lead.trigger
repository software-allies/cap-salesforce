trigger Lead on Lead (before insert) {
    for(Lead record: Trigger.new){
        if(String.isBlank(record.UUID__c)){
            record.UUID__c = UtilityClass.newUUID();
        }
    }
}