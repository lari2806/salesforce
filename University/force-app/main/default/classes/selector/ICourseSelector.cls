public interface ICourseSelector {

    List<Course__c> getCourseById(Set<Id> courseIdSet);
    Schema.SObjectType getSObjectType();
    List<Schema.SObjectField> getSObjectFieldList();
}