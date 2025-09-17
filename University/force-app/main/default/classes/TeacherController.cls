public with sharing class TeacherController {
    @AuraEnabled(cacheable=true)
    public static List<Student__c> getCoursesByTeacher(Id teacherId) {

        return [
            SELECT Id, Name, Course__r.Name, Course__r.Teacher__r.Name
            FROM Student__c
            WHERE Course__r.Teacher__c = :teacherId
            LIMIT 200
        ];
    }

}

