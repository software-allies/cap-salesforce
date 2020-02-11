@isTest
public class InitializeRecordsWithUUIDTest {
    @TestSetup
    static void background(){
        List<Account> accountsToCreate = new List<Account>();
        List<Contact> contactsToCreate = new List<Contact>();
        List<Lead> leadsToCreate = new List<Lead>();
        List<Opportunity> opportunitysToCreate = new List<Opportunity>();

        for(integer I=1; I<=5; I++){
            accountsToCreate.add(new Account(name='Test Account '+I));
            contactsToCreate.add(new Contact(FirstName='Test', LastName='Testing '+I));
            leadsToCreate.add(new Lead(FirstName='Test', LastName='Testing '+I, Company='Company Test'));
            opportunitysToCreate.add(new Opportunity(Name='Opportunity Test '+I, CloseDate = System.today(), StageName='Prospecting'));
        }

        insert accountsToCreate;
        insert contactsToCreate;
        insert leadsToCreate;
        insert opportunitysToCreate;

        for(Account record: accountsToCreate){
            record.SACAP__UUID__c = null;
        }
        update accountsToCreate;
        
        for(Contact record: contactsToCreate){
            record.SACAP__UUID__c = null;
        }
        update contactsToCreate;
        
        for(Lead record: leadsToCreate){
            record.SACAP__UUID__c = null;
        }
        update leadsToCreate;

        for(Opportunity record: opportunitysToCreate){
            record.SACAP__UUID__c = null;
        }
        update opportunitysToCreate;
    }

    static testMethod void testAccountsUUIDGeneration(){
        system.assertEquals(0, [SELECT Id FROM Account WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Contact WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Lead WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Opportunity WHERE SACAP__UUID__c != null].size());
        Test.startTest();
            InitializeRecordsWithUUID obj = new InitializeRecordsWithUUID('Account');
            DataBase.executeBatch(obj);
        Test.stopTest();
        system.assertEquals(5, [SELECT Id FROM Account WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Contact WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Lead WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Opportunity WHERE SACAP__UUID__c != null].size());
    }
    static testMethod void testContactsUUIDGeneration(){
        system.assertEquals(0, [SELECT Id FROM Account WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Contact WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Lead WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Opportunity WHERE SACAP__UUID__c != null].size());
        Test.startTest();
            InitializeRecordsWithUUID obj = new InitializeRecordsWithUUID('Contact');
            DataBase.executeBatch(obj);
        Test.stopTest();
        system.assertEquals(0, [SELECT Id FROM Account WHERE SACAP__UUID__c != null].size());
        system.assertEquals(5, [SELECT Id FROM Contact WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Lead WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Opportunity WHERE SACAP__UUID__c != null].size());
    }
    static testMethod void testLeadsUUIDGeneration(){
        system.assertEquals(0, [SELECT Id FROM Account WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Contact WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Lead WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Opportunity WHERE SACAP__UUID__c != null].size());
        Test.startTest();
            InitializeRecordsWithUUID obj = new InitializeRecordsWithUUID('Lead');
            DataBase.executeBatch(obj);
        Test.stopTest();
        system.assertEquals(0, [SELECT Id FROM Account WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Contact WHERE SACAP__UUID__c != null].size());
        system.assertEquals(5, [SELECT Id FROM Lead WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Opportunity WHERE SACAP__UUID__c != null].size());
    }
    static testMethod void testOpportunitiesUUIDGeneration(){
        system.assertEquals(0, [SELECT Id FROM Account WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Contact WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Lead WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Opportunity WHERE SACAP__UUID__c != null].size());
        Test.startTest();
            InitializeRecordsWithUUID obj = new InitializeRecordsWithUUID('Opportunity');
            DataBase.executeBatch(obj);
        Test.stopTest();
        system.assertEquals(0, [SELECT Id FROM Account WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Contact WHERE SACAP__UUID__c != null].size());
        system.assertEquals(0, [SELECT Id FROM Lead WHERE SACAP__UUID__c != null].size());
        system.assertEquals(5, [SELECT Id FROM Opportunity WHERE SACAP__UUID__c != null].size());
    }
}
