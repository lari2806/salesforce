public with sharing class StudentController {
    @AuraEnabled(cacheable=true)
    public static List<Student__c> getStudents(String filter) {
        if(filter == 'ativo' || filter == 'inativo'){
             return [
                SELECT Name, Registration__c, Status_Registration__c 
                FROM Student__c
                WHERE Status_Registration__c = :filter
                WITH SECURITY_ENFORCED
                ORDER BY Name
                ];
        } else {
             return [
              SELECT Name, Registration__c, Status_Registration__c
              FROM Student__c
              WITH SECURITY_ENFORCED
              ORDER BY Name
              ];
        }
    }
}