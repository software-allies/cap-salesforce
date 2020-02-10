public with sharing class ContactTriggerHandler {
    private boolean mIsExecuting = false;
    private integer batchSize = 0;

    public ContactTriggerHandler(boolean isExecuting, integer size) {
        mIsExecuting = isExecuting;
        batchSize = size;
    }

    public void OnBeforeInsert(Contact[] newContacts){
        setUUID(newContacts);
    }

    public void setUUID(Contact[] newContacts){
        for(Contact recordToUpdate: newContacts){
            if(String.isBlank(recordToUpdate.UUID__c)){
                recordToUpdate.UUID__c = UtilityClass.newUUID();
            }
        }
    }
}
