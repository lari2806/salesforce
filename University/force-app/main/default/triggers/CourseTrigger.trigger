trigger CourseTrigger on Course__c (before insert, after insert, before update, after update, before delete, after delete, after undelete){
    CourseDispatcher dispatcher = (CourseDispatcher)di_Injector.Org.getInstance('CourseDispatcher');
    dispatcher.selectContext();
}