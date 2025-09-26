public interface IStudentService {
    void validateStatus(List<Student__c> students);
    void validateStudentInCourses(List<Student__c> students);
    void addStudentInCourse(List<Student__c> students);
    void messageTeacher();
}