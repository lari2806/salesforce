import { LightningElement, wire } from 'lwc';

export default class findStudents extends LightningElement {
displayInfo = {
    primaryField: 'Account.Name',
    additionalFields: ['Title'],
};
}