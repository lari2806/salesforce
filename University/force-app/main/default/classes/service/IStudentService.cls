public interface IStudentService {
    void validateStatus(List<Student__c> students);
    void validateStudentInCourses(List<Student__c> newStudents, Map<Id, Student__c> oldMap);
}