public with sharing class CourseSelector implements ICourseSelector {
     public List<Course__c> getCourseById(Set<Id> courseIdSet){

        List<Course__c> courses = [SELECT Id, Name, Number_Of_Students__c
        FROM Course__c 
        WHERE Id IN :courseIdSet ];
        
        return courses;
    }

    public Schema.SObjectType getSObjectType(){
        return Course__c.SObjectType;
    }
    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField>{
            Course__c.Name,
            Course__c.Number_Of_Students__c
        } ;
    }
    
}


