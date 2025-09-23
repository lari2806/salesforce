public with sharing class StudentStatusController {
    public static List<Student__c> getStudents() {
        
        List<Student__c> students = [SELECT Id, Name, Registration__c, Status_Registration__c FROM Student__c];
        return students;
        
    }
}