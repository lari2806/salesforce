import { LightningElement } from 'lwc';

export default class CriarContatos extends LightningElement {

    handleContato(){
        const inputFields = this.template.querySelectorAll('lightning-input-field');
        if(inputFields){
            inputFields.forEach(
                field => {
                    field.reset();
                }
            );
        }
    }
}