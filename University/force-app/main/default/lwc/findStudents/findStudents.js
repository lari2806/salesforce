import { LightningElement, wire } from 'lwc';;
import STUDENT_OBJECT from '@salesforce/schema/Student__c';
import NAME_FIELD from '@salesforce/schema/Student__c.Name';
import REGISTRATION_FIELD from '@salesforce/schema/Student__c.Registration__c';
import STATUS_FIELD from '@salesforce/schema/Student__c.Status_Registration__c';
import getStudents from '@salesforce/apex/StudentController.getStudents';


const COLUMNS = [
    { label: 'Account Name', fieldName: NAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Registration', fieldName: REGISTRATION_FIELD.fieldApiName, type: 'text' },
    { label: 'Status student', fieldName: STATUS_FIELD.fieldApiName, type: 'text' }
];
export default class AccountCreator extends LightningElement {
    objectApiName = STUDENT_OBJECT;
    fields = [NAME_FIELD, REGISTRATION_FIELD,STATUS_FIELD];

    columns = COLUMNS;
    @wire(getStudents, { filter:{$filter}  })
    students;



}
