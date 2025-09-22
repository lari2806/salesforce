import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getCoursesByTeacher from '@salesforce/apex/TeacherController.getCoursesByTeacher';


const COLUMNS = [
    { label: 'Student Name', fieldName: 'StudentName', type: 'text' },
    { label: 'Course', fieldName: 'CourseName', type: 'text' },
    { label: 'Course Teacher', fieldName: 'CourseTeacher', type: 'text' },
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
        this.teachers = result.flatMap(course => 
    course.Students__r?.map(student => ({
        Id: student.Id,
        StudentName: student.Name,
        CourseName: course.Name,
        CourseTeacher: course.Teacher__r?.Name || ''
    })) || []
);

    })
    .catch(error => {
        this.error = error;
    });

}
}