public with sharing class StudentController {
    @AuraEnabled(cacheable=true)
    public static List<Student__c> getStudents(String filter) {
        if(filter == 'ativo' || filter == 'inativo'){
             return [
                SELECT Name, Registration__c, Status_Registration__c 
                FROM Student__c
                WHERE Status_Registration__c = :filter
                WITH SECURITY_ENFORCED
                ORDER BY Name
                ];
        } else {
             return [
              SELECT Name, Registration__c, Status_Registration__c
              FROM Student__c
              WITH SECURITY_ENFORCED
              ORDER BY Name
              ];
        }
    }
    @AuraEnabled(cacheable=true)
    public static Student__c fieldCepStudents(String cep){

        CepDTO CepDTO = CepService.getEnderecoCep(cep);
        Student__c student = new Student__c();
        student.Cep__c = CepDTO.cep;
        student.Logradouro__c = CepDTO.logradouro;
        student.Bairro__c = CepDTO.bairro;
        student.Cidade__c = CepDTO.localidade;
        student.Uf__c = CepDTO.uf;
        return student;

    }
}