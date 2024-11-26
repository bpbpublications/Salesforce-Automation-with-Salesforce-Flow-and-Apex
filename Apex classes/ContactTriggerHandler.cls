public class ContactTriggerHandler {
    public static void handleContacts(List<Contact> lstNewContacts) {
        // Initialize a set to store unique Account IDs related to the Contacts being processed
        Set<Id> setAccountIds = new Set<Id>();

        // Collect Account IDs from the affected Contacts
        for (Contact con : lstNewContacts) {
            if (con.AccountId != null) { // Ensure AccountId is not null before adding
                setAccountIds.add(con.AccountId);
            }
        }

        // Query for related Accounts and the associated Contacts
        List<Account> lstAccountsToUpdate = [
            SELECT Id, Contact_Count__c, (SELECT Id FROM Contacts) 
            FROM Account 
            WHERE Id IN :setAccountIds
        ];

        // Update the custom field based on the number of related Contacts
        for (Account acc : lstAccountsToUpdate) {
            acc.Contact_Count__c = acc.Contacts.size(); // Set custom field to the number of related Contacts
        }

        // Update the Account records with modified Contact_Count__c values
        update lstAccountsToUpdate;
    }
}
