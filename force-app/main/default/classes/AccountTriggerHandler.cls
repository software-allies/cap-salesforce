public with sharing class AccountTriggerHandler {
    private boolean m_isExecuting = false;
    private integer batchSize = 0;

    public AccountTriggerHandler(boolean isExecuting, integer size) {
        m_isExecuting = isExecuting;
        batchSize = size;
    }

    public void OnBeforeInsert(Account[] newAccounts){
        AccountService.setUUID(newAccounts);
    }
}
