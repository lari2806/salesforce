public with sharing class TestService implements ITestService{
    public void addTasksTests(List<Test__c> newTests){
        Set<Id> courseIds = new Set<Id>();
    
            for (Test__c test : newTests) {
                if (test.Course__c != null) {
                    courseIds.add(test.Course__c);
                }  
            }

            List<Task> tasksToCreate = new List<Task>();
            List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();

            StudentSelector StudentSelector = (StudentSelector) di_Injector.Org.getInstance('StudentSelector');
            List<Student__c> students = StudentSelector.getTestsById(courseIds);
                for (Test__c test : newTests) {
                    for (Student__c student : students) {
                        if (student.Course__c == test.Course__c) {
                        Task task = new Task();
                        task.Subject = 'Preparar para o teste: ' + test.Name;
                        task.Priority = 'Normal';
                        task.WhatId = test.Id; 
                                
                        tasksToCreate.add(task);


                        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                        email.setToAddresses(new String[] { student.Email__c });
                        email.setSubject('Há uma nova task' + test.Name);
                        email.setPlainTextBody(
                        'Olá ' + student.Name + 'há uma nova task para você completar!'
                        );
                        emailsToSend.add(email);
                        


                        }
                    }
                }
                if (!tasksToCreate.isEmpty()) {
                    insert tasksToCreate;
                }
                if (!emailsToSend.isEmpty()) {
                    Messaging.sendEmail(emailsToSend);
        }
    }

}





