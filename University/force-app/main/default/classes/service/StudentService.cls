public with sharing class StudentService implements IStudentService {
    public void validateStatus(List<Student__c> students){
        StudentSelector selector  = (StudentSelector) di_Injector.Org.getInstance('StudentSelector');
        boolean result;
        for (Student__c student : students) {
            result = selector.lookupForIdenticalStatus();
            if (String.valueOf(student.Status_Registration__c) == 'inativo') {
                student.Status_Registration__c.addError('Não é possivel registrar alunos inativos.');
            }
            if (result == false) {
                student.Status_Registration__c.addError('o aluno ja esta ali');
            }
            if (String.valueOf(student.Status_Registration__c ) == 'inativo' && result == true) {
                
            }
        }
    }
}