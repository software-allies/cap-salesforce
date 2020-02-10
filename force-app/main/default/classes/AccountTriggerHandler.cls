public with sharing class AccountTriggerHandler {
    private boolean m_isExecuting = false;
    private integer batchSize = 0;

    public AccountTriggerHandler(boolean isExecuting, integer size) {
        m_isExecuting = isExecuting;
        batchSize = size;
    }

    public void OnBeforeInsert(Account[] newAccounts){
        setUUID(newAccounts);
    }

    public void setUUID(Account[] newAccounts){
        for(Account recordToUpdate: newAccounts){
            if(String.isBlank(recordToUpdate.UUID__c)){
                recordToUpdate.UUID__c = UtilityClass.newUUID();
            }
        }
    }
}
