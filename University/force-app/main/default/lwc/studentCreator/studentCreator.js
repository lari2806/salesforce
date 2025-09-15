import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import STUDENT_OBJECT from '@salesforce/schema/Student__c';
import NAME_FIELD from '@salesforce/schema/Student__c.Name';
import REGISTRATION_FIELD from '@salesforce/schema/Student__c.Registration__c';
import STATUS_FIELD from '@salesforce/schema/Student__c.Status_Registration__c';
import COURSE from '@salesforce/schema/Student__c.Course__c';
export default class StudentCreator extends LightningElement {
    studentName = NAME_FIELD;
    registrationStudent = REGISTRATION_FIELD;
    statusStudent = STATUS_FIELD;
    courseStudent = COURSE;

    objectApiName = STUDENT_OBJECT;
    fields = [NAME_FIELD, REGISTRATION_FIELD, STATUS_FIELD];
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Student created",
            message: "Name Student: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}