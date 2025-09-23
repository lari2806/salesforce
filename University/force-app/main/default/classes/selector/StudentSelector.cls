public with sharing class StudentSelector extends fflib_SObjectSelector  implements IStudentSelector {
    public boolean lookupForIdenticalStatus(){
        List<Student__c> students = [SELECT Id, Name, Status_Registration__c
        FROM Student__c 
        WHERE Status_Registration__c ='inativo'];
        return students.isEmpty();
    }

    public Schema.SObjectType getSObjectType(){
        return Student__c.SObjectType;
    }
    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField>{
            Student__c.Name,
            Student__c.Registration__c,
            Student__c.Status_Registration__c
        } ;
    }

    public List<Student__c> selectById(Set<Id> idSet){
        return (List<Student__c>) selectSObjectsById(idSet);
    }
}