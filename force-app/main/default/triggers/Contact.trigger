trigger Contact on Contact (before insert) {
    ContactTriggerHandler handler = new ContactTriggerHandler(Trigger.isExecuting, Trigger.size);
    
    handler.OnBeforeInsert(Trigger.new);
}