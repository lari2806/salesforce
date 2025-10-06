public with sharing class CourseService implements ICourseService{
    public void fillInTeacherInCourse(List<Course__c> courses) {
    System.debug('oi, deu certo. Parabéns:) ');    
    TeacherSelector selector = (TeacherSelector) di_Injector.Org.getInstance('TeacherSelector');
    Teacher__c teacher = selector.findTeacherName();
    List<Course__c> coursesToUpdate = new List<Course__c>();

    for (Course__c course : courses) {
        Course__c courseUpdate = new Course__c();
        if (course.Teacher__c == null) {
             courseUpdate.Id = course.Id;
        courseUpdate.Teacher__c = teacher.Id;
        System.debug('courseUpdate: ' + courseUpdate);
        System.debug('teacher.Id: ' + teacher.Id);
        coursesToUpdate.add(courseUpdate);
        }
              
    }
      update coursesToUpdate;
    }
}