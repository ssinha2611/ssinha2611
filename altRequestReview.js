import { LightningElement, api,track} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class LightningExampleAccordionBasic  extends LightningElement {
    @api recordId = '50075000001eAz7AAE'
    handleSubmit(event) {
        console.log('onsubmit event recordEditForm'+ event.detail.fields);
        this.customFormModal = false;
    }
    handleSuccess(event) {
        const event1 = new ShowToastEvent({
            variant: 'success',
            title: 'Success!',
            message: 'Record has been Updated'
            
        });
        this.dispatchEvent(event1);
    }
    activeSections = ['A', 'C'];
    activeSectionsMessage = '';

    handleSectionToggle(event) {
        const openSections = event.detail.openSections;

        if (openSections.length === 0) {
            this.activeSectionsMessage = 'All sections are closed';
        } else {
            this.activeSectionsMessage =
                'Open sections: ' + openSections.join(', ');
        }
    }
    @track customFormModal = false;
    
    customShowModalPopup() {
    
    this.customFormModal = true;
    
    }
    
    customHideModalPopup() {
    
    this.customFormModal = false;

    
    
    }
    customHideModalPopup() {
    
        this.customFormModal = false;
        
    }   
}