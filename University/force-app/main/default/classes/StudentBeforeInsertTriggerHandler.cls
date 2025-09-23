public with sharing class StudentBeforeInsertTriggerHandler implements TriggerHandler {
    public void execute(){
        this.instanceStudentService.validateStatus(Trigger.new);
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