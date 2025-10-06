trigger TestTrigger on Test__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) {

    TestDispatcher dispatcher = (TestDispatcher)di_Injector.Org.getInstance('TestDispatcher');
    dispatcher.selectContext();
}