public with sharing class TestSelector implements ITestSelector {
    public List<Student__c> getTestsById(Set<Id> courseIds) {
         List<Student__c> students = [
            SELECT Id, Name, Email__c, Course__c
            FROM Student__c
            WHERE Course__c IN :courseIds
        ];
    }
}
