public with sharing class OpportunityTriggerHandler {
    private boolean mIsExecuting = false;
    private integer batchSize = 0;

    public OpportunityTriggerHandler(boolean isExecuting, integer size) {
        mIsExecuting = isExecuting;
        batchSize = size;
    }

    public void OnBeforeInsert(Opportunity [] newOpportunities){
        setUUID(newOpportunities);
    }

    public void setUUID(Opportunity[] newOpportunities){
        for(Opportunity recordToUpdate: newOpportunities){
            if(String.isBlank(recordToUpdate.UUID__c)){
                recordToUpdate.UUID__c = UtilityClass.newUUID();
            }
        }
    }
}
