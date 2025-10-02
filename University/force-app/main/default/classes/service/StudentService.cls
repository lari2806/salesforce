public with sharing class StudentService implements IStudentService {
    public void validateStatus(List<Student__c> students){

        for (Student__c student : students) {
            if (String.valueOf(student.Status_Registration__c) == 'inativo') {
                student.Status_Registration__c.addError('Não é possivel registrar alunos inativos.');
            }
        }
    }

    public void validateStudentInCourses(List<Student__c> students){
        Set<Id> coursesId = new Set<Id>();

        StudentSelector studentSelector = (StudentSelector) di_Injector.Org.getInstance('StudentSelector');

        students = studentSelector.lookupForIdenticalStatus();

        for (Student__c student : students) {
            if (student.Course__c != null)  {
                coursesId.add(student.Course__c);
            }   
        }
        CourseSelector courseSelector = (CourseSelector) di_Injector.Org.getInstance('CourseSelector');
        List<Course__c> courses = courseSelector.getCourseById(coursesId);

        for (Student__c student : students) {
            if (student.Course__c != null) {
                for (Course__c course : courses) {
                    if (student.Course__c == course.Id){
                        if (course.Number_Of_Students__c == null) {
                            course.Number_Of_Students__c = 0;
                        }
                        if (course.Number_Of_Students__c > 0) {
                            course.Number_Of_Students__c -= 1;
                        }
                    }
                }
            }
        } 
        update courses;
    } 
    public void addStudentInCourse(List<Student__c> students){
        Set<Id> coursesId = new Set<Id>();
    
            for (Student__c student : students) {
                if (student.Course__c != null)  {
                    coursesId.add(student.Course__c);
                }   
            }
            CourseSelector courseSelector = (CourseSelector) di_Injector.Org.getInstance('CourseSelector');
            List<Course__c> courses = courseSelector.getCourseById(coursesId);

                    for (Course__c course : courses) {
                    
                            if (course.Number_Of_Students__c == null) {
                                course.Number_Of_Students__c = 0;
                            }
                            
                                course.Number_Of_Students__c += 1;
                    }
                    update courses;
                }

                
    public void messageTeacher(List<Student__c> students){
        List<String> nomesInativos = new List<String>();
        Set<Id> courseIds = new Set<Id>();
        Set<Id> teacherIds = new Set<Id>();

        for (Student__c student : students) {
            if (student.Status_Registration__c != 'ativo') {
                nomesInativos.add(student.Name);
                if (student.Course__c != null) {
                    courseIds.add(student.Course__c);
                }
            }
        }
        if (nomesInativos.isEmpty()) {
            return;
        }

        CourseSelector courseSelector = (CourseSelector) di_Injector.Org.getInstance('CourseSelector');
        List<Course__c> courses = courseSelector.getCourseById(courseIds);

        for (Course__c course : courses) {
            if (course.Teacher__c != null) {
                teacherIds.add(course.Teacher__c);
            }
        }

        TeacherSelector teacherSelector = (TeacherSelector) di_Injector.Org.getInstance('TeacherSelector');
        List<Teacher__c> teachers = teacherSelector.getTeachers();
        List<String> emailAddresses = new List<String>();

        for (Teacher__c teacher : teachers) {
            if (teacherIds.contains(teacher.Id) && teacher.Email_Teacher__c != null) {
                emailAddresses.add(teacher.Email_Teacher__c);
            }
        }

        if (!emailAddresses.isEmpty()) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(emailAddresses);
            mail.setSubject('Aviso: alunos inativos');
            mail.setPlainTextBody('Olá professor(a),\n\nOs seguintes alunos estão inativos:\n' +
                                String.join(nomesInativos, ', ') +
                                '\n\nPor favor, verifique no sistema.');
            Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
            System.debug('Resultado do envio: ' + results[0].isSuccess());
            System.debug('E-mails enviados para: ' + emailAddresses);
        }
    }


   public void fillInTeacherInCourse(List<Course__c> courses) {
    String teacher = System.Label.Teacher;
    System.debug('olá' + mensagem);

 
}


}
 
    

    //setToAddresses();
    //example: mail.setToAddresses(toAddress);


