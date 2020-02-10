trigger Account on Account (before insert) {
    AccountTriggerHandler handler = new AccountTriggerHandler(Trigger.isExecuting, Trigger.size);
    
    handler.OnBeforeInsert(Trigger.new);
}