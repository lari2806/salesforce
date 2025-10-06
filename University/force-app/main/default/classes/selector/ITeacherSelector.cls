public interface ITeacherSelector {
    List<Teacher__c> getTeachers();
    Schema.SObjectType getSObjectType();
    List<Schema.SObjectField> getSObjectFieldList();
    Teacher__c findTeacherName();
}