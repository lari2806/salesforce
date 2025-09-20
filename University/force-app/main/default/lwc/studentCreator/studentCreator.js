import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import STUDENT_OBJECT from '@salesforce/schema/Student__c';
import NAME_FIELD from '@salesforce/schema/Student__c.Name';
import REGISTRATION_FIELD from '@salesforce/schema/Student__c.Registration__c';
import STATUS_FIELD from '@salesforce/schema/Student__c.Status_Registration__c';
import COURSE from '@salesforce/schema/Student__c.Course__c';

import CITY_FIELD from '@salesforce/schema/Student__c.City__c';
import NEIGHBORHOOD_FIELD from '@salesforce/schema/Student__c.Neighborhood__c';
import CEP_FIELD from '@salesforce/schema/Student__c.Cep__c';
import STREET_FIELD from '@salesforce/schema/Student__c.Street__c';
import STATE_FIELD from '@salesforce/schema/Student__c.State__c';

import fieldCepStudents from '@salesforce/apex/StudentController.fieldCepStudents';

export default class StudentCreator extends LightningElement {
    studentName = NAME_FIELD;
    registrationStudent = REGISTRATION_FIELD;
    statusStudent = STATUS_FIELD;
    courseStudent = COURSE;

    cidadeStudent = CITY_FIELD;
    bairroStudent = NEIGHBORHOOD_FIELD; 
    cepStudent = CEP_FIELD;
    ruaStudent = STREET_FIELD;
    estadoStudent = STATE_FIELD;


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

     
    handleCepChange(event){
        this.cepStudent = event.detail.value;
        if(this.cepStudent.length == 8){
    fieldCepStudents({ cep: this.cepStudent })
            .then(result => {

                this.cepStudent = result.cep;
                this.ruaStudent = result.logradouro;
                this.bairroStudent = result.bairro;
                this.cidadeStudent = result.localidade;
                this.estadoStudent = result.uf;

                
            })
            .catch(error => {
                this.error = error;
            });
        }
        console.log('Cep do estudante:', result);
    }

}
