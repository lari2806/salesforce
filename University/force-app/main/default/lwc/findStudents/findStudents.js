import { LightningElement, wire } from 'lwc';
import STUDENT_OBJECT from '@salesforce/schema/Student__c';
import NAME_FIELD from '@salesforce/schema/Student__c.Name';
import REGISTRATION_FIELD from '@salesforce/schema/Student__c.Registration__c';
import STATUS_FIELD from '@salesforce/schema/Student__c.Status_Registration__c';
import COURSE_FIELD from '@salesforce/schema/Student__c.Course__c';
import getStudents from '@salesforce/apex/StudentController.getStudents';
import { NavigationMixin } from 'lightning/navigation';


const COLUMNS = [
  { label: 'Account Name', fieldName: NAME_FIELD.fieldApiName, type: 'text' },
  { label: 'Id', fieldName: REGISTRATION_FIELD.fieldApiName, type: 'text' },
  { label: 'Status student', fieldName: STATUS_FIELD.fieldApiName, type: 'text' },
  { label: 'Course', fieldName: COURSE_FIELD.fieldApiName, type: 'text' },
];
export default class findStudents extends NavigationMixin(LightningElement) {
  filter = '';
  objectApiName = STUDENT_OBJECT;
  fields = [NAME_FIELD, REGISTRATION_FIELD, STATUS_FIELD, COURSE_FIELD];

  columns = COLUMNS;
  students = [];
  @wire(getStudents, { filter: '$filter' })
  wireStudent({ data, error }) {
    if (data) {
      this.students = data;
      this.error = undefined;
    } else if (error) {
      this.error = error;
      this.students = undefined;
    }
  }

  handleClickAtivo(event) {
    this.filter = 'Ativo';
  }

  handleClickInativo(event) {
    this.filter = 'Inativo';
  }
  handleClickAll(event) {
    this.filter = '';
  }

  handleClickNewStudent(event) {
    this[NavigationMixin.Navigate]({
      type: 'standard__objectPage',
      attributes:
      {
        objectApiName: 'Student__c',
        actionName: 'new'
      }
    });
  }
}
