public with sharing class StudentAfterInsertTriggerHandler implements TriggerHandler {
    public void execute(){
        this.instanceStudentService.addStudentInCourse(Trigger.new);
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