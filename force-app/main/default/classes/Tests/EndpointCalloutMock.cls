@isTest
public class EndpointCalloutMock implements HttpCalloutMock {
    private static final String RESPONSE_BODY = '{"status": "SUCCESS"}';
    public HttpResponse respond(HttpRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody(RESPONSE_BODY);
        res.setStatusCode(200);
        return res;
    }
}