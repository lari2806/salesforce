public with sharing class TestAfterInsertTriggerHandler implements TriggerHandler {
      public void execute(){
        this.instanceTestService.addTasksTests(Trigger.new);
    }
    private TestService instanceTestService{
        get{
            if(instanceTestService == null){
                instanceTestService = (TestService) di_Injector.org.getInstance('TestService');
            }
            return instanceTestService;
        }
        set;
    }
}