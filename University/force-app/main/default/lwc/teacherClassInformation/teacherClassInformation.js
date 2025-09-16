import { LightningElement, track } from 'lwc';
import searchTeachers from '@salesforce/apex/TeacherController.searchTeachers';
import TEACHER_NAME_FIELD from '@salesforce/schema/Teacher__c.Name';
import { NavigationMixin } from 'lightning/navigation';
import TEACHER_OBJECT from '@salesforce/schema/Teacher__c';
import NAME_FIELD from '@salesforce/schema/Student__c.Name';
import COURSE_FIELD from '@salesforce/schema/Student__c.Course__c';
import COURSE_TEACHER_FIELD from '@salesforce/schema/Course__c.Teacher__c';


const COLUMNS = [
    { label: 'Name', fieldName: TEACHER_NAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Account Name', fieldName: NAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Course', fieldName: COURSE_FIELD.fieldApiName, type: 'text' },
    { label: 'Course Teacher', fieldName: COURSE_TEACHER_FIELD.fieldApiName, type: 'text' },
];

export default class TeacherSearch extends NavigationMixin(LightningElement) {
    teacher = TEACHER_NAME_FIELD;

    objectApiName = TEACHER_OBJECT;
    fields = [NAME_FIELD, COURSE_FIELD, COURSE_TEACHER_FIELD];
    columns = COLUMNS;
    @track teachers = [];
    @track TeacherSearch = '';
    @track noResults = false;
    handleSearch(event) {
        const searchTerm = event.target.value;
        if (searchTerm) {
            searchTeachers({ searchKey: searchTerm })
                .then(result => {
                    this.teachers = result;
                    this.noResults = result.length === 0;
                })
                .catch(error => {
                    console.error('Error searching teachers ', error);
                    this.teachers = undefined;
                    this.noResults = true;
                });
        } else {
            this.teachers = undefined;
            this.noResults = false;
        }
    }
    handleSelectTeacher(event) {
        }
}

