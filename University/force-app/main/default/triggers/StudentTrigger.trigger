trigger StudentTrigger on Student__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) {

    TriggerDispatcher instanceDispatcher = (TriggerDispatcher) di_Injetor.org.getInstance('StudentDispatcher');
}