import { LightningElement, track } from 'lwc';
import searchAccounts from '@salesforce/apex/AccountController.searchAccounts';
export default class AccountSearch extends LightningElement {
    @track accounts;
    @track noResults = false;
    handleSearch(event) {
        const searchTerm = event.target.value;
        if (searchTerm) {
            searchAccounts({ searchKey: searchTerm })
                .then(result => {
                    this.accounts = result;
                    this.noResults = result.length === 0;
                })
                .catch(error => {
                    console.error('Error searching accounts: ', error);
                    this.accounts = undefined;
                    this.noResults = true;
                });
        } else {
            this.accounts = undefined;
            this.noResults = false;
        }
    }
}