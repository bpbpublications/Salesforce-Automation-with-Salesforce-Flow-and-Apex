trigger ContactTrigger on Contact (after insert, after update, after delete) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            ContactTriggerHandler.handleContacts(Trigger.new);
        }
    }
}
