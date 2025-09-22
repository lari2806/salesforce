public with sharing class StudentDispatcher implements TriggerDispatcher {
    public void selectContext(){
        TriggerHandler instanceTriggerHandler;

        if (Trigger.isBefore) {
            if (Trigger.isInsert) {
                instanceTriggerHandler = (TriggerHandler) di_Injetor.org.getInstance('StudentBeforeInsertTriggerHandler');
            }
            if (Trigger.isUpdate) {
                
            }
            if (Trigger.isDelete) {
                
            }
        }
        if (Trigger.isAfter) {
            if (Trigger.isInsert) {
                
            }
            if (Trigger.isUpdate) {
                
            }
            if (Trigger.isDelete) {
                
            }
            if (Trigger.isUndelete) {
                
            }
        }
    }
}