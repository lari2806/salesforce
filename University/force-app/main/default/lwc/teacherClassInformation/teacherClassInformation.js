import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import NAME_FIELD from '@salesforce/schema/Student__c.Name';
import COURSE_FIELD from '@salesforce/schema/Student__c.Course__c';
import COURSE_TEACHER_FIELD from '@salesforce/schema/Course__c.Teacher__c';
import getCoursesByTeacher from '@salesforce/apex/teacherController.getCoursesByTeacher';


const COLUMNS = [
    { label: 'Student Name ', fieldName: NAME_FIELD.fieldApiName, type: 'text' },
    { label: 'Course', fieldName: COURSE_FIELD.fieldApiName, type: 'text' },
    { label: 'Course Teacher', fieldName: COURSE_TEACHER_FIELD.fieldApiName, type: 'text' },
];

export default class TeacherSearch extends NavigationMixin(LightningElement) {

    columns = COLUMNS;
    teachers = [];
    selectedTeacherCourses = false;

    teachersData({ data, error }) {
    if (data) {
      this.teachers = data;
      this.error = undefined;
    } else if (error) {
      this.error = error;
      this.teachers = undefined;
    }
  }
    handleSelectTeacher(event) {
    const selectedTeacherId = event.detail.recordId;
    this.selectedTeacherCourses = true;

    getCoursesByTeacher({ teacherId: selectedTeacherId })
    .then(result => {
        this.teachers = result.map(student => ({
            Id: student.Id,
            Name: student.Name,
            Course__c: student.Course__c,
            CourseTeacher: student.Course__r?.Teacher__c || ''
        }));
    })
    .catch(error => {
        this.error = error;
    });

}
}

