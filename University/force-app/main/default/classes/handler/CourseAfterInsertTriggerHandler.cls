public with sharing class CourseAfterInsertTriggerHandler implements TriggerHandler {
    public void execute(){
        this.instanceCourseService.fillInTeacherInCourse(Trigger.new);
    }
    private CourseService instanceCourseService{
        get{
            if(instanceCourseService == null){
                instanceCourseService = (CourseService) di_Injector.org.getInstance('CourseService');
            }
            return instanceCourseService;
        }
        set;
    }
}
