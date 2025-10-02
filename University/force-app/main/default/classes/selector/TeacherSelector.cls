public with sharing class TeacherSelector implements ITeacherSelector {


public  List<Teacher__c> getTeachers(){
    List<Teacher__c> teachers = [SELECT Id, Name, Email_Teacher__c, Course__c 
    FROM Teacher__c
    WHERE Email_Teacher__c != null];

        
        return teachers;
    }

    public Schema.SObjectType getSObjectType(){
        return Teacher__c.SObjectType;
    }
    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField>{
            Teacher__c.Name,
            Teacher__c.Email_Teacher__c
        } ;
    }

}