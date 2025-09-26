public with sharing class StudentDispatcher implements TriggerDispatcher {
    public void selectContext(){
        TriggerHandler instanceTriggerHandler;

        if (Trigger.isBefore) {
            if (Trigger.isInsert) {
                instanceTriggerHandler = (TriggerHandler) di_Injector.org.getInstance('StudentBeforeInsertTriggerHandler');
            }
            if (Trigger.isUpdate) {
            }
            if (Trigger.isUpdate) {
                
            }
            if (Trigger.isDelete) {
                
            }
        }
        if (Trigger.isAfter) {
            if (Trigger.isInsert) {
                instanceTriggerHandler = (TriggerHandler) di_Injector.org.getInstance('StudentAfterInsertTriggerHandler');
            }
            if (Trigger.isUpdate) {
                instanceTriggerHandler = (TriggerHandler) di_Injector.org.getInstance('StudentAfterUpdateTriggerHandler');
            }
            if (Trigger.isDelete) {
                
            }
            if (Trigger.isUndelete) {
                
            }
        }
        if (instanceTriggerHandler == null) {
           return; 
        }
        instanceTriggerHandler.execute();
    }
}

