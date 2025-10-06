public interface IStudentSelector {

    List<Student__c> lookupForIdenticalStatus();
    List<Student__c> getTestsById(Set<Id> courseIds);
    Schema.SObjectType getSObjectType();
    List<Schema.SObjectField> getSObjectFieldList();
    List<Student__c> selectById(Set<Id> idset);
}