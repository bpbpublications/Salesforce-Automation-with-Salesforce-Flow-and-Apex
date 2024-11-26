public class AccountTriggerHandler {
  public static void handleContactUpdate(List<Contact> lstContacts) {
      // Initialize a set to store unique Account IDs related to the Contacts being processed
      Set<Id> setAccountIds = new Set<Id>();

      // Collect Account IDs from the new Contacts
      for (Contact con : lstContacts) {
          if (con.AccountId != null) { // Check if AccountId is not null
              setAccountIds.add(con.AccountId); // Add each Contact's Account ID to the set
          }
      }

      // Query for related Accounts based on the collected Account IDs
      List<Account> lstAccountsToUpdate = [
          SELECT Id, Description
          FROM Account
          WHERE Id IN :setAccountIds
      ];

      // Loop through the queried Accounts and update the Description field
      for (Account acc : lstAccountsToUpdate) {
          acc.Description = 'Updated Description based on Contacts'; // Set a static value as a demo
      }

      // Update the Account records with modified Description field values
      update lstAccountsToUpdate;
  }
}
