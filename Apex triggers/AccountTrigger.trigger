trigger AccountTrigger on Contact (after insert) {
  AccountTriggerHandler.handleContactUpdate(Trigger.new);
}
