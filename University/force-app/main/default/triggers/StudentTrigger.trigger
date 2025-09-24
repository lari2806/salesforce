trigger StudentTrigger on Student__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) {

    StudentDispatcher dispatcher = (StudentDispatcher)di_Injector.Org.getInstance('StudentDispatcher');
    dispatcher.selectContext();
}