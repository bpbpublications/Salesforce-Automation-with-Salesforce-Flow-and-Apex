trigger LeadTrigger on Lead (
    before insert, after insert, 
    before update, after update, 
    before delete, after delete, 
    after undelete
) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            // Handle logic for before insert
        } else if (Trigger.isUpdate) {
            // Handle logic for before update
        } else if (Trigger.isDelete) {
            // Handle logic for before delete
        }
    } else {
        // Handle after triggers
        if (Trigger.isInsert) {
            // Handle logic for after insert
        } else if (Trigger.isUpdate) {
            // Handle logic for after update
        } else if (Trigger.isDelete) {
            // Handle logic for after delete
        } else if (Trigger.isUndelete) {
            // Handle logic for after undelete
        }
    }
}
