public with sharing class TeacherController {
    @AuraEnabled(cacheable=true)
public static List<Course__c> getCoursesByTeacher(Id teacherId) {
    return [
        SELECT Id, Name, Teacher__r.Name,
               (SELECT Id, Name FROM Students__r)
        FROM Course__c  
        WHERE Teacher__c = :teacherId
    ];
}

}

