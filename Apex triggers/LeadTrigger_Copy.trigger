trigger LeadTrigger on Lead (before insert) {
    DataLoad_Setting__c objSetting = DataLoad_Setting__c.getInstance(UserInfo.getUserId());
    
    // Skip trigger execution if Large Data Load setting is enabled
    if (objSetting.LargeData_Load__c) {
        return; 
    }
    
    LeadTriggerHandler.beforeInsert(Trigger.new);
}