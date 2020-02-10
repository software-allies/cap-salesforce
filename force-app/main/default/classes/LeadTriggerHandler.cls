public with sharing class LeadTriggerHandler {
    private boolean mIsExecuting = false;
    private integer batchSize = 0;

    public LeadTriggerHandler(boolean isExecuting, integer size) {
        mIsExecuting = isExecuting;
        batchSize = size;
    }

    public void OnBeforeInsert(Lead[] newLeads){
        setUUID(newLeads);
    }

    public void setUUID(Lead[] newLeads){
        for(Lead recordToUpdate: newLeads){
            if(String.isBlank(recordToUpdate.UUID__c)){
                recordToUpdate.UUID__c = UtilityClass.newUUID();
            }
        }
    }
}
