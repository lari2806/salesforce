public interface ICourseSelector {

    boolean lookupForIdenticalStatus();
    Schema.SObjectType getSObjectType();
    List<Schema.SObjectField> getSObjectFieldList();
    List<Student__c> selectById(Set<Id> idset);
}