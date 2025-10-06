public  interface ITestSelector {
    List<Test__c> getTestsById(Set<Id> testsIds);
}