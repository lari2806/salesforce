public with sharing class StudentService implements IStudentService {
    public void validateStatus(List<Student__c> students){

        for (Student__c student : students) {
            if (String.valueOf(student.Status_Registration__c) == 'inativo') {
                student.Status_Registration__c.addError('Não é possivel registrar alunos inativos.');
            }
        }
    }

     public void validateStudentInCourses(List<Student__c> newStudents, Map<Id, Student__c> oldMap)
    {
            Set<Id> oldCourseId = new Set<Id>();
            Set<Id> newCourseId = new Set<Id>();

            List<Student__c> students = new List<Student__c>();

            for (Student__c student : newStudents) {
                Student__c oldStudent = oldMap.get(student.Id);
                
                if (oldStudent != null && oldStudent.Course__c != student.Course__c) {
                    oldCourseId.add(oldStudent.Course__c);
                }
                if (student.Course__c != null) {
                    newCourseId.add(student.Course__c);
                }
               
            }

            Set<Id> courseId = new Set<Id>();
            courseId.addAll(oldCourseId);
            courseId.addAll(newCourseId);
    } 
}


            
           



