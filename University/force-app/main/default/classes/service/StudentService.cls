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
            Map<Id, Integer> studentCountByCourse = new Map<Id, Integer>();

            for (Student__c student : students) {
                
                if (student.Course__c != null && student.Status_Registration__c != 'inativo' )  {
                    coursesId.add(student.Course__c);
                }
              
               
            }

            CourseSelector courseSelector = (CourseSelector) di_Injector.Org.getInstance('CourseSelector');
            List<Course__c> courses = courseSelector.getCourseById(coursesId);


            List<Course__c> coursesToUpdate = new List<Course__c>();

            for (Course__c course : courses) {
            Integer studentsValue= 0;
                for (Student__c student : students) {
                    if (student.Course__c == course.Id && student.Status_Registration__c != 'inativo') {
                        studentsValue++;
                    }
                    }
                    course.Number_Of_Students__c = studentsValue;
                    coursesToUpdate.add(course);

            }

            if (!coursesToUpdate.isEmpty()) {
            update coursesToUpdate;
            }

    } 


}


