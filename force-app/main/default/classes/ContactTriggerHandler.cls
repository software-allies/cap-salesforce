public with sharing class ContactTriggerHandler {
    private boolean m_isExecuting = false;
    private integer batchSize = 0;

    public ContactTriggerHandler(boolean isExecuting, integer size) {
        m_isExecuting = isExecuting;
        batchSize = size;
    }

    public void OnBeforeInsert(Contact[] newContacts){
        setUUID(newContacts);
    }

    public static void setUUID(Contact[] newContacts){
        for(Contact recordToUpdate: newContacts){
            if(String.isBlank(recordToUpdate.UUID__c)){
                recordToUpdate.UUID__c = UtilityClass.newUUID();
            }
        }
    }
}
