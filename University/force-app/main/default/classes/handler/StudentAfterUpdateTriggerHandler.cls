public with sharing class StudentAfterUpdateTriggerHandler implements TriggerHandler{
    public void execute(){
        this.instanceStudentService.validateStudentInCourses((List<Student__c>) Trigger.new);
    }

    private StudentService instanceStudentService{
        get{
            if(instanceStudentService == null){
                instanceStudentService = (StudentService) di_Injector.org.getInstance('StudentService');
            }
            return instanceStudentService;
        }
        set;
    }
}