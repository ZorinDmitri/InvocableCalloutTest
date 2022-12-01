public with sharing class EndpointSelector {
    public static  NPSSettings__mdt fetchEndpoint() {
        return [SELECT Url__c, UserName__c, Password__c FROM NPSSettings__mdt].get(0);
    }
}
