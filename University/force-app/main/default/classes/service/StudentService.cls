public with sharing class StudentService implements IStudentService {
    public void validateStatus(List<Student__c> students){

        for (Student__c student : students) {
            if (String.valueOf(student.Status_Registration__c) == 'inativo') {
                student.Status_Registration__c.addError('Não é possivel registrar alunos inativos.');
            }
        }
    }

     public void validateStudentInCourses(List<Student__c> students)
    {
        
            Set<Id> coursesId = new Set<Id>();

            StudentSelector studentSelector = (StudentSelector) di_Injector.Org.getInstance('StudentSelector');


            students = studentSelector.lookupForIdenticalStatus();

            for (Student__c student : students) {
                if (student.Course__c != null)  {
                    coursesId.add(student.Course__c);
                }   
            }
            CourseSelector courseSelector = (CourseSelector) di_Injector.Org.getInstance('CourseSelector');
            List<Course__c> courses = courseSelector.getCourseById(coursesId);

            for (Student__c student : students) {
                if (student.Course__c != null) {
                    for (Course__c course : courses) {
                        if (student.Course__c == course.Id){
                            if (course.Number_Of_Students__c == null) {
                                course.Number_Of_Students__c = 0;
                            }
                            if (course.Number_Of_Students__c > 0) {
                                course.Number_Of_Students__c += 1;
                            }
                        }
                    }
                }
            } 

    } 
    public void addStudentInCourse(List<Student__c> students){

        Set<Id> coursesId = new Set<Id>();

            for (Student__c student : students) {
                if (student.Course__c != null)  {
                    coursesId.add(student.Course__c);
                }   
            }
            CourseSelector courseSelector = (CourseSelector) di_Injector.Org.getInstance('CourseSelector');
            List<Course__c> courses = courseSelector.getCourseById(coursesId);

           
                    for (Course__c course : courses) {
                    
                            if (course.Number_Of_Students__c == null) {
                                course.Number_Of_Students__c = 0;
                            }
                            if (course.Number_Of_Students__c > 0) {
                                course.Number_Of_Students__c += 1;
        
                        }
                    }
                }
            } 
    



