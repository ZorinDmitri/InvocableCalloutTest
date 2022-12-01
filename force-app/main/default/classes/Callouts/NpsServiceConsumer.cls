public with sharing class NpsServiceConsumer {
    private final static Integer RESPONSE_STATUS_OK = 200;

    @InvocableMethod(label = 'postOrders')
    public static void postOrders(List<Id> orderIds) {
		NPSSettings__mdt npsSettings = EndpointSelector.fetchEndpoint();

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(npsSettings.Url__c);
        request.setHeader('Content-Type','text/plain'); 

        String username = npsSettings.UserName__c;
        String password = npsSettings.Password__c;
        Blob tempBlob = Blob.valueOf(username + ':' + password);
        String authorization = 'BASIC ' +EncodingUtil.base64Encode(tempBlob);
        request.setHeader('Authorization', authorization);
            
        Order order = OrderSelector.fetchOrder(orderIds.get(0));
        String requestBody = '[{"sfId": "' + order.Id + '","orderNumber": "' + order.OrderNumber + '","customEmail": "' + order.Account.PersonEmail + '"}]';
        request.setBody(requestBody);
        request.setMethod('POST');

        try {
            HttpResponse response = http.send(request);
            Integer responseStatusCode = response.getStatusCode();
            if (responseStatusCode == RESPONSE_STATUS_OK) {
                System.debug('Ok!');
            }
        }
        catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }
    }
}
