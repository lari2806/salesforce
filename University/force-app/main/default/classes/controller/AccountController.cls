public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts(String searchKey) {
        // Prevent SOQL injection by escaping special characters
        String searchTerm = '%' + String.escapeSingleQuotes(searchKey) + '%';
// Perform the SOQL query
        return [
            SELECT Id, Name
            FROM Account
            WHERE Name LIKE :searchTerm
            LIMIT 10
        ];
    }
}