public with sharing class TeacherController {

    @AuraEnabled(cacheable=true)
    public static List<Teacher__c> getTeachers(String courses){
       return [
                SELECT Name, courses__c  
                FROM Student__c
                WHERE courses__c = :courses
                WITH SECURITY_ENFORCED
                ORDER BY Name
                ]; 
    }
}