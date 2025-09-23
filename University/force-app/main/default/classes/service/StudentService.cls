public with sharing class StudentService implements IStudentService {
    public void validateStatus(List<Student__c> students){

        for (Student__c student : students) {
            if (String.valueOf(student.Status_Registration__c) == 'inativo') {
                student.Status_Registration__c.addError('Não é possivel registrar alunos inativos.');
            }
        }
    }
}