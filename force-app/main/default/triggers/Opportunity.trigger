trigger Opportunity on Opportunity (before insert) {
    OpportunityTriggerHandler handler = new OpportunityTriggerHandler(Trigger.isExecuting, Trigger.size);

    handler.OnBeforeInsert(Trigger.new);
}