trigger Lead on Lead (before insert) {
    LeadTriggerHandler handler = new LeadTriggerHandler(Trigger.isExecuting, Trigger.size);

    handler.OnBeforeInsert(Trigger.new);
}