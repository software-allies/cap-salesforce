public class AccountService {
    public static void setUUID(Account[] newAccounts){
        for(Account recordToUpdate: newAccounts){
            if(String.isBlank(recordToUpdate.UUID__c)){
                recordToUpdate.UUID__c = UtilityClass.newUUID();
            }
        }
    }
}
