trigger StudentTrigger on Student__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) {

    
    TriggerDispatcher dispatcher = (TriggerDispatcher) di_Injector.Org.getInstance('TriggerDispatcher');
}