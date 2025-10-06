public with sharing class TestDispatcher implements TriggerDispatcher {
   public void selectContext(){
        TriggerHandler instanceTriggerHandler;

        if (Trigger.isBefore) {
            if (Trigger.isInsert) {
                
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
                instanceTriggerHandler = (TriggerHandler) di_Injector.org.getInstance('TestAfterInsertTriggerHandler');
            }
            if (Trigger.isUpdate) {
                
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