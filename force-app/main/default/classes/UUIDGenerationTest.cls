@isTest
public class UUIDGenerationTest
{
  static testMethod void testAccountUUIDGeneration(){
    Account newAccount = new Account(name='Test Account');
    Test.startTest();
        insert newAccount;
    Test.stopTest();
    system.assertNotEquals(null, [SELECT SACAP__UUID__c FROM Account WHERE Id =: newAccount.Id].SACAP__UUID__c);
  }
  static testMethod void testAccountWithUUID(){
    Account newAccount = new Account(name='Test Account', SACAP__UUID__c = '0aacc429-d654-e69e-bce2-765de19a736-');
    Test.startTest();
        insert newAccount;
    Test.stopTest();
    system.assertEquals('0aacc429-d654-e69e-bce2-765de19a736-', [SELECT SACAP__UUID__c FROM Account WHERE Id =: newAccount.Id].SACAP__UUID__c);
  }
  static testMethod void testContactUUIDGeneration(){
    Contact newContact = new Contact(FirstName='Test', LastName='Testing');
    Test.startTest();
        insert newContact;
    Test.stopTest();
    system.assertNotEquals(null, [SELECT SACAP__UUID__c FROM Contact WHERE Id =: newContact.Id].SACAP__UUID__c);
  }
  static testMethod void testContactWithUUID(){
    Contact newContact = new Contact(FirstName='Test', LastName='Testing', SACAP__UUID__c = '-aacc429-d654-e69e-bce2-765de19a736a');
    Test.startTest();
        insert newContact;
    Test.stopTest();
    system.assertEquals('-aacc429-d654-e69e-bce2-765de19a736a', [SELECT SACAP__UUID__c FROM Contact WHERE Id =: newContact.Id].SACAP__UUID__c);
  }
  static testMethod void testLeadUUIDGeneration(){
    Lead newLead = new Lead(FirstName='Test', LastName='Testing', Company='Company Test');
    Test.startTest();
        insert newLead;
    Test.stopTest();
    system.assertNotEquals(null, [SELECT SACAP__UUID__c FROM Lead WHERE Id =: newLead.Id].SACAP__UUID__c);
  }
  static testMethod void testLeadWithUUID(){
    Lead newLead = new Lead(FirstName='Test', LastName='Testing', Company='Company Test', SACAP__UUID__c = 'raacc429-d-54-e69e-bce2-765de19a736a');
    Test.startTest();
        insert newLead;
    Test.stopTest();
    system.assertEquals('raacc429-d-54-e69e-bce2-765de19a736a', [SELECT SACAP__UUID__c FROM Lead WHERE Id =: newLead.Id].SACAP__UUID__c);
  }
  static testMethod void testOpportunityUUIDGeneration(){
    Opportunity newOpportunity = new Opportunity(Name='Opportunity Test', CloseDate = System.today(), StageName='Prospecting');
    Test.startTest();
        insert newOpportunity;
    Test.stopTest();
    system.assertNotEquals(null, [SELECT SACAP__UUID__c FROM Opportunity WHERE Id =: newOpportunity.Id].SACAP__UUID__c);
  }
  static testMethod void testOpportunityWithUUID(){
    Opportunity newOpportunity = new Opportunity(Name='Opportunity Test', CloseDate = System.today(), StageName='Prospecting', SACAP__UUID__c = 'raacc429-d554-e-9e-bce2-765de19a736a');
    Test.startTest();
        insert newOpportunity;
    Test.stopTest();
    system.assertEquals('raacc429-d554-e-9e-bce2-765de19a736a', [SELECT SACAP__UUID__c FROM Opportunity WHERE Id =: newOpportunity.Id].SACAP__UUID__c);
  }
  static testMethod void testNewUUIDGenerator(){
      system.assertNotEquals(null, UtilityClass.newUUID());
  }
}